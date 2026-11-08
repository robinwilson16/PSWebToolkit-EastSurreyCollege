'Option Explicit On
'Option Strict On

Imports System.Data
Imports System.Data.SqlClient
Imports System.Linq
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports Microsoft.VisualBasic.ApplicationServices
Imports PdfSharp.Pdf.Content.Objects
Imports CommandType = System.Data.CommandType

Partial Class personal_details
    Inherits CheckoutBaseControl

    Public tblOffering As New OfferingDataTable
    Public OfferingRow As OfferingRow

    Public ReferenceDate As Date
    Public Age19DOB As Date
    Public IsUnder19 As Boolean
    Public IsUnder18 As Boolean

    Public MinAgeAllowed As Integer = 15
    Public MaxAgeAllowed As Integer = 70

    Protected Overrides Sub OnLoad(e As EventArgs)
        GetCourseDetails()
        SetAgeChecks()

        If IsUnder19 = False Then
            fldNI.IsRequired = True
        End If

        'Show back button if arrived here from search
        If Not IsNothing(Request.UrlReferrer) Then
            If Request.UrlReferrer.ToString.Contains("Dept=") Or Request.UrlReferrer.ToString.Contains("Search=") Then
                'ShowBackButton = True
            End If
        End If

        If IsDate(WorkingData.EnrolmentRequestRow.DateOfBirth) Then
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth.GetValueOrDefault, Date), ReferenceDate) / 365.25)
        End If

        If IsDate(WorkingData.EnrolmentRequestRow.DateOfBirth) And IsDate(OfferingDataTable.FetchByOfferingID(OfferingID).StartDate) Then
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth.GetValueOrDefault, Date), OfferingDataTable.FetchByOfferingID(OfferingID).StartDate.GetValueOrDefault) / 365.25)
        End If


        If IsPostBack Then
            '   UpdateAddress()

            If ddCollegeAccomodation.SelectedValue = "1" Then
                RadioButtonListAlt.SelectedValue = 1 'Different Address
            End If

        Else
            postcode.Value = WorkingData.EnrolmentRequestRow.PostcodeOut + WorkingData.EnrolmentRequestRow.PostcodeIn
            AltPostcode.Value = WorkingData.EnrolmentRequestRow.AltPostcodeOut + WorkingData.EnrolmentRequestRow.AltPostcodeIn
        End If

        If Not IsPostBack Then

            'Booleans default to false when not set
            If WorkingData.EnrolmentRequestRow.FirstForename = "" Then
                WorkingData.EnrolmentRequestRow.YoungParent = Nothing
                WorkingData.EnrolmentRequestRow.EMAConfirmed = Nothing
            End If

            If WorkingData.EnrolmentRequestRow.EMAConfirmed = True Then
                fldKnownToYouthJustice.SelectedValue = "Yes"
            ElseIf WorkingData.EnrolmentRequestRow.EMAConfirmed = False Then
                fldKnownToYouthJustice.SelectedValue = "No"
            End If

            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined50 = "True" Then
                fldParentCarerInPrison.SelectedValue = "Yes"
            ElseIf WorkingData.EnrolmentRequestRow.StudentDetailUserDefined50 = "False" Then
                fldParentCarerInPrison.SelectedValue = "No"
            End If

            If WorkingData.EnrolmentRequestRow.AccommodationTypeID = 11 Then
                ddCollegeAccomodation.SelectedValue = 1
            ElseIf WorkingData.EnrolmentRequestRow.AccommodationTypeID > 0 Then
                ddCollegeAccomodation.SelectedValue = 0
            Else
                ddCollegeAccomodation.SelectedValue = Nothing
            End If

            'Booleans default to false when not set
            If IsNothing(WorkingData.EnrolmentRequestRow.FirstForename) Then
                WorkingData.EnrolmentRequestRow.StudyElsewhere = Nothing
            End If

        End If

        'WorkingData.EnrolmentRequestRow.Title = "Mr"
        'WorkingData.EnrolmentRequestRow.Surname = "test"
        'WorkingData.ApplicationRequestRow.ApplicationTypeID = "1"
        'WorkingData.ApplicationRequestRow.ApplicationUserDefined2 = "York"
        'WorkingData.ApplicationRequestRow.ApplicationUserDefined3 = "Hort"
        'WorkingData.EnrolmentRequestRow.PriorAttainmentLevelID = "01"
        'WorkingData.EnrolmentRequestRow.FirstForename = "Test"
        'WorkingData.EnrolmentRequestRow.DateOfBirth = "30/08/2002"
        'WorkingData.EnrolmentRequestRow.Sex = "F"
        'WorkingData.EnrolmentRequestRow.Address1 = "317"
        'WorkingData.EnrolmentRequestRow.Address2 = "Test Road"
        'WorkingData.EnrolmentRequestRow.Address3 = "Test Road"
        'WorkingData.EnrolmentRequestRow.Address4 = "Test Road"
        'WorkingData.EnrolmentRequestRow.PostcodeOut = "B74"
        'WorkingData.EnrolmentRequestRow.PostcodeIn = "4BZ"
        'WorkingData.EnrolmentRequestRow.Email = "a@a.com"
        'WorkingData.EnrolmentRequestRow.MobileTel = "07853318366"
        'Response.Write(SQLDBDataReader.GetString(7))

        'If Not WorkingData.CurrentLoggedOnUserRow Is Nothing Then

        '    If Not WorkingData.CurrentLoggedOnUserRow.Email Is Nothing Then
        '        'Dim SQLDBDataReader As SqlClient.SqlDataReader
        '        'Dim SQLDataTable As New DataTable
        '        'Dim cmd As New SqlCommand
        '        'Dim SQLCmd As New SqlClient.SqlConnection
        '        'SQLCmd.ConnectionString = GetConn()
        '        'SQLCmd.Open()
        '        'cmd.CommandText = "PSWebenrolmentReports.dbo.spGetStudentDetailsByEmail"
        '        'cmd.CommandType = CommandType.StoredProcedure
        '        'cmd.Connection = SQLCmd
        '        'cmd.Parameters.AddWithValue("email", WorkingData.CurrentLoggedOnUserRow.Email)
        '        'SQLDBDataReader = cmd.ExecuteReader()

        '        Dim conn As New SqlConnection("Server=DEV18;Database=PSWebenrolmentReports;User Id=SSRS_ReadOnly; Password=123456")
        '        Dim cmd As SqlCommand = conn.CreateCommand
        '        conn.Open()
        '        Dim email As String = "amrikaujla@gmail.com"
        '        cmd.CommandType = CommandType.StoredProcedure
        '        cmd.Parameters.Add(New SqlParameter("@email", email))
        '        cmd.CommandText = "PSWebenrolmentReports.dbo.spGetStudentDetailsByEmail"
        '        'cmd.ExecuteNonQuery()
        '        Dim SQLDBDataReader As SqlDataReader
        '        SQLDBDataReader = cmd.ExecuteReader()

        '        If SQLDBDataReader.HasRows Then
        '            While (SQLDBDataReader.Read)
        '                If Not IsDBNull(SQLDBDataReader("refno")) Then
        '                    Session("refno") = CStr(SQLDBDataReader("refno"))
        '                    WorkingData.EnrolmentRequestRow.RefNo = CStr(SQLDBDataReader("refno"))
        '                End If
        '                If Not IsDBNull(SQLDBDataReader("surname")) Then
        '                    WorkingData.EnrolmentRequestRow.Surname = CStr(SQLDBDataReader("surname"))
        '                    Session("snamereadonly") = "Y"
        '                End If
        '                If Not IsDBNull(SQLDBDataReader("firstforename")) Then
        '                    WorkingData.EnrolmentRequestRow.FirstForename = CStr(SQLDBDataReader("firstforename"))
        '                    Session("fnamereadonly") = "Y"
        '                End If
        '                If Not IsDBNull(SQLDBDataReader("dateofbirth")) Then
        '                    If IsDate(SQLDBDataReader("dateofbirth")) Then
        '                        WorkingData.EnrolmentRequestRow.DateOfBirth = CDate(SQLDBDataReader("dateofbirth"))
        '                        Session("dobreadonly") = "Y"
        '                    End If
        '                End If

        '                If Not IsDBNull(SQLDBDataReader("sex")) Then WorkingData.EnrolmentRequestRow.Sex = CStr(SQLDBDataReader("sex"))
        '                If Not IsDBNull(SQLDBDataReader("schoolid")) Then WorkingData.EnrolmentRequestRow.SchoolID = CInt(SQLDBDataReader("schoolid"))
        '                If Not IsDBNull(SQLDBDataReader("address1")) Then
        '                    WorkingData.EnrolmentRequestRow.Address1 = CStr(SQLDBDataReader("address1"))
        '                    divAddresslines.Visible = True
        '                End If
        '                If Not IsDBNull(SQLDBDataReader("address2")) Then WorkingData.EnrolmentRequestRow.Address2 = CStr(SQLDBDataReader("address2"))
        '                If Not IsDBNull(SQLDBDataReader("address3")) Then WorkingData.EnrolmentRequestRow.Address3 = CStr(SQLDBDataReader("address3"))
        '                If Not IsDBNull(SQLDBDataReader("address4")) Then WorkingData.EnrolmentRequestRow.Address4 = CStr(SQLDBDataReader("address4"))
        '                If Not IsDBNull(SQLDBDataReader("postcodeout")) Then WorkingData.EnrolmentRequestRow.PostcodeOut = CStr(SQLDBDataReader("postcodein"))
        '                If Not IsDBNull(SQLDBDataReader("postcodein")) Then WorkingData.EnrolmentRequestRow.PostcodeIn = CStr(SQLDBDataReader("postcodeout"))
        '                If Not IsDBNull(SQLDBDataReader("postcodeout")) And Not IsDBNull(SQLDBDataReader("postcodein")) Then postcode.Value = WorkingData.EnrolmentRequestRow.PostcodeOut + " " + WorkingData.EnrolmentRequestRow.PostcodeIn
        '                If Not IsDBNull(SQLDBDataReader("email")) Then WorkingData.EnrolmentRequestRow.Email = CStr(SQLDBDataReader("email"))
        '                If Not IsDBNull(SQLDBDataReader("mobiletel")) Then WorkingData.EnrolmentRequestRow.MobileTel = CStr(SQLDBDataReader("mobiletel"))
        '                'Response.Write(SQLDBDataReader.GetString(7))
        '                'Response.Write(SQLDBDataReader.GetString(5))
        '            End While
        '        End If
        '        conn.Close()
        '        SQLDBDataReader.Close()
        '    End If

        'End If

        'If Not Session("refno") Is Nothing Then
        '    lblRefno.Text = CType(Session("refno"), String)
        '    divRefno.Visible = True
        'End If

        'If Session("snamereadonly") = "Y" Then fldSurname.IsReadOnly = True
        'If Session("fnamereadonly") = "Y" Then fldFirstForename.IsReadOnly = True
        'If Session("dobreadonly") = "Y" Then datepicker.IsReadOnly = True

        MyBase.OnLoad(e)
    End Sub

    Public Function SetAgeChecks() As Boolean
        Dim academicYear As String = OfferingRow.AcademicYearID
        Dim referenceDataString = Today().Year.ToString().Substring(0, 2) & academicYear.Substring(3, 2) & "-08-31"

        Dim dateOfBirthDate As Date?
        Dim referenceDate As DateTime = CDate(referenceDataString)

        If Not String.IsNullOrEmpty(fldDateOfBirth.Value) Then
            dateOfBirthDate = CType(fldDateOfBirth.Value, Date)
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
        Return True
    End Function

    Private Function FindChildTextbox(parent As Control) As TextBox
        For Each c As Control In parent.Controls
            If TypeOf c Is TextBox Then
                Return DirectCast(c, TextBox)
                Dim tb = FindChildTextbox(c)
                If tb IsNot Nothing Then
                    Return tb
                End If
            End If
        Next
        Return Nothing
    End Function

    Protected Overrides Sub OnInit(e As EventArgs)
        MyBase.OnInit(e)
        Dim tb = FindChildTextbox(fldDateOfBirth)
        If tb IsNot Nothing Then
            tb.AutoPostBack = True
            AddHandler tb.TextChanged, AddressOf DateOfBirthChangedHandler ' If inside UpdatePanel, register for async postback:
            If ScriptManager.GetCurrent(Page) IsNot Nothing Then
                ScriptManager.GetCurrent(Page).RegisterAsyncPostBackControl(tb)
            End If
        End If
    End Sub

    Protected Sub DateOfBirthChangedHandler(sender As Object, e As EventArgs)
        Dim tb = TryCast(sender, TextBox)
        If tb IsNot Nothing Then
            Dim dateOfBirthDate As Date?
            If Not String.IsNullOrEmpty(tb.Text) Then
                dateOfBirthDate = CType(tb.Text, Date)
            End If

            SetAgeChecks()
        End If
    End Sub

    Protected Overrides Sub CreateChildControls()
        MyBase.CreateChildControls()

        'If IsPostBack Then
        If Not String.IsNullOrEmpty(Session("RadioButtonListAlt")) Then
            RadioButtonListAlt.SelectedValue = Session("RadioButtonListAlt")
        End If

        If Not String.IsNullOrEmpty(Session("19PlusOutsideAreaConfirmed")) Then
            ConfirmNoFundingAvailable.Checked = Session("19PlusOutsideAreaConfirmed")
        End If
    End Sub

    Public Overrides Sub ValidateControl()
        'If Len(txtAddress1.Value) = 0 Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "You must enter the 1st line of the address"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If

        'Title
        'If Not IsNothing(fldTitle) Then
        '    If String.IsNullOrEmpty(fldTitle.Value) Then
        '        fldTitleValidator.ErrorMessage = "Title must not be blank"
        '        fldTitleValidator.IsValid = False
        '        fldTitleValidator.CssClass = "error alert alert-danger"
        '        fldTitle.CssClass = "ErrorInput"
        '    End If
        'End If

        'Forename (Single Name Only)
        If Not String.IsNullOrEmpty(fldFirstForename.Value) Then
            If (fldFirstForename.Value.ToString().Contains(" ")) Then
                fldFirstForenameValidator.ErrorMessage = "Forename or Given Name must only contain your first name with no spaces. Please Enter Any middle names into the Other Forenames (Middle Names) box below."
                fldFirstForenameValidator.IsValid = False
                fldFirstForenameValidator.CssClass = "error alert alert-danger"
                fldFirstForename.CssClass = "ErrorInput"
            End If
        End If

        'DOB
        If Not IsNothing(fldDateOfBirth) Then


            Dim dateOfBirthDate As Date?

            If Not String.IsNullOrEmpty(fldDateOfBirth.Value) Then
                dateOfBirthDate = CType(fldDateOfBirth.Value, Date)
            End If

            Dim dateToCheckDOB As Date = CDate(Today().Year & "-08-31")
            Dim minAllowedDOB As Date = dateToCheckDOB.AddYears(-MinAgeAllowed)
            Dim maxAllowedDOB As Date = dateToCheckDOB.AddYears(-MaxAgeAllowed)

            If String.IsNullOrEmpty(fldDateOfBirth.Value) Then
                fldDateOfBirthValidator.ErrorMessage = "Please enter your Date of Birth"
                fldDateOfBirthValidator.IsValid = False
                fldDateOfBirthValidator.CssClass = "error alert alert-danger"
                fldDateOfBirth.CssClass = "ErrorInput"
            ElseIf Not IsNothing(dateOfBirthDate) And dateOfBirthDate > minAllowedDOB Then
                fldDateOfBirthValidator.ErrorMessage = "You cannot be aged under " & MinAgeAllowed & " (on " & dateToCheckDOB.ToString("dd MMM yyyy") & ")"
                fldDateOfBirthValidator.IsValid = False
                fldDateOfBirthValidator.CssClass = "error alert alert-danger"
                fldDateOfBirth.CssClass = "ErrorInput"
            ElseIf Not IsNothing(dateOfBirthDate) And dateOfBirthDate < maxAllowedDOB Then
                fldDateOfBirthValidator.ErrorMessage = "You cannot be aged over " & MaxAgeAllowed & " (on " & dateToCheckDOB.ToString("dd MMM yyyy") & ")"
                fldDateOfBirthValidator.IsValid = False
                fldDateOfBirthValidator.CssClass = "error alert alert-danger"
                fldDateOfBirth.CssClass = "ErrorInput"
            End If
        End If

        'Gender
        If Not IsNothing(fldGender.Value) Then
            If String.IsNullOrEmpty(fldGender.Value) Then
                fldGenderValidator.ErrorMessage = "Legal Gender must not be blank"
                fldGenderValidator.IsValid = False
                fldGenderValidator.CssClass = "error alert alert-danger"
                fldGender.CssClass = "ErrorInput"
            End If
        End If

        'National Insurance Number
        'Dim regexNI As New Regex("^(?!BG)(?!GB)(?!NK)(?!KN)(?!TN)(?!NT)(?!ZZ)(?:[A-CEGHJ-PR-TW-Z][A-CEGHJ-NPR-TW-Z])(?:\s*\d\s*){6}([A-D]|\s)$")
        'If Not IsNothing(fldNI.Value) Then
        '    Dim match As Match = regexNI.Match(fldNI.Value)
        '    If String.IsNullOrEmpty(fldNI.Value) And IsUnder19 = False Then
        '        fldNIValidator.ErrorMessage = "National Insurance Number must not be blank for anyone 19+"
        '        fldNIValidator.IsValid = False
        '        fldNIValidator.CssClass = "error alert alert-danger"
        '        fldNI.CssClass = "ErrorInput"
        '    ElseIf Not match.Success And CStr(fldNI.Value).Length > 0 Then
        '        fldNIValidator.ErrorMessage = "Please enter a valid National Insurance Number"
        '        fldNIValidator.IsValid = False
        '        fldNIValidator.CssClass = "error alert alert-danger"
        '        fldNI.CssClass = "ErrorInput"
        '    End If
        'End If

        'Criminal Convictions
        If Not IsNothing(fldCriminalConvictionID.Value) Then
            If String.IsNullOrEmpty(fldCriminalConvictionID.Value) Then
                fldCriminalConvictionIDValidator.ErrorMessage = "Criminal Convictions must not be blank"
                fldCriminalConvictionIDValidator.IsValid = False
                fldCriminalConvictionIDValidator.CssClass = "error alert alert-danger"
                fldCriminalConvictionID.CssClass = "ErrorInput"
            End If
        End If

        If fldKnownToYouthJustice.SelectedValue = "" And IsUnder18 = True Then
            fldKnownToYouthJusticeValidator.ErrorMessage = "Please confirm if you are known to the youth justice service"
            fldKnownToYouthJusticeValidator.IsValid = False
            fldKnownToYouthJusticeValidator.CssClass = "error alert alert-danger"
            'fldKnownToYouthJustice.CssClass = "ErrorInput"
            fldKnownToYouthJustice.Style.Add("border", "1px solid red")
        End If

        If fldParentCarerInPrison.SelectedValue = "" And IsUnder19 = True Then
            fldParentCarerInPrisonValidator.ErrorMessage = "Please confirm if you have a parent or carer in prison"
            fldParentCarerInPrisonValidator.IsValid = False
            fldParentCarerInPrisonValidator.CssClass = "error alert alert-danger"
            'fldParentCarerInPrison.CssClass = "ErrorInput"
            fldParentCarerInPrison.Style.Add("border", "1px solid red")
        End If

        'Post Code
        Dim regexPostCode As New Regex("^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$")
        If Not IsNothing(postcode.Value) Then
            Dim match As Match = regexPostCode.Match(postcode.Value)
            If Not match.Success Then
                postcodeValidator.ErrorMessage = "Please enter a valid Postcode"
                postcodeValidator.IsValid = False
                postcodeValidator.CssClass = "error alert alert-danger"
                postcode.Attributes.Add("Class", "textfield form-control ErrorInput")
            End If
        End If

        'Devolution Funding
        'If Not IsNothing(ConfirmNoFundingAvailable) Then
        '    If DevolutionAreaIsFunded.Checked = False And ConfirmNoFundingAvailable.Checked = False Then
        '        ConfirmNoFundingAvailableValidator.ErrorMessage = "Please confirm you acknowlege your fees may be significantly higher as you live in " & ExpectedSourceOfFundingName.Text & "."
        '        ConfirmNoFundingAvailableValidator.IsValid = False
        '        ConfirmNoFundingAvailableValidator.CssClass = "error alert alert-danger"
        '        ConfirmNoFundingAvailable.CssClass = "ErrorInput"
        '    End If
        'End If

        '''lewis @adnvanced
        'Dim regexEmail As New Regex("^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$")
        'Dim matchE As Match = regexEmail.Match(fldEmail.Value)
        'If Not matchE.Success Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Please enter a valid email"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If

        'Mobile Tel
        Dim regexMobileTel As New Regex("^(07[\d]{8,12}|447[\d]{7,11})$") ' Mobile numbers should start with 07 and be 11 digits long
        Dim regexTel As New Regex("^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$")
        If Not IsNothing(fldMobileTel.Value) And Not IsNothing(fldTel.Value) Then
            If String.IsNullOrEmpty(CStr(fldMobileTel.Value)) And String.IsNullOrEmpty(CStr(fldTel.Value)) Then
                fldMobileTelValidator.ErrorMessage = "Please enter at least one phone number (Mobile number / Home phone (inc. STD code))"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldMobileTel.CssClass = "ErrorInput"
                fldTel.CssClass = "ErrorInput"
            ElseIf CStr(fldMobileTel.Value).Length > 0 And fldMobileTel.Value.ToString.Length <> 11 Then
                fldMobileTelValidator.ErrorMessage = "Your mobile phone number must be 11 digits long"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldMobileTel.CssClass = "ErrorInput"
                fldTel.CssClass = "ErrorInput"
            ElseIf CStr(fldMobileTel.Value).Length > 0 And Not fldMobileTel.Value.ToString.StartsWith("07") Then
                fldMobileTelValidator.ErrorMessage = "Your mobile phone number must start with 07"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldMobileTel.CssClass = "ErrorInput"
                fldTel.CssClass = "ErrorInput"
            ElseIf CStr(fldMobileTel.Value).Length > 0 And Not regexMobileTel.IsMatch(CStr(fldMobileTel.Value)) Then
                fldMobileTelValidator.ErrorMessage = "The format of the mobile must be beginning 07, with no spaces and 11 digits in length e.g. 07771900900"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldMobileTel.CssClass = "ErrorInput"
                'ElseIf CStr(fldTel.Value).Length > 0 And Not regexTel.IsMatch(CStr(fldTel.Value)) Then
                '    fldMobileTelValidator.ErrorMessage = "The format of the home telephone must be a UK standard number begining with 0, with no spaces e.g. 01273800900"
                '    fldMobileTelValidator.IsValid = False
                '    fldMobileTelValidator.CssClass = "error alert alert-danger"
                '    fldTel.CssClass = "ErrorInput"
            End If
        End If

        If ddCollegeAccomodation.SelectedValue = "" Then
            ddCollegeAccomodationValidator.ErrorMessage = "Please confirm if you will you be living in College accommodation"
            ddCollegeAccomodationValidator.IsValid = False
            ddCollegeAccomodationValidator.CssClass = "error alert alert-danger"
            'ddCollegeAccomodation.CssClass = "ErrorInput"
            ddCollegeAccomodation.Style.Add("border", "1px solid red")
        End If

        If RadioButtonListAlt.SelectedValue = "" Then
            RadioButtonListAltValidator.ErrorMessage = "Please confirm if your term time address is different to your home address"
            RadioButtonListAltValidator.IsValid = False
            RadioButtonListAltValidator.CssClass = "error alert alert-danger"
            'RadioButtonListAlt.CssClass = "ErrorInput"
            RadioButtonListAlt.Style.Add("border", "1px solid red")
        End If

        'Dim startDate As Date = "02/09/2023"
        'Dim refDate As Date = "31/08/2023"

        'If IsDate(WorkingData.EnrolmentRequestRow.DateOfBirth) Then
        '    ' Session("age") = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), refDate) / 365.25)
        '    WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), refDate) / 365.25)
        '    If IsDate(startDate) Then
        '        'Session("agecourse") = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), startDate) / 365.25)
        '        WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), startDate) / 365.25)
        '    End If
        'End If

        Dim matchAltPostcode As Match = regexPostCode.Match(AltPostcode.Value)
        If Not IsNothing(RadioButtonListAlt) Then
            If ddCollegeAccomodation.SelectedValue <> "1" And RadioButtonListAlt.SelectedValue = "1" Then
                If Not IsNothing(AltAddress1) Then
                    If String.IsNullOrEmpty(AltAddress1.Value.ToString) Then
                        AltAddress1Validator.ErrorMessage = "As you have said your term time address is different please enter the house number and street"
                        AltAddress1Validator.IsValid = False
                        AltAddress1Validator.CssClass = "error alert alert-danger"
                        AltAddress1.CssClass = "ErrorInput"
                    End If
                End If

                If Not IsNothing(AltPostcode) Then
                    If String.IsNullOrEmpty(AltPostcode.Value.ToString) Then
                        AltPostcodeValidator.ErrorMessage = "As you have said your term time address is different please enter the post code"
                        AltPostcodeValidator.IsValid = False
                        AltPostcodeValidator.CssClass = "error alert alert-danger"
                        AltPostcode.Attributes.Add("Class", "textfield form-control ErrorInput")
                    ElseIf Not matchAltPostcode.Success Then
                        AltPostcodeValidator.ErrorMessage = "Please enter a valid post code for your term time address"
                        AltPostcodeValidator.IsValid = False
                        AltPostcodeValidator.CssClass = "error alert alert-danger"
                        AltPostcode.Attributes.Add("Class", "textfield form-control ErrorInput")
                    End If
                End If
            End If
        End If

        MyBase.ValidateControl()
    End Sub

    Private Sub RadioButtonListAlt_Change(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButtonListAlt.SelectedIndexChanged
        If RadioButtonListAlt.SelectedValue = 2 Then
            WorkingData.EnrolmentRequest(0).AltPostcodeOut = ""
            WorkingData.EnrolmentRequest(0).AltPostcodeIn = ""
        End If
    End Sub

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

    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        ' Response.Write(WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1)

        'Store custom field values in session
        Session("RadioButtonListAlt") = RadioButtonListAlt.SelectedValue.ToString
        Session("19PlusOutsideAreaConfirmed") = ConfirmNoFundingAvailable.Checked

        Me.Page.Validate()

        If Me.Page.IsValid Then
            WorkingData.EnrolmentRequestRow.FirstForename = Trim(fldFirstForename.Value.ToString)
            WorkingData.EnrolmentRequestRow.OtherForenames = Trim(fldOtherForenames.Value.ToString)
            WorkingData.EnrolmentRequestRow.Surname = Trim(fldSurname.Value.ToString)
            WorkingData.EnrolmentRequestRow.KnownAs = Trim(fldKnownAs.Value.ToString)
            WorkingData.EnrolmentRequestRow.SurnameAtBirth = Trim(fldSurnameAtBirth.Value.ToString)

            If ddCollegeAccomodation.SelectedValue = "1" Then
                WorkingData.EnrolmentRequestRow.AccommodationTypeID = "11"
            End If

            WorkingData.EnrolmentRequest(0).Address1 = fldAddress1.Value
            WorkingData.EnrolmentRequest(0).Address2 = fldAddress2.Value
            WorkingData.EnrolmentRequest(0).Address3 = fldAddress3.Value
            WorkingData.EnrolmentRequest(0).Address4 = fldAddress4.Value

            'postcode stuff            
            ''CCCPS-77326: Setting flag to false so Main Address screen opens when coming from this page.
            PSWebEnrolmentProperties.IsCurrentlyTakingAltAddress = False
            If Len(postcode.Value.Trim) > 0 Then
                WorkingData.EnrolmentRequestRow.PostcodeOut = postcode.Value.Trim.Substring(0, postcode.Value.Trim.Length - 3).Trim
                WorkingData.EnrolmentRequestRow.PostcodeIn = Right(postcode.Value.Trim, 3).Trim

                WorkingData.ApplicationRequestRow.PostcodeOut = postcode.Value.Trim.Substring(0, postcode.Value.Trim.Length - 3).Trim
                WorkingData.ApplicationRequestRow.PostcodeIn = Right(postcode.Value.Trim, 3).Trim
            End If

            If ddCollegeAccomodation.SelectedValue = "1" Then
                'Clear anything entered into the alternative address fields if the student is living in college accommodation
                WorkingData.EnrolmentRequestRow.AltAddress1 = ""
                WorkingData.EnrolmentRequestRow.AltAddress2 = ""
                WorkingData.EnrolmentRequestRow.AltAddress3 = ""
                WorkingData.EnrolmentRequestRow.AltAddress4 = ""
                WorkingData.EnrolmentRequestRow.AltPostcodeOut = ""
                WorkingData.EnrolmentRequestRow.AltPostcodeIn = ""
                WorkingData.EnrolmentRequestRow.AltTel1 = ""
            Else
                If Len(AltPostcode.Value.Trim) > 0 Then
                    WorkingData.EnrolmentRequestRow.AltPostcodeOut = AltPostcode.Value.Trim.Substring(0, AltPostcode.Value.Trim.Length - 3).Trim
                    WorkingData.EnrolmentRequestRow.AltPostcodeIn = Right(AltPostcode.Value.Trim, 3).Trim

                    WorkingData.ApplicationRequestRow.AltPostcodeOut = AltPostcode.Value.Trim.Substring(0, AltPostcode.Value.Trim.Length - 3).Trim
                    WorkingData.ApplicationRequestRow.AltPostcodeIn = Right(AltPostcode.Value.Trim, 3).Trim
                End If
            End If

            'Capture Yes/No fields
            If fldKnownToYouthJustice.SelectedValue = "Yes" Then
                WorkingData.EnrolmentRequestRow.EMAConfirmed = True
            ElseIf fldKnownToYouthJustice.SelectedValue = "No" Then
                WorkingData.EnrolmentRequestRow.EMAConfirmed = False
            End If

            If fldParentCarerInPrison.SelectedValue = "Yes" Then
                WorkingData.EnrolmentRequestRow.StudentDetailUserDefined50 = "True"
            ElseIf fldParentCarerInPrison.SelectedValue = "No" Then
                WorkingData.EnrolmentRequestRow.StudentDetailUserDefined50 = "False"
            End If

            Response.Redirect(GetResourceValue("apply_next_of_kin"))


        End If

    End Sub


    Protected Sub btnBack_Click(sender As Object, e As EventArgs) Handles btnBack.Click
        Response.Redirect(GetResourceValue("apply_courseapply") & "&OfferingID=" & OfferingID.ToString())
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




