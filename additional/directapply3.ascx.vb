Option Explicit Off
Option Strict Off

Imports System.Globalization
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class directapply3
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


    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)


        Page.MaintainScrollPositionOnPostBack = True


        If Not IsPostBack Then


        Else

        End If

        CalculateAgeFlags()
        UpdateSectionVisibility()
    End Sub

    Protected Overrides Sub CreateChildControls()
        MyBase.CreateChildControls()

        BuildDisabilityRows()
    End Sub


    Private Sub BuildDisabilityRows()
        If tblDisability Is Nothing Then
            Exit Sub
        End If

        tblDisability.Rows.Clear()

        Dim headerRow As New TableRow
        headerRow.Cells.Add(New TableCell With {.Text = "Disability, learning difficulty, or long-term health condition"})
        headerRow.Cells.Add(New TableCell With {.Text = "Primary"})
        tblDisability.Rows.Add(headerRow)

        If IsPostBack Then
            Dim postBackControl As Control = GetPostBackControl(Me.Page)

            If postBackControl IsNot Nothing AndAlso postBackControl.GetType Is GetType(Button) Then
                Dim btn As Button = DirectCast(postBackControl, Button)

                If btn.ID = btnAddDisability.ID Then
                    intCurrentDisability += 1
                ElseIf btn.ID = btnNoDisability.ID Then
                    intCurrentDisability = 0

                    Try
                        WorkingData.ApplicationRequestDisabilityCategory.Clear()
                    Catch
                    End Try

                    slidingdiv.Visible = Not slidingdiv.Visible

                    If slidingdiv.Visible Then
                        btnNoDisability.Text = "No disability"
                    Else
                        btnNoDisability.Text = "Add disability"
                    End If
                End If
            End If
        End If

        If slidingdiv.Visible Then
            For i As Integer = 0 To intCurrentDisability
                Dim row As New TableRow

                Dim categoryCell As New TableCell
                Dim primaryCell As New TableCell

                Dim categoryField As New StudentDisabilityField
                categoryField.ID = "fldDisabilityCategory" & i
                categoryField.StudentDisabilityFieldType = StudentDisabilityFieldType.DisabilityCategoryID
                categoryField.StudentDisabilityRowNumber = i
                categoryField.LabelWidth = 0
                categoryCell.Controls.Add(categoryField)

                Dim primaryField As New StudentDisabilityField
                primaryField.ID = "fldDisabilityPrimary" & i
                primaryField.StudentDisabilityFieldType = StudentDisabilityFieldType.IsPrimary
                primaryField.StudentDisabilityRowNumber = i
                primaryField.LabelWidth = 0

                primaryCell.CssClass = "application-form__primary-cell"

                Dim primarySourceWrapper As New Panel()
                primarySourceWrapper.CssClass = "application-form__primary-source"
                primarySourceWrapper.Controls.Add(primaryField)

                primaryCell.Controls.Add(primarySourceWrapper)
                primaryCell.Controls.Add(New LiteralControl("<input type=""checkbox"" class=""application-form__primary-display"" aria-label=""Primary disability category"" />"))



                row.Cells.AddRange({categoryCell, primaryCell})
                tblDisability.Rows.Add(row)
            Next
        End If
    End Sub

    Private Overloads Function GetPostBackControl(page As Page) As Control
        If page Is Nothing Then
            Return Nothing
        End If

        Dim controlName As String = page.Request.Params("__EVENTTARGET")

        If controlName <> String.Empty Then
            Return FindControlRecursive(page, controlName)
        End If

        If page.Request.Form(btnAddDisability.UniqueID) IsNot Nothing Then
            Return btnAddDisability
        End If

        If page.Request.Form(btnNoDisability.UniqueID) IsNot Nothing Then
            Return btnNoDisability
        End If

        Return Nothing
    End Function

    Private Function FindControlRecursive(root As Control, id As String) As Control
        If root Is Nothing Then
            Return Nothing
        End If

        If root.ID = id Then
            Return root
        End If

        For Each child As Control In root.Controls
            Dim found As Control = FindControlRecursive(child, id)

            If found IsNot Nothing Then
                Return found
            End If
        Next

        Return Nothing
    End Function

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
            If WorkingData.ApplicationRequestRow.DateOfBirth.HasValue Then
                Return CDate(WorkingData.ApplicationRequestRow.DateOfBirth)
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

    Private Sub UpdateSectionVisibility()

        pnlYoungCarer.Visible = Not IsAgeKnown OrElse IsAge16To18
        pnlFosterCare.Visible = Not IsAgeKnown OrElse IsAge16To18

    End Sub

    Private Sub AddValidationError(errorMessage As String)
        Dim validator As New CustomValidator()
        validator.ErrorMessage = errorMessage
        validator.IsValid = False
        Me.Page.Validators.Add(validator)
    End Sub

    Public Overrides Sub ValidateControl()
        CalculateAgeFlags()
        UpdateSectionVisibility()


        If fldHeardAboutCollegeID.Value = String.Empty Then AddValidationError("Please tell us how you heard about us.")
        If fldSchoolID.Value = String.Empty Then AddValidationError("Please select your current or most recent school.")
        If fldNationalityID.Value = String.Empty Then AddValidationError("Please select your nationality.")
        If fldEthnic.Value = String.Empty Then AddValidationError("Please select your ethnicity.")
        If fldCountryID.Value = String.Empty Then AddValidationError("Please select your country of residence.")
        If rblEuroResident.SelectedValue = String.Empty Then AddValidationError("Please confirm whether you have been resident in the EU for the last 3 years.")
        If rblUkResident12Months.SelectedValue = String.Empty Then AddValidationError("Please confirm whether you have been resident in the UK for 12 months or more.")
        If rblCriminalConvictions.SelectedValue = String.Empty Then AddValidationError("Please confirm whether you have a criminal conviction.")

        If fldLearningDiffOrDisID.Value = String.Empty Then AddValidationError("Please confirm whether you have a disability, learning difficulty, or long-term health condition.")
        If fldMedicalConditionType1ID.Value = String.Empty Then AddValidationError("Please confirm whether you have any medical conditions.")
        If rblHasEHCP.SelectedValue = String.Empty Then AddValidationError("Please confirm whether you have an EHCP.")
        If rblExamSupport.SelectedValue = String.Empty Then AddValidationError("Please confirm whether you have support during exams.")
        If rblSafeguardingPastoral.SelectedValue = String.Empty Then AddValidationError("Please confirm whether you are known to a safeguarding or pastoral team.")

        If IsAge16To18 Then
            If rblYoungCarer.SelectedValue = String.Empty Then AddValidationError("Please confirm whether you are a registered Young Carer.")
            If rblFosterCare.SelectedValue = String.Empty Then AddValidationError("Please confirm whether you are or have recently been in foster care or Local Authority care.")

        End If



        MyBase.ValidateControl()
    End Sub

    Private Sub CheckData()

        If rblEuroResident.SelectedValue <> String.Empty Then
            WorkingData.ApplicationRequestRow.EuroResidentID = CInt(rblEuroResident.SelectedValue)
        End If

        WorkingData.ApplicationRequestRow.StudentDetailUserDefined15 = rblUkResident12Months.SelectedValue

        If rblCriminalConvictions.SelectedValue <> String.Empty Then
            WorkingData.ApplicationRequestRow.CriminalConvictionID = CInt(rblCriminalConvictions.SelectedValue)
        End If

        If rblHasEHCP.SelectedValue <> String.Empty Then
            WorkingData.ApplicationRequestRow.HasEducationHealthCarePlan = CBool(CInt(rblHasEHCP.SelectedValue))
        End If

        WorkingData.ApplicationRequestRow.StudentDetailUserDefined10 = rblExamSupport.SelectedValue
        WorkingData.ApplicationRequestRow.StudentDetailUserDefined2 = rblYoungCarer.SelectedValue
        WorkingData.ApplicationRequestRow.StudentDetailUserDefined1 = rblFosterCare.SelectedValue

        WorkingData.ApplicationRequestRow.DisabilityNotes =
        "Known to safeguarding or pastoral team: " & GetSelectedText(rblSafeguardingPastoral) & Environment.NewLine &
        "Prescribed medication: " & txtPrescribedMedication.Text.Trim() & Environment.NewLine &
        "Allergies: " & txtAllergies.Text.Trim()



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
            Response.Redirect(GetResourceValue("directapply4_aspx"))
        End If
    End Sub
End Class