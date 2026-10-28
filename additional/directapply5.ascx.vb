Option Explicit Off
Option Strict Off

Imports System.Globalization
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class directapply5
    Inherits webenrolmentcontrolvalidate


    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)


        Page.MaintainScrollPositionOnPostBack = True


        If Not IsPostBack Then

        Else

        End If


    End Sub


    Private Sub AddValidationError(errorMessage As String)
        Dim validator As New CustomValidator()
        validator.ErrorMessage = errorMessage
        validator.IsValid = False
        Me.Page.Validators.Add(validator)
    End Sub

    Public Overrides Sub ValidateControl()


        If chkAgreement.Checked = False Then
            AddValidationError("Please confirm that you accept the declaration.")
        End If

        MyBase.ValidateControl()
    End Sub

    Private Sub CheckData()


        WorkingData.ApplicationRequestRow.AcceptMarketingConsent = chkCollegeNewsEventsCourses.Checked
        WorkingData.ApplicationRequestRow.GDPRAllowContactByEmail = chkAllowContactByEmail.Checked
        WorkingData.ApplicationRequestRow.CanBeContactBySMS = chkAllowContactBySms.Checked
        WorkingData.ApplicationRequestRow.CanBeSharedByEmail = chkCanBeSharedByEmail.Checked
        WorkingData.ApplicationRequestRow.CanBeSharedBySocialMedia = chkCanBeSharedBySocialMedia.Checked

        If chkAgreement.Checked Then
            WorkingData.ApplicationRequestRow.StudentDeclaration = "accepted terms and conditions as stated on " & System.DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss")
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
            Response.Redirect(GetResourceValue("checkout_makepayment_aspx"))
        End If
    End Sub
End Class