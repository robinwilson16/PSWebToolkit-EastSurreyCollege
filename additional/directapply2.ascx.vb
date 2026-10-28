Option Explicit Off
Option Strict Off

Imports System.Globalization
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class directapply2
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


        Page.MaintainScrollPositionOnPostBack = True


        CalculateAgeFlags()
        UpdateSectionVisibility()
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
        pnlContact2.Visible = Not IsAgeKnown OrElse IsAge16To18

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



        If fldContact1.Value = String.Empty Then AddValidationError("Please enter emergency contact 1 name.")
        If fldContact1Email.Value = String.Empty Then AddValidationError("Please enter emergency contact 1 email.")
        If txtContact1Tel.Text.Trim() = String.Empty Then AddValidationError("Please enter emergency contact 1 telephone number.")
        If fldContact1Relationship.Value = String.Empty Then AddValidationError("Please select emergency contact 1 relationship.")

        If IsAge16To18 Then
            If fldContact2.Value = String.Empty Then AddValidationError("Please enter emergency contact 2 name.")
            If fldContact2Email.Value = String.Empty Then AddValidationError("Please enter emergency contact 2 email.")
            If txtContact2Tel.Text.Trim() = String.Empty Then AddValidationError("Please enter emergency contact 2 telephone number.")
            If fldContact2Relationship.Value = String.Empty Then AddValidationError("Please select emergency contact 2 relationship.")
        End If


        MyBase.ValidateControl()
    End Sub

    Private Sub CheckData()



        WorkingData.ApplicationRequestRow.Contact1Tel = txtContact1Tel.Text.Trim()
        WorkingData.ApplicationRequestRow.Contact2Tel = txtContact2Tel.Text.Trim()




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
            Response.Redirect(GetResourceValue("directapply3_aspx"))
        End If
    End Sub
End Class