Imports System.Linq
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class employment
    Inherits CheckoutBaseControl

    Public tblOffering As New OfferingDataTable
    Public OfferingRow As OfferingRow

    Public ReferenceDate As Date
    Public Age19DOB As Date
    Public IsUnder19 As Boolean
    Public IsUnder18 As Boolean

    Public Is19PlusOutsideAreaConfirmed As Boolean

    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        GetCourseDetails()
        SetAgeChecks()

        Is19PlusOutsideAreaConfirmed = CBool(Session("19PlusOutsideAreaConfirmed"))

        If Not (IsPostBack) Then

            If WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentStatusID <> "" Then
                selectEmployed.SelectedValue = WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentStatusID
            End If
            If WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentIntensityID <> "" Then
                selectEmploymentIntensity.SelectedValue = WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentIntensityID
            End If
            If WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfEmploymentID <> "" Then
                selectEmploymentLength.SelectedValue = WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfEmploymentID
            End If
            If WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfUnemploymentID <> "" Then
                selectLengthUnemployed.SelectedValue = WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfUnemploymentID
            End If
            ' If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined43 = "True" Then chkOtherStateBen.checked = True
            ' If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined43 = "False" Then chkOtherStateBen.Checked = False


            If WorkingData.EnrolmentRequestEmploymentHistoryRow.IsSelfEmployed Then
                rdoSelfEmp.SelectedValue = 1
            Else
                rdoSelfEmp.SelectedValue = 0
            End If

        End If

        If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined10 = "Y" Then
            chkLowWage.Checked = True
        End If

    End Sub

    Public Overrides Sub RenderControl(writer As HtmlTextWriter)

        'Show older guidance for learners enrolling to current year rather than next year
        If OfferingRow.AcademicYearID <= "25/26" Then
            chkLowWage.Text = "Tick this box if you earn less than &pound;25,750 per year in gross pay"
            lblLowWageThreshold.Text = "&pound;25,750"
        End If

        MyBase.RenderControl(writer)
    End Sub

    Public Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then


            WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentStatusID = selectEmployed.SelectedValue
            WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentIntensityID = selectEmploymentIntensity.SelectedValue
            WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfEmploymentID = selectEmploymentLength.SelectedValue
            WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfUnemploymentID = selectLengthUnemployed.SelectedValue


            If rdoSelfEmp.SelectedValue.ToString.Length > 0 Then
                WorkingData.EnrolmentRequestEmploymentHistoryRow.IsSelfEmployed = rdoSelfEmp.SelectedValue
            End If

            If Not IsNothing(chkLowWage) Then
                If chkLowWage.Checked = True Then
                    WorkingData.EnrolmentRequestRow.StudentDetailUserDefined10 = "Y"
                End If
            End If


            Response.Redirect(GetResourceValue("apply_attachments"))

        End If
    End Sub

    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click


        Response.Redirect(GetResourceValue("apply_quals_on_entry"))


    End Sub


    Public Overrides Sub ValidateControl()
        If selectEmployed.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please tell us your employment status"
            v.IsValid = False
            Me.Page.Validators.Add(v)
            selectEmployed.Style.Add("border", "1px solid red")
        End If

        If selectEmployed.SelectedValue = "11" Or selectEmployed.SelectedValue = "12" Then
            If selectLengthUnemployed.SelectedValue = "" Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Length of of time unemployed must be provided"
                v.IsValid = False
                Me.Page.Validators.Add(v)
                selectLengthUnemployed.Style.Add("border", "1px solid red")
            End If

        End If
        If selectEmployed.SelectedValue = "10" Then
            If selectEmploymentIntensity.SelectedValue = "" Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Hours per week must be provided"
                v.IsValid = False
                Me.Page.Validators.Add(v)
                selectEmploymentIntensity.Style.Add("border", "1px solid red")
            End If

            If selectEmploymentLength.SelectedValue = "" Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Length of time in employment must be provided"
                v.IsValid = False
                Me.Page.Validators.Add(v)
                selectEmploymentLength.Style.Add("border", "1px solid red")
            End If

            If Not IsDate(WorkingData.EnrolmentRequestEmploymentHistoryRow.DateFrom) Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Employment from date must be provided"
                v.IsValid = False
                Me.Page.Validators.Add(v)
            End If

            'Employed check for EII and LOE and SelfEmp
            If Not (rdoSelfEmp.SelectedValue = "1" Or rdoSelfEmp.SelectedValue = "0") Then
                Dim a As New CustomValidator
                a.IsValid = False
                a.ErrorMessage = "If you are Employed, are you self employed?"
                Me.Page.Validators.Add(a)
                ValidationSummary.CssClass = "error"
            End If

        End If
        MyBase.ValidateControl()
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
