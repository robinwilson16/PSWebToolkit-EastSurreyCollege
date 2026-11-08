Imports System.Data
Imports System.Data.SqlClient
Imports System.Linq
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports Microsoft.VisualBasic.ApplicationServices
Imports PdfSharp.Pdf.Content.Objects
Imports CommandType = System.Data.CommandType

Partial Class data_protection
    Inherits CheckoutBaseControl

    Public tblOffering As New OfferingDataTable
    Public OfferingRow As OfferingRow

    Public ReferenceDate As Date
    Public Age19DOB As Date
    Public IsUnder19 As Boolean
    Public IsUnder18 As Boolean

    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        GetCourseDetails()
        SetAgeChecks()

        If WorkingData.EnrolmentRequestRow.AcceptMarketingConsent = True Then
            selectStayingInTouch.SelectedValue = "1"
        End If

        Dim p As New PaymentSubmitter

    End Sub

    Public Overrides Sub ValidateControl()

        If Not IsNothing(selectStayingInTouch) Then
            If selectStayingInTouch.SelectedValue = "" Then
                selectStayingInTouchValidator.ErrorMessage = "Staying in touch cannot be blank."
                selectStayingInTouchValidator.IsValid = False
                selectStayingInTouchValidator.CssClass = "error alert alert-danger"
                selectStayingInTouch.CssClass = "ErrorInput"
            End If
        End If

        If Not IsNothing(selectSMSConsent) Then
            If selectSMSConsent.SelectedValue = "" Then
                selectSMSConsentValidator.ErrorMessage = "Please confirm you consent to the use of SMS."
                selectSMSConsentValidator.IsValid = False
                selectSMSConsentValidator.CssClass = "error alert alert-danger"
                selectSMSConsent.CssClass = "ErrorInput"
            End If
        End If

        If Not IsNothing(chkConfirm) Then
            If Not chkConfirm.Checked = True Then
                chkConfirmValidator.ErrorMessage = "Please confirm that you have read the declaration above."
                chkConfirmValidator.IsValid = False
                chkConfirmValidator.CssClass = "error alert alert-danger"
                chkConfirm.CssClass = "ErrorInput"
            End If
        End If

        If Not IsNothing(IsSigned) And Not IsNothing(IsSignedComplex) Then
            If Not IsSigned.Checked = True Then
                signatureValidator.ErrorMessage = "Please sign to confirm that you acknowledge the statements above."
                signatureValidator.IsValid = False
                signatureValidator.CssClass = "error alert alert-danger"
                signature.Attributes.Add("Class", "textfield form-control ErrorInput")
            ElseIf Not IsSignedComplex.Checked = True Then
                signatureValidator.ErrorMessage = "Please sign your name more fully to confirm that you acknowledge the statements above."
                signatureValidator.IsValid = False
                signatureValidator.CssClass = "error alert alert-danger"
                signature.Attributes.Add("Class", "textfield form-control ErrorInput")
            End If
        End If

        MyBase.ValidateControl()
    End Sub

    Private Sub CheckData()

        WorkingData.EnrolmentRequestRow.SentMarketingInfo = selectStayingInTouch.SelectedValue
        WorkingData.EnrolmentRequestRow.StudentSignature = Signature.Signature

    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        ValidateControl()

        If Me.Page.IsValid Then

            CheckData()

            If selectStayingInTouch.SelectedValue = "1" Then
                WorkingData.EnrolmentRequestRow.AcceptMarketingConsent = True
            End If

            If selectSMSConsent.SelectedValue = "1" Then
                WorkingData.EnrolmentRequestRow.CanBeContactBySMS = True
            End If
            'used to store age but now clear them down
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = ""
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = ""
            ''to avoid going to payment provider, no fees for 1618
            Dim item As New ShoppingCartItem()
            With WorkingData.ShoppingCart
                If Not .Items.Contains(item) Then
                    item.Cost = 0
                End If
            End With
            Server.Transfer(GetResourceValue("checkout_makepayment_aspx"))

        End If

    End Sub

    Public Function SetAgeChecks() As Boolean
        Dim academicYear As String = OfferingRow.AcademicYearID
        Dim referenceDataString = Today().Year.ToString().Substring(0, 2) & academicYear.Substring(3, 2) & "-08-31"

        Dim dateOfBirthDate As Date?
        Dim referenceDate As DateTime = CDate(referenceDataString)

        If Not IsNothing(WorkingData.EnrolmentRequestRow.DateOfBirth) Then
            If Not String.IsNullOrEmpty(WorkingData.EnrolmentRequestRow.DateOfBirth.Value) Then
                dateOfBirthDate = CType(WorkingData.EnrolmentRequestRow.DateOfBirth.Value, Date)
            End If
            Dim age19DOB As DateTime = referenceDate.AddYears(-19)
            If Not IsNothing(dateOfBirthDate) And dateOfBirthDate > age19DOB Then 'Under 19
                IsUnder19 = True
            Else
                IsUnder19 = False
            End If
            Dim age18DOB As DateTime = referenceDate.AddYears(-18)
            If Not IsNothing(dateOfBirthDate) And dateOfBirthDate > age18DOB Then 'Under 18
                IsUnder18 = True
            Else
                IsUnder18 = False
            End If
        End If
        Return True
    End Function

    Private Sub GetCourseDetails()
        Dim intOfferingID As Integer = OfferingID()
        If intOfferingID <> -1 Then

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
            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, intOfferingID)
            tblOffering.TableAdapter.Load(tblOffering, vOffering)

            OfferingRow = tblOffering.FirstOrDefault()
        Else
            OfferingRow = tblOffering.NewRow
        End If
    End Sub

    Public ReadOnly Property OfferingID() As Integer
        Get
            If CInt(HttpContext.Current.Request.QueryString("OfferingID")) > 0 Then
                Return CInt(HttpContext.Current.Request.QueryString("OfferingID"))
            ElseIf Not IsNothing(WorkingData.ShoppingCart.Items(0).OfferingID) Then
                Return WorkingData.ShoppingCart.Items(0).OfferingID
            ElseIf Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return Nothing
            End If
        End Get
    End Property
End Class
