

Imports System.Collections.Generic
Imports System.Linq
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit


Partial Class further_details
    Inherits CheckoutBaseControl

    Public tblOffering As New OfferingDataTable
    Public OfferingRow As OfferingRow

    Public ReferenceDate As Date
    Public Age19DOB As Date
    Public IsUnder19 As Boolean
    Public IsUnder18 As Boolean

    Public IsUKResident As Boolean

    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        GetCourseDetails()
        SetAgeChecks()
        SetUKResident()

        'Response.Write(WorkingData.EnrolmentRequestRow.StudentDetailUserDefined58)
        'If Not Session("agecourse") Is Nothing Then lblAgeCourse.Text = CType("Your age on " & Session("startdate") & ": " & Session("agecourse") & " (" & Session("ageGroup"), String) & ")"

        If Not IsPostBack Then
            If Session("dis") <> "" Then selectLearnDiff.SelectedValue = Session("dis")

            'Booleans default to false when not set
            If WorkingData.EnrolmentRequestRow.NationalityID = "" Then
                WorkingData.EnrolmentRequestRow.InCare = Nothing
                WorkingData.EnrolmentRequestRow.CareLeaver = Nothing
                WorkingData.EnrolmentRequestRow.HasEducationHealthCarePlan = Nothing
                WorkingData.EnrolmentRequestRow.ReceivedFreeSchoolMeals = Nothing
                WorkingData.EnrolmentRequestRow.ParentCarerInArmedForces = Nothing
                WorkingData.EnrolmentRequestRow.YoungParent = Nothing
            End If

            If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined49 = "True" Then
                fldRightToWorkInUK.SelectedValue = "Yes"
            ElseIf WorkingData.EnrolmentRequestRow.StudentDetailUserDefined49 = "False" Then
                fldRightToWorkInUK.SelectedValue = "No"
            End If

            If WorkingData.EnrolmentRequestRow.InCare = True Then
                fldInCare.SelectedValue = "Yes"
            ElseIf WorkingData.EnrolmentRequestRow.InCare = False Then
                fldInCare.SelectedValue = "No"
            End If

            If WorkingData.EnrolmentRequestRow.CareLeaver = True Then
                fldCareLeaver.SelectedValue = "Yes"
            ElseIf WorkingData.EnrolmentRequestRow.CareLeaver = False Then
                fldCareLeaver.SelectedValue = "No"
            End If

            If WorkingData.EnrolmentRequestRow.YoungCarer = True Then
                fldYoungCarer.SelectedValue = "Yes"
            ElseIf WorkingData.EnrolmentRequestRow.YoungCarer = False Then
                fldYoungCarer.SelectedValue = "No"
            End If

            If WorkingData.EnrolmentRequestRow.HasEducationHealthCarePlan = True Then
                fldEHCP.SelectedValue = "Yes"
            ElseIf WorkingData.EnrolmentRequestRow.HasEducationHealthCarePlan = False Then
                fldEHCP.SelectedValue = "No"
            End If

            If WorkingData.EnrolmentRequestRow.ReceivedFreeSchoolMeals = True Then
                fldFreeSchoolMeals.SelectedValue = "Yes"
            ElseIf WorkingData.EnrolmentRequestRow.ReceivedFreeSchoolMeals = False Then
                fldFreeSchoolMeals.SelectedValue = "No"
            End If

            If WorkingData.EnrolmentRequestRow.ParentCarerInArmedForces = True Then
                fldMilitaryServiceChild.SelectedValue = "Yes"
            ElseIf WorkingData.EnrolmentRequestRow.ParentCarerInArmedForces = False Then
                fldMilitaryServiceChild.SelectedValue = "No"
            End If

            If WorkingData.EnrolmentRequestRow.YoungParent = True Then
                fldKnownToSocialCare.SelectedValue = "Yes"
            ElseIf WorkingData.EnrolmentRequestRow.YoungParent = False Then
                fldKnownToSocialCare.SelectedValue = "No"
            End If

        End If

        ' postcode.Value = WorkingD ata.EnrolmentRequestRow.PostcodeOut & WorkingData.EnrolmentRequestRow.PostcodeIn

        If selectLearnDiff.SelectedValue = "1" Then
            slidingdiv.Visible = True
        Else
            intCurrentDisability = 0
            WorkingData.EnrolmentRequestDisabilityCategory.Clear()
            slidingdiv.Visible = False
        End If

    End Sub
    Public Function SetUKResident() As Boolean
        If IsNothing(WorkingData.EnrolmentRequestRow.CountryID) Then
            IsUKResident = True 'Not set yet so default to UK
        ElseIf WorkingData.EnrolmentRequestRow.CountryID = "GB" Or WorkingData.EnrolmentRequestRow.CountryID = "XF" Then
            IsUKResident = True
        Else
            IsUKResident = False
        End If
        Return IsUKResident
    End Function

    Public Function GetUKResident() As Boolean
        Return IsUKResident
    End Function

    Private Function FindChildDropdown(parent As Control) As DropDownList
        For Each c As Control In parent.Controls
            If TypeOf c Is DropDownList Then
                Return DirectCast(c, DropDownList)
                Dim dd = FindChildDropdown(c)
                If dd IsNot Nothing Then
                    Return dd
                End If
            End If
        Next
        Return Nothing
    End Function

    Protected Overrides Sub OnInit(e As EventArgs)
        MyBase.OnInit(e)
        Dim dd = FindChildDropdown(fldCountryID)
        If dd IsNot Nothing Then
            dd.AutoPostBack = True
            AddHandler dd.SelectedIndexChanged, AddressOf CountryChangedHandler ' If inside UpdatePanel, register for async postback:
            If ScriptManager.GetCurrent(Page) IsNot Nothing Then
                ScriptManager.GetCurrent(Page).RegisterAsyncPostBackControl(dd)
            End If
        End If
    End Sub

    Protected Sub CountryChangedHandler(sender As Object, e As EventArgs) ' handle change End Sub
        SetUKResident()
    End Sub

    Protected Overrides Sub CreateChildControls()
        MyBase.CreateChildControls()

        'If IsPostBack Then

        'Recreate the header row
        'Dim rowH As New TableRow

        'Dim c1, c2 As New TableCell
        'c1.Text = "Learning difficulty, disability or health condition"
        'c1.Attributes.Add("class", "text=center")
        'c2.Text = "Please indicate your primary 'main' condition which could impact on your studies"
        'rowH.Cells.AddRange({c1, c2})

        'tblDisability.Rows.Add(rowH)

        If IsPostBack Then
            Dim c As Control = GetPostBackControl(Me.Page)
            If c.GetType Is GetType(Button) Then
                Dim btn = DirectCast(c, Button)
                If btn.Text = "Add Row" Then
                    intCurrentDisability += 1
                ElseIf btn.ID = "btnNoDisability" Then
                    intCurrentDisability = 0
                    WorkingData.EnrolmentRequestDisabilityCategory.Clear()
                    slidingdiv.Visible = Not slidingdiv.Visible
                    If slidingdiv.Visible Then
                        btn.Text = "No learning difficulty, disability or health condition"
                        btn.ToolTip = "Click to remove all the items listed below (And hide the list)"
                    Else
                        btn.Text = "Add learning difficulty, disability or health condition"
                        btn.ToolTip = "Click to show a list below that you can add Disability to"
                    End If
                End If
            ElseIf c.GetType Is GetType(DropDownList) Then
                Dim dropDown = DirectCast(c, DropDownList)
                If dropDown.ID = "selectLearnDiff" Then
                    If dropDown.SelectedValue = "1" Then
                        slidingdiv.Visible = True
                    Else
                        intCurrentDisability = 0
                        WorkingData.EnrolmentRequestDisabilityCategory.Clear()
                        slidingdiv.Visible = Not slidingdiv.Visible
                    End If
                End If
            End If
        End If

        If slidingdiv.Visible Then

            For i = 0 To intCurrentDisability
                Dim row As New TableRow
                'Dim cell1, cell2 As New TableCell
                Dim disabilityCategoryID, isPrimary As New StudentDisabilityField

                'System Fields
                disabilityCategoryID.StudentDisabilityFieldType = StudentDisabilityFieldType.DisabilityCategoryID
                disabilityCategoryID.StudentDisabilityRowNumber = i
                disabilityCategoryID.CustomCaption = "Difficulty/Disability/Health Condition"
                disabilityCategoryID.ExcludedIDValues = "98,99"
                'disabilityCategoryID.LabelWidth = 0
                'cell1.Controls.Add(disabilityCategoryID)

                isPrimary.StudentDisabilityFieldType = StudentDisabilityFieldType.IsPrimary
                isPrimary.StudentDisabilityRowNumber = i
                isPrimary.CustomCaption = "Primary Support Need"
                'isPrimary.LabelWidth = 0
                'cell2.Controls.Add(isPrimary)

                'HTML Controls
                Dim removeDisabilityButton As New Button
                removeDisabilityButton.Text = "X"
                removeDisabilityButton.CssClass = "btn-solid btn-styled theme-danger"
                removeDisabilityButton.CommandArgument = i
                removeDisabilityButton.CommandName = "RemoveQOEButton"

                AddHandler removeDisabilityButton.Command, AddressOf RemoveDisabilityButton_Click

                'row.Cells.AddRange({cell1, cell2})
                'row.Controls.Add(removeDisabilityBox)
                'tblDisability.Rows.Add(row)

                'New Div Tag For Better Responsiveness
                Dim disabilityOuterBox As New HtmlGenericControl("DIV")
                disabilityOuterBox.Attributes.Add("class", "md:col-12 mb-4 d-flex align-items-stretch")
                Dim disabilityCard As New HtmlGenericControl("DIV")
                disabilityCard.Attributes.Add("class", "card w-100")

                Dim disabilityEntry As New HtmlGenericControl("DIV")
                disabilityEntry.Attributes.Add("class", "card-body d-flex flex-column")

                Dim disabilityEntryRow As New HtmlGenericControl("DIV")
                disabilityEntryRow.Attributes.Add("class", "row")

                Dim disabilityCategoryIDBox As New HtmlGenericControl("DIV")
                disabilityCategoryIDBox.Attributes.Add("class", "form-group md:col-6 xl:col-8")
                disabilityCategoryIDBox.Controls.Add(disabilityCategoryID)
                disabilityEntryRow.Controls.Add(disabilityCategoryIDBox)

                Dim isPrimaryBox As New HtmlGenericControl("DIV")
                isPrimaryBox.Attributes.Add("class", "form-group md:col-3 xl:col-3")
                isPrimaryBox.Controls.Add(isPrimary)
                disabilityEntryRow.Controls.Add(isPrimaryBox)

                Dim removeDisabilityBox As New HtmlGenericControl("DIV")
                removeDisabilityBox.Attributes.Add("class", "form-group md:col-3 xl:col-1 text-right")
                removeDisabilityBox.Controls.Add(removeDisabilityButton)
                disabilityEntryRow.Controls.Add(removeDisabilityBox)

                disabilityEntry.Controls.Add(disabilityEntryRow)
                disabilityCard.Controls.Add(disabilityEntry)
                disabilityOuterBox.Controls.Add(disabilityCard)
                Disabilities.Controls.Add(disabilityOuterBox)
            Next
        End If
    End Sub

    Public Property intCurrentDisability() As Integer
        Get
            Return CInt(HttpContext.Current.Session("intDisabilityRows"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("intDisabilityRows") = value
        End Set
    End Property

    Sub RemoveDisabilityButton_Click(sender As Object, e As CommandEventArgs)
        Dim rowToDelete As Integer = CInt(e.CommandArgument)

        Dim rowNumber As Integer = 0
        Dim rowDeleted As Boolean = False

        For Each row As EnrolmentRequestDisabilityCategoryRow In WorkingData.EnrolmentRequestDisabilityCategory.Rows
            If rowNumber = rowToDelete Then
                row.Delete()
                rowDeleted = True

                Exit For
            End If

            rowNumber += 1
        Next

        If rowDeleted = True Then
            HttpContext.Current.Session("intDisabilityRows") = intCurrentDisability - 1
        End If

        'Added redirect otherwise session variable was still showing old value
        Response.Redirect(GetResourceValue("apply_further_details"))
    End Sub

    Public Overrides Sub ValidateControl()
        'Response.Write(selectEuro.SelectedValue)

        'Drop-downs that are set as required are not picked up
        If Not IsNothing(fldNationalityID) Then
            If String.IsNullOrEmpty(fldNationalityID.Value) Then
                fldNationalityIDValidator.ErrorMessage = "Nationality must not be blank"
                fldNationalityIDValidator.IsValid = False
                fldNationalityIDValidator.CssClass = "error alert alert-danger"
                fldNationalityID.CssClass = "ErrorInput"
            End If
        End If

        If Not IsNothing(fldCountryID) Then
            If String.IsNullOrEmpty(fldCountryID.Value) Then
                fldCountryIDValidator.ErrorMessage = "Main Country of Residence must not be blank"
                fldCountryIDValidator.IsValid = False
                fldCountryIDValidator.CssClass = "error alert alert-danger"
                fldCountryID.CssClass = "ErrorInput"
            End If
        End If

        'If Not IsNothing(fldEthnicGroupID) Then
        '    If String.IsNullOrEmpty(fldEthnicGroupID.Value) Then
        '        fldEthnicGroupIDValidator.ErrorMessage = "Ethnic Group must not be blank"
        '        fldEthnicGroupIDValidator.IsValid = False
        '        fldEthnicGroupIDValidator.CssClass = "error alert alert-danger"
        '        fldEthnicGroupID.CssClass = "ErrorInput"
        '    End If
        'End If

        If selectLearnDiff.SelectedValue = "" Then
            selectLearnDiffValidator.ErrorMessage = "Please confirm if you have a learning difficulty, disability or health condition"
            selectLearnDiffValidator.IsValid = False
            selectLearnDiffValidator.CssClass = "error alert alert-danger"
            selectLearnDiff.Style.Add("border", "1px solid red")
        ElseIf selectLearnDiff.SelectedValue = "1" And WorkingData.EnrolmentRequestDisabilityCategory.Rows.Count = 0 Then
            selectLearnDiffValidator.ErrorMessage = "You have indicated you have a difficulty/disability/health condition but the disability category has not been selected. Please select the nature of your diifficulty/disability or if you do not have one, change the selection to no."
            selectLearnDiffValidator.IsValid = False
            selectLearnDiffValidator.CssClass = "error alert alert-danger"
            selectLearnDiff.Style.Add("border", "1px solid red")
        End If

        Dim rowCount As Integer = 0
        Dim isPrimaryCount As Integer = 0

        'Check for rows without a disability
        For Each row As EnrolmentRequestDisabilityCategoryRow In WorkingData.EnrolmentRequestDisabilityCategory.Rows
            'row.Cells(0).Controls(0).ToString

            rowCount += 1

            If selectLearnDiff.SelectedValue = "1" Then
                Dim disabilityCategoryID As Integer = row.DisabilityCategoryID.GetValueOrDefault
                Dim isPrimary As String = row.IsPrimary.GetValueOrDefault

                If Not disabilityCategoryID > 0 Then
                    Dim v As New CustomValidator
                    v.ErrorMessage = "Error on line " + (rowCount).ToString + " as no disability category has been selected. Please remove the row or enter the disability category."
                    v.IsValid = False
                    Me.Page.Validators.Add(v)
                End If

                If isPrimary = True Then
                    isPrimaryCount += 1
                End If
            End If
        Next

        'Check for disabilities duplicated in the list
        Dim disabilities As List(Of String) = New List(Of String)
        For Each row As EnrolmentRequestDisabilityCategoryRow In WorkingData.EnrolmentRequestDisabilityCategory.Rows

            If selectLearnDiff.SelectedValue = "1" And row.DisabilityCategoryID > 0 Then
                Dim tblDisabilityCategory As New DisabilityCategoryDataTable
                Dim vDisabilityCategory As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblDisabilityCategory)
                vDisabilityCategory.Columns.AddPKColumns()
                vDisabilityCategory.Columns.EnsureColumnsAreSelected(True, False, tblDisabilityCategory.DisabilityCategoryIDColumn, tblDisabilityCategory.DescriptionColumn)

                vDisabilityCategory.Filters.SetColumnFilter(tblDisabilityCategory.DisabilityCategoryIDColumn, row.DisabilityCategoryID, FilterOperator.OperatorInList)

                tblDisabilityCategory.TableAdapter.Load(tblDisabilityCategory, vDisabilityCategory)
                Dim disabilityList As String = tblDisabilityCategory.FirstOrDefault().Description.ToString()
                disabilities.Add(disabilityList)
            End If
        Next
        Dim duplicates As List(Of String) =
               disabilities.GroupBy(Function(n) n) _
               .Where(Function(g) g.Count() > 1) _
               .Select(Function(g) g.First) _
               .ToList()

        Dim duplicatesOnly As String() = duplicates.ToArray
        Dim duplicatesString As String = String.Join(", ", duplicatesOnly)

        If Not IsNothing(duplicatesString) Then
            If Not String.IsNullOrEmpty(duplicatesString) Then
                DisabilitiesValidator.ErrorMessage = "The following difficulties/disabilities have been entered more than once: <strong>""" + duplicatesString + """</strong>. Please remove the duplicated options."
                DisabilitiesValidator.IsValid = False
                DisabilitiesValidator.CssClass = "error alert alert-danger"
            End If
        End If

        If rowCount >= 1 And selectLearnDiff.SelectedValue = "1" And isPrimaryCount = 0 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please record which difficulty/disability/health condition is the primary (main) one."
            v.IsValid = False
            Me.Page.Validators.Add(v)
        ElseIf rowCount >= 1 And isPrimaryCount > 1 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please record only one difficulty/disability/health condition as your primary (main) one."
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        'If selectLearnDiff.SelectedValue = "1" And CType("" & WorkingData.EnrolmentRequestRow.DisabilityCategory1ID, String) = CType("" & WorkingData.EnrolmentRequestRow.DisabilityCategory2ID, String) Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Primary 'main' condition and Secondary condition must not be the same"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If

        If fldRightToWorkInUK.SelectedValue = "" And IsUKResident = False Then
            fldRightToWorkInUKValidator.ErrorMessage = "Please confirm if you have a right to work in the UK"
            fldRightToWorkInUKValidator.IsValid = False
            fldRightToWorkInUKValidator.CssClass = "error alert alert-danger"
            'fldRightToWorkInUK.CssClass = "ErrorInput"
            fldRightToWorkInUK.Style.Add("border", "1px solid red")
        End If

        If fldInCare.SelectedValue = "" Then
            fldInCareValidator.ErrorMessage = "Please confirm if you are currently in care"
            fldInCareValidator.IsValid = False
            fldInCareValidator.CssClass = "error alert alert-danger"
            'fldInCare.CssClass = "ErrorInput"
            fldInCare.Style.Add("border", "1px solid red")
        End If

        If fldCareLeaver.SelectedValue = "" Then
            fldCareLeaverValidator.ErrorMessage = "Please confirm if you are a care leaver"
            fldCareLeaverValidator.IsValid = False
            fldCareLeaverValidator.CssClass = "error alert alert-danger"
            'fldCareLeaver.CssClass = "ErrorInput"
            fldCareLeaver.Style.Add("border", "1px solid red")
        End If

        If fldYoungCarer.SelectedValue = "" And IsUnder19 = True Then
            fldYoungCarerValidator.ErrorMessage = "Please confirm if you are a young carer"
            fldYoungCarerValidator.IsValid = False
            fldYoungCarerValidator.CssClass = "error alert alert-danger"
            'fldYoungCarer.CssClass = "ErrorInput"
            fldYoungCarer.Style.Add("border", "1px solid red")
        End If

        If fldEHCP.SelectedValue = "" Then
            fldEHCPValidator.ErrorMessage = "Please confirm if you have an educational health care plan"
            fldEHCPValidator.IsValid = False
            fldEHCPValidator.CssClass = "error alert alert-danger"
            'fldEHCP.CssClass = "ErrorInput"
            fldEHCP.Style.Add("border", "1px solid red")
        End If

        If fldFreeSchoolMeals.SelectedValue = "" And IsUnder19 = True Then
            fldFreeSchoolMealsValidator.ErrorMessage = "Please confirm if you were eligible for free school meals at school"
            fldFreeSchoolMealsValidator.IsValid = False
            fldFreeSchoolMealsValidator.CssClass = "error alert alert-danger"
            'fldFreeSchoolMeals.CssClass = "ErrorInput"
            fldFreeSchoolMeals.Style.Add("border", "1px solid red")
        End If

        If fldMilitaryServiceChild.SelectedValue = "" Then
            fldMilitaryServiceChildValidator.ErrorMessage = "Please confirm if you are a military service child"
            fldMilitaryServiceChildValidator.IsValid = False
            fldMilitaryServiceChildValidator.CssClass = "error alert alert-danger"
            'fldMilitaryServiceChild.CssClass = "ErrorInput"
            fldMilitaryServiceChild.Style.Add("border", "1px solid red")
        End If

        If fldKnownToSocialCare.SelectedValue = "" And IsUnder19 = True Then
            fldKnownToSocialCareValidator.ErrorMessage = "Please confirm if you are known to social care services"
            fldKnownToSocialCareValidator.IsValid = False
            fldKnownToSocialCareValidator.CssClass = "error alert alert-danger"
            'fldKnownToSocialCare.CssClass = "ErrorInput"
            fldKnownToSocialCare.Style.Add("border", "1px solid red")
        End If

        MyBase.ValidateControl()
    End Sub

    Public Overrides Sub RenderControl(writer As HtmlTextWriter)
        ' Move UK to top of Nationality Drop Down
        Dim ctlNationality As DropDownList = TryCast(fldNationalityID.InternalFieldControl, DropDownList)
        Dim ctlResidence As DropDownList = TryCast(fldCountryID.InternalFieldControl, DropDownList)
        Dim ctlEthnicity As DropDownList = TryCast(fldEthnicGroupID.InternalFieldControl, DropDownList)

        Dim itemGB = ctlNationality.Items.FindByValue("GB") ' United Kingdom
        Dim itemXF = ctlResidence.Items.FindByValue("XF") ' UK
        Dim ItemEng = ctlEthnicity.Items.FindByValue("31") ' English/Welsh/Scottish/Northern Irish/British

        ctlEthnicity.Items.Remove(ItemEng)
        ctlEthnicity.Items.Insert(1, ItemEng)

        ctlResidence.Items.Remove(itemXF)
        ctlResidence.Items.Insert(1, itemXF)

        itemGB.Text = "British"
        ctlNationality.Items.Remove(itemGB)
        ctlNationality.Items.Insert(1, itemGB)

        MyBase.RenderControl(writer)

    End Sub

    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Session("dis") = selectLearnDiff.SelectedValue

        If Session("dis") <> "" Then WorkingData.EnrolmentRequestRow.LearningDiffOrDisID = Session("dis")

        Me.Page.Validate()

        If Me.Page.IsValid Then

            'Capture Yes/No fields
            If fldRightToWorkInUK.SelectedValue = "Yes" Then
                WorkingData.EnrolmentRequestRow.StudentDetailUserDefined49 = "True"
            ElseIf fldRightToWorkInUK.SelectedValue = "No" Then
                WorkingData.EnrolmentRequestRow.StudentDetailUserDefined49 = "False"
            End If

            If fldInCare.SelectedValue = "Yes" Then
                WorkingData.EnrolmentRequestRow.InCare = True
            ElseIf fldInCare.SelectedValue = "No" Then
                WorkingData.EnrolmentRequestRow.InCare = False
            End If

            If fldCareLeaver.SelectedValue = "Yes" Then
                WorkingData.EnrolmentRequestRow.CareLeaver = True
            ElseIf fldCareLeaver.SelectedValue = "No" Then
                WorkingData.EnrolmentRequestRow.CareLeaver = False
            End If

            If fldYoungCarer.SelectedValue = "Yes" Then
                WorkingData.EnrolmentRequestRow.YoungCarer = True
            ElseIf fldYoungCarer.SelectedValue = "No" Then
                WorkingData.EnrolmentRequestRow.YoungCarer = False
            End If

            If fldEHCP.SelectedValue = "Yes" Then
                WorkingData.EnrolmentRequestRow.HasEducationHealthCarePlan = True
            ElseIf fldEHCP.SelectedValue = "No" Then
                WorkingData.EnrolmentRequestRow.HasEducationHealthCarePlan = False
            End If

            If fldFreeSchoolMeals.SelectedValue = "Yes" Then
                WorkingData.EnrolmentRequestRow.ReceivedFreeSchoolMeals = True
            ElseIf fldFreeSchoolMeals.SelectedValue = "No" Then
                WorkingData.EnrolmentRequestRow.ReceivedFreeSchoolMeals = False
            End If

            If fldMilitaryServiceChild.SelectedValue = "Yes" Then
                WorkingData.EnrolmentRequestRow.ParentCarerInArmedForces = True
            ElseIf fldMilitaryServiceChild.SelectedValue = "No" Then
                WorkingData.EnrolmentRequestRow.ParentCarerInArmedForces = False
            End If

            If fldKnownToSocialCare.SelectedValue = "Yes" Then
                WorkingData.EnrolmentRequestRow.YoungParent = True
            ElseIf fldKnownToSocialCare.SelectedValue = "No" Then
                WorkingData.EnrolmentRequestRow.YoungParent = False
            End If

            Response.Redirect(GetResourceValue("apply_quals_on_entry"))

        End If

    End Sub

    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click

        ' Me.Page.Validate()

        Session("dis") = selectLearnDiff.SelectedValue
        If Session("dis") <> "" Then WorkingData.EnrolmentRequestRow.LearningDiffOrDisID = Session("dis")

        Response.Redirect(GetResourceValue("apply_next_of_kin"))

        'End If

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


