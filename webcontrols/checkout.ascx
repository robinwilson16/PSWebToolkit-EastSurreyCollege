<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout.ascx.vb" Inherits="checkout"  %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<br /><br />
          

    <h3>
        Summary</h3>
    <br><br>
    <asp:PlaceHolder runat="server" ID="BasketPlaceHolder">


    </asp:PlaceHolder>




        <p>Summary of Courses: <span class="glyphicon glyphicon-shopping-cart" style="color:#7A7A7A" ></span><cc1:ShoppingBasketTotals CssClass="shoppingbasket" ID="ShoppingBasket2" runat="server" HideIcon="true" /></p>
    
 
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" 
        LinkURL="~/webenrolment.aspx?page=~/webcontrols/checkout_aspx" CausesValidation="True" 
         EnableEnterKey="true" />
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />
    


