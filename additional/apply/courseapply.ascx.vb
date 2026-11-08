Option Explicit On
Option Strict Off

Imports System.Collections.Generic
Imports System.Linq
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class courseapply
    Inherits webenrolmentcontrolvalidate

    Public tblOffering As New OfferingDataTable
    Public NewOfferingRow As OfferingRow
    Public OfferingRow As OfferingRow
    Public tblOfferingType As New OfferingTypeDataTable
    Public OfferingTypeRow As OfferingTypeRow

    Public tblOfferingFee As New OfferingFeeDataTable
    Public CourseFee As OfferingFeeRow
    Public CourseInformationTitle As String
    Public OfferingTypeName As String

    Public HasFormErrors As Boolean = False


    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("OfferingID"))
            End If
        End Get
    End Property

    Public ReadOnly Property RefNo() As String
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("StudentRef")) Then
                Return Nothing
            Else
                Return Me.Page.Request("StudentRef")
            End If
        End Get
    End Property


    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)

        If Not IsPostBack Then
            Dim i As Byte = 1
            For Each c As ShoppingCartItem In WorkingData.ShoppingCart.Items
                c.ChoiceNumber = i
                i = CByte(i + 1)
            Next
        End If

        PutAllOfferingsInBasket()

        If WorkingData.ShoppingCart.Items.Count > 0 Then
            If OfferingID() > 0 Then
                NewOfferingRow = OfferingDataTable.FetchByOfferingID(OfferingID())
            End If

            If Not IsNothing(NewOfferingRow) Then
                CourseInformationTitle = CourseInformationDataTableAdapter.GetCourseInformationDescription(CInt(NewOfferingRow.CourseInformationID))
                CourseFee = OfferingFeeDataTableAdapter.GetOfferingFeeRow(CInt(NewOfferingRow.OfferingID), 1, 0)
            Else
                CourseInformationTitle = String.Empty
                CourseFee = tblOfferingFee.NewRow
            End If

            If Not IsPostBack Then
                WorkingData.EnrolmentRequestRow.RefNo = RefNo()
            Else

                Page.MaintainScrollPositionOnPostBack = True

            End If
        Else
            'Assign blank row to avoid runtime errors
            OfferingRow = tblOffering.NewRow
            OfferingTypeRow = tblOfferingType.NewRow
        End If

        rptOfferings.DataSource = tblOffering
        rptOfferings.DataBind()
    End Sub

    ''Put offerings in basket
    Protected Sub PutAllOfferingsInBasket()

        'Dim intOfferingID As Integer = Me.OfferingID
        'If intOfferingID <> -1 Then

        'Add new Offering to the list of offerings
        Dim stb As New Text.StringBuilder
        If OfferingID > 0 And Not IsPostBack Then
            stb.Append(OfferingID)
        End If

        'Load all offerings currently in the shopping basket
        For Each item As ShoppingCartItem In WorkingData.ShoppingCart.Items
            If stb.Length > 0 Then stb.Append(",")
            stb.Append(item.OfferingID)
        Next

        'Dim tblOffering As New OfferingDataTable
        Dim vOffering As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering)
        vOffering.Columns.AddPKColumns()
        vOffering.Columns.EnsureColumnsAreSelected(
            True,
            False,
            tblOffering.AcademicYearIDColumn,
            tblOffering.WebSiteAvailabilityIDColumn,
            tblOffering.CollegeLevelCodeColumn,
            tblOffering.CollegeLevelNameColumn,
            tblOffering.CourseInformationColumn,
            tblOffering.CourseHeaderNameColumn,
            tblOffering.CourseInformationIDColumn,
            tblOffering.TotalFeeAmountColumn,
            tblOffering.OfferingTypeIDColumn,
            tblOffering.StartTimeColumn,
            tblOffering.DayOfWeekColumn,
            tblOffering.StartDateColumn,
            tblOffering.EndDateColumn,
            tblOffering.SiteDescriptionColumn,
            tblOffering.EndTimeColumn,
            tblOffering.SIDColumn
        )
        vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)
        'vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, intOfferingID)
        vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)
        tblOffering.TableAdapter.Load(tblOffering, vOffering)

        If tblOffering.Count > 0 AndAlso tblOffering(0).WebSiteAvailabilityID.HasValue Then
            OfferingRow = tblOffering.FirstOrDefault()

            Dim intOfferingTypeID As Integer = OfferingRow.OfferingTypeID.GetValueOrDefault
            Dim tblOfferingType As New OfferingTypeDataTable
            Dim vt As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOfferingType)
            vt.Columns.AddPKColumns()
            vt.Columns.EnsureColumnsAreSelected(True, False, tblOfferingType.OfferingTypeIDColumn, tblOfferingType.DescriptionColumn)
            vt.Filters.SetColumnFilter(tblOfferingType.OfferingTypeIDColumn, intOfferingTypeID)
            tblOfferingType.TableAdapter.Load(tblOfferingType, vt)

            OfferingTypeRow = tblOfferingType.FirstOrDefault()

            For Each tblOfferingRow As OfferingRow In tblOffering
                Dim item As New ShoppingCartItem()
                With tblOfferingRow
                    item.Cost = 0
                    item.Description = .GetRowDescription
                    item.ItemType = "Application"
                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault
                    Session("RequestMode") = RequestMode.ApplicationRequest
                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Any(Function(existingItem As ShoppingCartItem) existingItem.OfferingID = item.OfferingID) Then
                        .Items.Add(item)
                    End If
                End With
            Next
        Else
            'Assign blank row to avoid runtime errors
            OfferingRow = tblOffering.NewRow
            OfferingTypeRow = tblOfferingType.NewRow
        End If

        'Me.GridView1.DataSource = tblOffering
        'Me.GridView1.DataBind()
        'Me.GridView1.Visible = True

    End Sub

    Protected Sub RemoveFromBasket_Click(sender As Object, e As EventArgs)
        Dim btn As LinkButton = DirectCast(sender, LinkButton)

        If btn.CommandName = "Delete" Then
            Dim offeringID As Integer = CInt(btn.CommandArgument)
            Do While WorkingData.ShoppingCart.Items.Any(Function(item As ShoppingCartItem) item.OfferingID = offeringID)
                WorkingData.ShoppingCart.Items.Remove(offeringID)
            Loop

            Dim i As Byte = 1
            For Each item As ShoppingCartItem In WorkingData.ShoppingCart.Items
                item.ChoiceNumber = i
                i = CByte(i + 1)
            Next

            'Dim query = System.Web.HttpUtility.ParseQueryString(Request.Url.Query)
            'query.Remove("OfferingID")

            'Dim redirectUrl As String = Request.Url.AbsolutePath

            'If query.Count > 0 Then
            '    redirectUrl &= "?" & query.ToString()
            'End If

            'Response.Redirect(redirectUrl, False)
            'Context.ApplicationInstance.CompleteRequest()

            'PutAllOfferingsInBasket()

            tblOffering.Clear()
            PutAllOfferingsInBasket()

            rptOfferings.DataSource = tblOffering
            rptOfferings.DataBind()
        End If
    End Sub



    Public Overrides Sub RenderControl(writer As HtmlTextWriter)

        MyBase.RenderControl(writer)

    End Sub

    ''Databind the Grid
    'Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        Dim OfferingID As Integer = CInt(DataBinder.Eval(e.Row.DataItem, "OfferingID"))
    '    End If
    'End Sub
End Class
