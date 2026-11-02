'Option Explicit On
'Option Strict On

Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports Microsoft.VisualBasic.ApplicationServices
Imports System.Data
Imports PdfSharp.Pdf.Content.Objects
Imports CommandType = System.Data.CommandType
Imports System.Data.SqlClient
Imports System.Linq


Partial Class next_of_kin
    Inherits CheckoutBaseControl

    Public tblOffering As New OfferingDataTable
    Public OfferingRow As OfferingRow

    Public ReferenceDate As Date
    Public Age19DOB As Date
    Public IsUnder19 As Boolean
    Public IsUnder18 As Boolean

    Public ConsentRequired As Boolean

    Protected Overrides Sub OnLoad(e As EventArgs)
        ConsentRequired = True
        SetAgeChecks()
        GetCourseDetails()

        If IsUnder19 Then 'Under 18
            ConsentRequired = True
        Else
            ConsentRequired = False
        End If

        If IsPostBack Then
            ' UpdateAddress()
        Else
            postcode.Value = WorkingData.EnrolmentRequestRow.ParentPostCodeOut + WorkingData.EnrolmentRequestRow.ParentPostCodeIn
            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined14 <> "" Then
                ddConsent.SelectedValue = WorkingData.EnrolmentRequestRow.StudentDetailUserDefined14
            End If

        End If

        MyBase.OnLoad(e)
        ''show course name 
    End Sub

    Public Overrides Sub RenderControl(writer As HtmlTextWriter)

        'Move common items to top of dropdown list
        Dim fldParentRelationshipDropDown As DropDownList = TryCast(fldParentRelationshipID.InternalFieldControl, DropDownList)
        Dim fldParentRelationshipDropDownParent = fldParentRelationshipDropDown.Items.FindByValue("11")
        fldParentRelationshipDropDown.Items.Remove(fldParentRelationshipDropDownParent)
        fldParentRelationshipDropDown.Items.Insert(1, fldParentRelationshipDropDownParent)

        MyBase.RenderControl(writer)
    End Sub

    Public Overrides Sub ValidateControl()

        'Mobile Tel
        If Not IsNothing(fldParentMobileTel) And Not IsNothing(fldParentPhoneNumber) Then
            If String.IsNullOrEmpty(fldParentMobileTel.Value) And String.IsNullOrEmpty(fldParentPhoneNumber.Value) Then
                fldMobileTelValidator.ErrorMessage = "Please enter at least one Parent, Guardian or Carer Telephone number."
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldParentMobileTel.CssClass = "ErrorInput"
                fldParentPhoneNumber.CssClass = "ErrorInput"
            ElseIf fldParentMobileTel.Value.ToString.Length <> 11 Then
                fldMobileTelValidator.ErrorMessage = "Your Parent, Guardian or Carer mobile phone number must be 11 digits long"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldParentMobileTel.CssClass = "ErrorInput"
                fldParentPhoneNumber.CssClass = "ErrorInput"
            ElseIf Not fldParentMobileTel.Value.ToString.StartsWith("07") Then
                fldMobileTelValidator.ErrorMessage = "Your Parent, Guardian or Carer mobile phone number must start with 07"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldParentMobileTel.CssClass = "ErrorInput"
                fldParentPhoneNumber.CssClass = "ErrorInput"
            ElseIf fldParentMobileTel.Value.ToString = WorkingData.EnrolmentRequestRow.MobileTel Then
                fldMobileTelValidator.ErrorMessage = "You must provide a different emergency contact number to your own mobile number " + WorkingData.EnrolmentRequestRow.MobileTel
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldParentMobileTel.CssClass = "ErrorInput"
                fldParentPhoneNumber.CssClass = "ErrorInput"
            End If
        End If


        If WorkingData.EnrolmentRequestRow.Email = WorkingData.EnrolmentRequestRow.ParentEmailAddress Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must provide a different emergency email address to your own email address " + WorkingData.EnrolmentRequestRow.Email
            v.IsValid = False
            Me.Page.Validators.Add(v)

        End If

        'Parental Relationship
        If Not IsNothing(fldParentRelationshipID) Then
            If String.IsNullOrEmpty(fldParentRelationshipID.Value) Then
                fldParentRelationshipIDValidator.ErrorMessage = "Parental Relationship must not be blank"
                fldParentRelationshipIDValidator.IsValid = False
                fldParentRelationshipIDValidator.CssClass = "error alert alert-danger"
                fldParentRelationshipID.CssClass = "ErrorInput"
            End If
        End If

        'Post Code
        Dim regexPostCode As New Regex("^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$")
        If Not IsNothing(postcode) Then
            Dim match As Match = regexPostCode.Match(postcode.Value)
            If Not match.Success Then
                postcodeValidator.ErrorMessage = "Please enter a valid Postcode"
                postcodeValidator.IsValid = False
                postcodeValidator.CssClass = "error alert alert-danger"
                postcode.Attributes.Add("Class", "textfield form-control ErrorInput")
            End If
        End If

        'Only mandatory if under 18, check the age in UDF
        If ddConsent.SelectedValue = "" And ConsentRequired = True Then
            Dim v As New CustomValidator
            v.ErrorMessage = "We would also like to discuss your progress on your course with your parents/guardian/carer. Please confirm if you consent"
            v.IsValid = False
            Me.Page.Validators.Add(v)
            ddConsent.Style.Add("border", "1px solid red")
        End If


        'lewis @adnvanced
        'Dim regexEmail As New Regex("^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$")
        'Dim matchE As Match = regexEmail.Match(fldEmail.Value)
        'If Not matchE.Success Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Please enter a valid email"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If

        MyBase.ValidateControl()
    End Sub


    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        'Response.Write(ddConsent.SelectedValue)
        Me.Page.Validate()


        If Me.Page.IsValid Then
            'Set Is Emergency Contact to true if NOK fields are filled in
            If Not String.IsNullOrEmpty(fldParentFirstName.Value) Then
                WorkingData.EnrolmentRequestRow.NextOfKin = 1
            End If

            WorkingData.EnrolmentRequestRow.ParentAddress1 = txtAddress1.Value
            WorkingData.EnrolmentRequestRow.ParentAddress2 = txtAddress2.Value
            WorkingData.EnrolmentRequestRow.ParentAddress3 = txtAddress3.Value
            WorkingData.EnrolmentRequestRow.ParentAddress4 = txtAddress4.Value

            Dim pcode As String = Replace(postcode.Value, " ", "")
            If Len(pcode) > 0 Then

                'avoid dodgy postcodes breaking system
                Try
                    If pcode.Substring(0, pcode.Length - 3).Length <= 4 Then
                        WorkingData.EnrolmentRequestRow.ParentPostCodeOut = pcode.Substring(0, pcode.Length - 3)
                    Else
                        WorkingData.EnrolmentRequestRow.ParentPostCodeOut = ""
                    End If

                Catch ex As ArgumentOutOfRangeException
                    WorkingData.EnrolmentRequestRow.ParentPostCodeOut = ""
                End Try

                Try
                    WorkingData.EnrolmentRequestRow.ParentPostCodeIn = Right(pcode, 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.EnrolmentRequestRow.ParentPostCodeIn = ""
                End Try

            End If

            If ddConsent.SelectedValue <> "" Then
                WorkingData.EnrolmentRequestRow.StudentDetailUserDefined14 = ddConsent.SelectedValue
            Else
                WorkingData.EnrolmentRequestRow.StudentDetailUserDefined14 = ""
            End If

            '            Dim blnApplicationsOnly As Boolean = WorkingData.ShoppingCart IsNot Nothing AndAlso Not WorkingData.ShoppingCart.ContainsItemsOfType("Enrolment")
        End If

    End Sub

    Public Function SetAgeChecks() As Boolean
        Dim dateOfBirthDate As Date?
        Dim referenceDate As DateTime = CDate(Today().Year & "-08-31")

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
