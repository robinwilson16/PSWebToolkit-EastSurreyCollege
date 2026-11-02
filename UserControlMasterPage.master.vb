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

        ' jQuery UI
        Dim jqUIcss As New HtmlGenericControl()
        jqUIcss.TagName = "link"
        jqUIcss.Attributes.Add("rel", "stylesheet")
        jqUIcss.Attributes.Add("type", "text/css")
        jqUIcss.Attributes("href") = ResolveUrl("~/Scripts/jquery-ui/themes/base/jquery-ui.min.css")
        htmlHeader.Controls.Add(jqUIcss)

        Dim jqUIjs As New HtmlGenericControl("script")
        jqUIjs.Attributes("type") = "text/javascript"
        jqUIjs.Attributes("src") = ResolveUrl("~/Scripts/jquery-ui/jquery-ui.min.js")
        htmlHeader.Controls.Add(jqUIjs)

        ' jQuery
        Dim jqjs As New HtmlGenericControl("script")
        jqjs.Attributes("type") = "text/javascript"
        jqjs.Attributes("src") = ResolveUrl("~/Scripts/jquery/dist/jquery.min.js")
        htmlHeader.Controls.Add(jqjs)

        ' Bootstrap
        Dim bscss As New HtmlGenericSelfClosing()
        bscss.TagName = "link"
        bscss.Attributes.Add("rel", "stylesheet")
        bscss.Attributes.Add("type", "text/css")
        bscss.Attributes("href") = ResolveUrl("~/Scripts/bootstrap/css/bootstrap.min.css")
        htmlHeader.Controls.Add(bscss)

        Dim bsjs As New HtmlGenericControl("script")
        bsjs.Attributes("type") = "text/javascript"
        bsjs.Attributes("src") = ResolveUrl("~/Scripts/bootstrap/js/bootstrap.bundle.min.js")
        htmlHeader.Controls.Add(bsjs)

        ' Font Awesome
        Dim facss As New HtmlGenericSelfClosing()
        facss.TagName = "link"
        facss.Attributes.Add("rel", "stylesheet")
        facss.Attributes.Add("type", "text/css")
        facss.Attributes("href") = ResolveUrl("~/Scripts/font-awesome/css/all.min.css")
        htmlHeader.Controls.Add(facss)

        ' Callout
        Dim cocss As New HtmlGenericSelfClosing()
        cocss.TagName = "link"
        cocss.Attributes.Add("rel", "stylesheet")
        cocss.Attributes.Add("type", "text/css")
        cocss.Attributes("href") = ResolveUrl("~/content/callout.css")
        htmlHeader.Controls.Add(cocss)

        ' Robin Digital Improvements
        Dim rdcss As New HtmlGenericSelfClosing()
        rdcss.TagName = "link"
        rdcss.Attributes.Add("rel", "stylesheet")
        rdcss.Attributes.Add("type", "text/css")
        rdcss.Attributes("href") = ResolveUrl("~/content/RobinDigital.css")
        htmlHeader.Controls.Add(rdcss)

        Dim rdjs As New HtmlGenericControl("script")
        rdjs.Attributes("type") = "text/javascript"
        rdjs.Attributes("src") = ResolveUrl("~/Scripts/RobinDigital.js")
        htmlHeader.Controls.Add(rdjs)


        ' Custom Orbital South Colleges
        Dim osccss As New HtmlGenericSelfClosing()
        osccss.TagName = "link"
        osccss.Attributes.Add("rel", "stylesheet")
        osccss.Attributes.Add("type", "text/css")
        osccss.Attributes("href") = ResolveUrl("~/content/OSC.css")
        htmlHeader.Controls.Add(osccss)

        Dim oscjs As New HtmlGenericControl("script")
        oscjs.Attributes("type") = "text/javascript"
        oscjs.Attributes("src") = ResolveUrl("~/Scripts/OSC.js")
        htmlHeader.Controls.Add(oscjs)

        ' Others
        Dim pscss As New HtmlGenericSelfClosing()
        pscss.TagName = "link"
        pscss.Attributes.Add("rel", "stylesheet")
        pscss.Attributes.Add("type", "text/css")
        pscss.Attributes.Add("media", "print")
        pscss.Attributes("href") = ResolveUrl("~/content/ProSolutionPrint.css")
        htmlHeader.Controls.Add(pscss)

        Dim cuscss As New HtmlGenericSelfClosing()
        cuscss.TagName = "link"
        cuscss.Attributes.Add("rel", "stylesheet")
        cuscss.Attributes.Add("type", "text/css")
        cuscss.Attributes("href") = ResolveUrl("~/content/custom.css")
        htmlHeader.Controls.Add(cuscss)

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

        Dim js4 As New HtmlGenericControl("script")
        js4.Attributes("type") = "text/javascript"
        js4.Attributes("src") = ResolveUrl("~/Scripts/custom.js")
        htmlHeader.Controls.Add(js4)

    End Sub
End Class

