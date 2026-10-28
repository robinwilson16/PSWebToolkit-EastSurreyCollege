Option Explicit On
Option Strict On

Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class UserControlMasterPage
    Inherits System.Web.UI.MasterPage

    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        LoadLinks()
        LoadAccountLinks()
    End Sub

    Private Sub LoadAccountLinks()
        lnkLogin.NavigateUrl = "webenrolment.aspx?page=~/account/ccc/Login.ascx"
        lnkRegister.NavigateUrl = "webenrolment.aspx?page=~/account/ccc/Register.ascx"
        lnkLogout.NavigateUrl = "webenrolment.aspx?page=~/account/ccc/Logout.ascx"

        If WorkingData.CurrentLoggedOnUserRow IsNot Nothing Then
            regLogin.Visible = False
            regRegister.Visible = False
            regLoggedIn.Visible = True
            regLogout.Visible = True
            username.InnerText = "Logged in as: " & WorkingData.CurrentLoggedOnUserRow.Email
        Else
            regLogin.Visible = True
            regRegister.Visible = True
            regLoggedIn.Visible = False
            regLogout.Visible = False
            username.InnerText = String.Empty
        End If
    End Sub
    'Protected Overrides Sub OnPreRender(e As EventArgs)
    '    MyBase.OnPreRender(e)


    '    lnkRegister.NavigateUrl = "webenrolment.aspx?page=~/account/ccc/Register.ascx"
    '    lnkLogin.NavigateUrl = "webenrolment.aspx?page=~/account/ccc/Login.ascx"
    '    lnkLogout.NavigateUrl = "webenrolment.aspx?page=~/account/ccc/Logout.ascx"
    '    lnkAccount.Visible = True

    'End Sub


    Private Sub LoadLinks()

        Dim htmlHeader As HtmlHead = CType(Page.Master.FindControl("headtag"), HtmlHead)


        Dim js1 As New HtmlGenericControl("script")
        js1.Attributes("type") = "text/javascript"
        ''CCCPS-77643: Upgraded JQuery with latest version.
        js1.Attributes("src") = ResolveUrl("~/Scripts/jquery-3.7.1.min.js")
        htmlHeader.Controls.Add(js1)

        Dim css4 As New HtmlGenericSelfClosing()
        css4.TagName = "link"
        css4.Attributes.Add("rel", "stylesheet")
        css4.Attributes.Add("type", "text/css")
        css4.Attributes("href") = ResolveUrl("~/content/themes/base/jquery-ui.min.css")
        htmlHeader.Controls.Add(css4)

        Dim js6 As New HtmlGenericControl("script")
        js6.Attributes("type") = "text/javascript"
        js6.Attributes("src") = ResolveUrl("~/Scripts/jquery-ui-1.14.1.min.js")
        htmlHeader.Controls.Add(js6)


        Dim css6 As New HtmlGenericSelfClosing()
        css6.TagName = "link"
        css6.Attributes.Add("rel", "stylesheet")
        css6.Attributes.Add("type", "text/css")
        css6.Attributes("href") = ResolveUrl("~/content/toastr.min.css")
        htmlHeader.Controls.Add(css6)

        Dim css2 As New HtmlGenericSelfClosing()
        css2.TagName = "link"
        css2.Attributes.Add("rel", "stylesheet")
        css2.Attributes.Add("type", "text/css")
        css2.Attributes("href") = ResolveUrl("~/content/bootstrap.min.css")
        htmlHeader.Controls.Add(css2)


        Dim cssp As New HtmlGenericSelfClosing()
        cssp.TagName = "link"
        cssp.Attributes.Add("rel", "stylesheet")
        cssp.Attributes.Add("type", "text/css")
        cssp.Attributes.Add("media", "print")
        cssp.Attributes("href") = ResolveUrl("~/content/ProSolutionPrint.css")
        htmlHeader.Controls.Add(cssp)

        Dim css3 As New HtmlGenericSelfClosing()
        css3.TagName = "link"
        css3.Attributes.Add("rel", "stylesheet")
        css3.Attributes.Add("type", "text/css")
        css3.Attributes("href") = ResolveUrl("~/content/custom.css")
        htmlHeader.Controls.Add(css3)



        Dim css5 As New HtmlGenericSelfClosing()
        css5.TagName = "link"
        css5.Attributes.Add("rel", "stylesheet")
        css5.Attributes.Add("type", "text/css")


        If WorkingData.ShoppingCart.ContainsItemsOfType("Enrolment") Then
            css5.Attributes("href") = GetResourceValue("EnrolmentCalendarCSS")
        ElseIf WorkingData.ShoppingCart.ContainsItemsOfType("Application") Then
            css5.Attributes("href") = GetResourceValue("ApplicationCalendarCSS")
        ElseIf WorkingData.ShoppingCart.ContainsItemsOfType("Enquiry") Then
            css5.Attributes("href") = GetResourceValue("EnquiryCalendarCSS")
        Else
            css5.Attributes("href") = GetResourceValue("EnrolmentCalendarCSS")
        End If

        htmlHeader.Controls.Add(css5)



        Dim js2 As New HtmlGenericControl("script")
        js2.Attributes("type") = "text/javascript"
        js2.Attributes("src") = ResolveUrl("~/Scripts/respond.min.js")
        htmlHeader.Controls.Add(js2)

        Dim js3 As New HtmlGenericControl("script")
        js3.Attributes("type") = "text/javascript"
        js3.Attributes("src") = ResolveUrl("~/Scripts/html5shiv.js")
        htmlHeader.Controls.Add(js3)



        If Toastr.UseToastr Then
            Dim js7 As New HtmlGenericControl("script")
            js7.Attributes("type") = "text/javascript"
            js7.Attributes("src") = ResolveUrl("~/Scripts/toastr.min.js")
            htmlHeader.Controls.Add(js7)
        End If



        Dim js5 As New HtmlGenericControl("script")
        js5.Attributes("type") = "text/javascript"
        js5.Attributes("src") = ResolveUrl("~/Scripts/bootstrap.min.js")
        htmlHeader.Controls.Add(js5)

        Dim js4 As New HtmlGenericControl("script")
        js4.Attributes("type") = "text/javascript"
        js4.Attributes("src") = ResolveUrl("~/Scripts/custom.js")
        htmlHeader.Controls.Add(js4)

    End Sub
End Class

