Option Explicit Off
Option Strict Off

Imports System.Globalization
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class directapply4
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


    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)

        Session("RequestMode") = RequestMode.ApplicationRequest
        Page.MaintainScrollPositionOnPostBack = True



        If Not IsPostBack Then
            PopulateGradeDropdown(ddlEnglishLiteratureGrade)
            PopulateGradeDropdown(ddlMathsGrade)
            PopulateGradeDropdown(ddlEnglishLanguageGrade)

        Else
            EnsureGradeDropdownItems()
        End If

        CalculateAgeFlags()
        UpdateSectionVisibility()
    End Sub

    Protected Overrides Sub CreateChildControls()
        MyBase.CreateChildControls()

        BuildQualificationRows()

    End Sub


    Private Sub BuildQualificationRows()
        If tblQuals Is Nothing Then
            Exit Sub
        End If

        tblQuals.Rows.Clear()

        Dim headerRow As New TableRow
        headerRow.Cells.Add(New TableCell With {.Text = "Qualification"})
        headerRow.Cells.Add(New TableCell With {.Text = "Subject"})
        headerRow.Cells.Add(New TableCell With {.Text = "Grade"})
        tblQuals.Rows.Add(headerRow)

        AddQualificationRow(0)
        AddQualificationRow(1)
        AddQualificationRow(2)
    End Sub

    Private Sub AddQualificationRow(rowNumber As Integer)
        Dim row As New TableRow

        Dim qualificationCell As New TableCell
        Dim subjectCell As New TableCell
        Dim gradeCell As New TableCell

        Dim qualificationField As New StudentQualsOnEntryField
        qualificationField.ID = "fldQual" & rowNumber
        qualificationField.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.QualID
        qualificationField.StudentQualsOnEntryRowNumber = rowNumber
        qualificationField.LabelWidth = 0
        qualificationCell.Controls.Add(qualificationField)

        Dim subjectField As New StudentQualsOnEntryField
        subjectField.ID = "fldQualSubject" & rowNumber
        subjectField.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Subject
        subjectField.StudentQualsOnEntryRowNumber = rowNumber
        subjectField.LabelWidth = 0
        subjectCell.Controls.Add(subjectField)

        Dim gradeField As New StudentQualsOnEntryField
        gradeField.ID = "fldQualGrade" & rowNumber
        gradeField.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Grade

        gradeField.StudentQualsOnEntryRowNumber = rowNumber
        gradeField.LabelWidth = 0
        gradeCell.Controls.Add(gradeField)

        row.Cells.AddRange({qualificationCell, subjectCell, gradeCell})
        tblQuals.Rows.Add(row)
    End Sub



    Private Sub EnsureGradeDropdownItems()
        If ddlEnglishLiteratureGrade.Items.Count = 0 Then
            PopulateGradeDropdown(ddlEnglishLiteratureGrade)
        End If

        If ddlMathsGrade.Items.Count = 0 Then
            PopulateGradeDropdown(ddlMathsGrade)
        End If

        If ddlEnglishLanguageGrade.Items.Count = 0 Then
            PopulateGradeDropdown(ddlEnglishLanguageGrade)
        End If
    End Sub

    Private Sub PopulateGradeDropdown(dropdown As DropDownList)
        dropdown.Items.Clear()
        dropdown.Items.Add(New ListItem("--Please select--", ""))
        dropdown.Items.Add(New ListItem("9", "9"))
        dropdown.Items.Add(New ListItem("8", "8"))
        dropdown.Items.Add(New ListItem("7", "7"))
        dropdown.Items.Add(New ListItem("6", "6"))
        dropdown.Items.Add(New ListItem("5", "5"))
        dropdown.Items.Add(New ListItem("4", "4"))
        dropdown.Items.Add(New ListItem("3", "3"))
        dropdown.Items.Add(New ListItem("2", "2"))
        dropdown.Items.Add(New ListItem("1", "1"))
        dropdown.Items.Add(New ListItem("A*", "A*"))
        dropdown.Items.Add(New ListItem("A", "A"))
        dropdown.Items.Add(New ListItem("B", "B"))
        dropdown.Items.Add(New ListItem("C", "C"))
        dropdown.Items.Add(New ListItem("D", "D"))
        dropdown.Items.Add(New ListItem("E", "E"))
        dropdown.Items.Add(New ListItem("F", "F"))
        dropdown.Items.Add(New ListItem("G", "G"))
        dropdown.Items.Add(New ListItem("U", "U"))
        dropdown.Items.Add(New ListItem("Not taken", "Not taken"))
    End Sub

    Private Sub LoadQualificationGrade(subjectName As String, dropdown As DropDownList)
        Try
            For Each qualsRow As Object In WorkingData.ApplicationRequestQualsOnEntry
                If String.Equals(CStr(CallByName(qualsRow, "Subject", CallType.Get)), subjectName, StringComparison.OrdinalIgnoreCase) Then
                    Dim gradeValue As String = CStr(CallByName(qualsRow, "Grade", CallType.Get))

                    If dropdown.Items.FindByValue(gradeValue) IsNot Nothing Then
                        dropdown.SelectedValue = gradeValue
                    End If

                    Exit For
                End If
            Next
        Catch
        End Try
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

        pnlGcseGrades.Visible = Not IsAgeKnown OrElse IsAge16To18
        'pnlEnglishLiteratureGrade.Visible = Not IsAgeKnown OrElse IsAge16To18
        'pnlMathsGrade.Visible = Not IsAgeKnown OrElse IsAge16To18
        'pnlEnglishLanguageGrade.Visible = Not IsAgeKnown OrElse IsAge16To18
        pnlHighestQualification.Visible = Not IsAgeKnown OrElse IsAge19Plus
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

        If WorkingData.ShoppingCart Is Nothing OrElse WorkingData.ShoppingCart.Items.Count = 0 Then
            AddValidationError("You must have at least one course in your basket.")
        End If


        If IsAge19Plus AndAlso fldPrior.Value = String.Empty Then
            AddValidationError("Please select your highest level of qualification.")
        End If


        MyBase.ValidateControl()
    End Sub

    Private Sub CheckData()

    End Sub

    Private Function GetSelectedText(list As RadioButtonList) As String
        If list Is Nothing OrElse list.SelectedItem Is Nothing Then
            Return String.Empty
        End If

        Return list.SelectedItem.Text
    End Function

    Private Sub SaveApplicationQualificationRows()
        Try
            WorkingData.ApplicationRequestQualsOnEntry.Clear()
        Catch
        End Try

        AddApplicationQualificationRow(0, "GCSE English Literature", ddlEnglishLiteratureGrade.SelectedValue)
        AddApplicationQualificationRow(1, "GCSE Maths", ddlMathsGrade.SelectedValue)
        AddApplicationQualificationRow(2, "GCSE English Language", ddlEnglishLanguageGrade.SelectedValue)
    End Sub

    Private Sub AddApplicationQualificationRow(rowNumber As Integer, subjectName As String, gradeValue As String)
        If gradeValue = String.Empty Then
            Exit Sub
        End If

        Dim qualsRow = WorkingData.ApplicationRequestQualsOnEntry.NewRow()
        'qualsRow = intcurrentquals
        qualsRow.Subject = subjectName
        qualsRow.Grade = gradeValue
        ' qualsRow.IncludeInReturn = True
        WorkingData.ApplicationRequestQualsOnEntry.AddRow(qualsRow)
    End Sub

    Public Property intCurrentQuals() As Integer
        Get
            Return CInt(HttpContext.Current.Session("intQualRows"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("intQualRows") = value
        End Set
    End Property


    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click
        Me.Page.Validate()

        If Me.Page.IsValid Then
            CheckData()
            Response.Redirect(GetResourceValue("directapply5_aspx"))
        End If
    End Sub
End Class