Option Explicit Off
Option Strict Off

Imports System.Globalization
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class directapply
    Inherits webenrolmentcontrolvalidate

    Private Property IsAgeKnown() As Boolean
        Get
            If Session("DirectApply_IsAgeKnown") Is Nothing Then
                Return False
            End If

            Return CBool(Session("DirectApply_IsAgeKnown"))
        End Get
        Set(ByVal value As Boolean)
            Session("DirectApply_IsAgeKnown") = value
        End Set
    End Property

    Private Property CurrentAge() As Integer
        Get
            If Session("DirectApply_CurrentAge") Is Nothing Then
                Return 0
            End If

            Return CInt(Session("DirectApply_CurrentAge"))
        End Get
        Set(ByVal value As Integer)
            Session("DirectApply_CurrentAge") = value
        End Set
    End Property

    Private ReadOnly Property IsAge16To18() As Boolean
        Get
            Return IsAgeKnown AndAlso CurrentAge >= 16 AndAlso CurrentAge <= 18
        End Get
    End Property

    Private ReadOnly Property IsAge19Plus() As Boolean
        Get
            Return IsAgeKnown AndAlso CurrentAge >= 19
        End Get
    End Property

    Public Property intCurrentDisability() As Integer
        Get
            If HttpContext.Current.Session("intDisabilityRows") Is Nothing Then
                HttpContext.Current.Session("intDisabilityRows") = 0
            End If

            Return CInt(HttpContext.Current.Session("intDisabilityRows"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("intDisabilityRows") = Math.Max(value, 0)
        End Set
    End Property

    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            End If

            Return CInt(Me.Page.Request("OfferingID"))
        End Get
    End Property

    Public ReadOnly Property Offering1ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering1ID")) Then
                Return -1
            End If

            Return CInt(Me.Page.Request("Offering1ID"))
        End Get
    End Property

    Public ReadOnly Property Offering2ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering2ID")) Then
                Return -1
            End If

            Return CInt(Me.Page.Request("Offering2ID"))
        End Get
    End Property

    Public ReadOnly Property Offering3ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering3ID")) Then
                Return -1
            End If

            Return CInt(Me.Page.Request("Offering3ID"))
        End Get
    End Property

    Public ReadOnly Property Offering4ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering4ID")) Then
                Return -1
            End If

            Return CInt(Me.Page.Request("Offering4ID"))
        End Get
    End Property

    Public ReadOnly Property Offering5ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering5ID")) Then
                Return -1
            End If

            Return CInt(Me.Page.Request("Offering5ID"))
        End Get
    End Property

    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)

        Session("RequestMode") = RequestMode.ApplicationRequest
        Page.MaintainScrollPositionOnPostBack = True

        PutAllOfferingsInBasket()
        BuildHTML()

        If Not IsPostBack Then


        Else

        End If


    End Sub


    Private Sub PutAllOfferingsInBasket()
        AddOfferingToBasket(Offering1ID)
        AddOfferingToBasket(Offering2ID)
        AddOfferingToBasket(Offering3ID)
        AddOfferingToBasket(Offering4ID)
        AddOfferingToBasket(Offering5ID)
        AddOfferingToBasket(OfferingID)
    End Sub

    Private Sub AddOfferingToBasket(offeringId As Integer)
        If offeringId = -1 Then
            Exit Sub
        End If

        Dim tblOffering As New OfferingDataTable
        Dim view As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering)
        view.Columns.AddPKColumns()
        view.Columns.EnsureColumnsAreSelected(True, False, tblOffering.WebSiteAvailabilityIDColumn, tblOffering.CourseInformationIDColumn, tblOffering.TotalFeeAmountColumn)
        view.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, offeringId)
        tblOffering.TableAdapter.Load(tblOffering, view)

        If tblOffering.Count = 0 Then
            Exit Sub
        End If

        Dim item As New ShoppingCartItem()

        With tblOffering(0)
            item.Cost = .TotalFeeAmount.GetValueOrDefault()
            item.Description = .GetRowDescription()
            item.ItemType = "Application"
            item.OfferingID = .OfferingID.Value
            item.CourseInfoID = .CourseInformationID.GetValueOrDefault()
        End With

        With WorkingData.ShoppingCart
            If Not .Items.Contains(item) Then
                .Items.Add(item)
            End If
        End With
    End Sub

    Private Sub BuildHTML()
        BasketPlaceHolder.Controls.Clear()
        BasketPlaceHolder.Controls.Add(New LiteralControl("<div class=""application-form__course-list"">"))

        For Each item As ShoppingCartItem In WorkingData.ShoppingCart.Items
            BasketPlaceHolder.Controls.Add(New LiteralControl("<div class=""application-form__course"">"))
            BasketPlaceHolder.Controls.Add(New LiteralControl("<h3>" & Server.HtmlEncode(item.Description) & "</h3>"))
            BasketPlaceHolder.Controls.Add(New LiteralControl("<p>Application</p>"))
            BasketPlaceHolder.Controls.Add(New LiteralControl("</div>"))
        Next

        BasketPlaceHolder.Controls.Add(New LiteralControl("</div>"))
    End Sub

    Private Sub CalculateAgeFlags()
        IsAgeKnown = False
        CurrentAge = 0

        Dim dateOfBirthValue As DateTime? = TryGetDateOfBirth()

        If Not dateOfBirthValue.HasValue Then
            Exit Sub
        End If

        Dim ageValue As Integer = Date.Today.Year - dateOfBirthValue.Value.Year

        If Date.Today < dateOfBirthValue.Value.AddYears(ageValue) Then
            ageValue -= 1
        End If

        IsAgeKnown = True
        CurrentAge = ageValue
    End Sub

    Private Function TryGetDateOfBirth() As DateTime?
        Try
            If fldDateOfBirth.Value <> String.Empty Then
                Return CDate(fldDateOfBirth.Value)
            End If
        Catch
        End Try

        Try
            If Not DBNull.Value.Equals(WorkingData.ApplicationRequestRow.DateOfBirth) Then
                Return CDate(WorkingData.ApplicationRequestRow.DateOfBirth)
            End If
        Catch
        End Try

        Return Nothing
    End Function



    Private Sub AddValidationError(errorMessage As String)
        Dim validator As New CustomValidator()
        validator.ErrorMessage = errorMessage
        validator.IsValid = False
        Me.Page.Validators.Add(validator)
    End Sub

    Public Overrides Sub ValidateControl()
        CalculateAgeFlags()


        If WorkingData.ShoppingCart Is Nothing OrElse WorkingData.ShoppingCart.Items.Count = 0 Then
            AddValidationError("You must have at least one course in your basket.")
        End If

        If fldTitle.Value = String.Empty Then AddValidationError("Please select your title.")
        If fldForename.Value = String.Empty Then AddValidationError("Please enter your first name.")
        If fldSurname.Value = String.Empty Then AddValidationError("Please enter your surname.")
        If fldDateOfBirth.Value = String.Empty Then AddValidationError("Please enter your date of birth.")
        If fldGenderType.Value = String.Empty Then AddValidationError("Please select your gender.")
        If fldMobileTel.Value = String.Empty Then AddValidationError("Please enter your mobile number.")
        If fldEmail.Value = String.Empty Then AddValidationError("Please enter your email address.")

        If txtAddress1.Value = String.Empty Then AddValidationError("Please enter address line 1.")
        If postcode.Value = String.Empty Then AddValidationError("Please enter your postcode.")
        If txtYearsAtCurrentAddress.Text.Trim() = String.Empty Then AddValidationError("Please enter years at current address.")



        MyBase.ValidateControl()
    End Sub

    Private Sub CheckData()
        Dim cleanPostcode As String = postcode.Value.Replace(" ", "").Trim().ToUpperInvariant()

        If cleanPostcode.Length > 3 Then
            WorkingData.ApplicationRequestRow.PostcodeOut = cleanPostcode.Substring(0, cleanPostcode.Length - 3)
            WorkingData.ApplicationRequestRow.PostcodeIn = cleanPostcode.Substring(cleanPostcode.Length - 3)
        Else
            WorkingData.ApplicationRequestRow.PostcodeOut = cleanPostcode
            WorkingData.ApplicationRequestRow.PostcodeIn = String.Empty
        End If

        If txtYearsAtCurrentAddress.Text.Trim() <> String.Empty Then
            WorkingData.ApplicationRequestRow.NumberOfYearsAtCurrentAddress = CInt(txtYearsAtCurrentAddress.Text.Trim())
        End If


    End Sub

    Private Function GetSelectedText(list As RadioButtonList) As String
        If list Is Nothing OrElse list.SelectedItem Is Nothing Then
            Return String.Empty
        End If

        Return list.SelectedItem.Text
    End Function




    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click
        Me.Page.Validate()

        If Me.Page.IsValid Then
            CheckData()
            Response.Redirect(GetResourceValue("directapply2_aspx"))
        End If
    End Sub
End Class