<%@ Control Language="VB" AutoEventWireup="false" CodeFile="address_0.ascx.vb" Inherits="address_0"  %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<asp:PlaceHolder ID="PlaceHolder1" runat="server">
		<script type="text/javascript">
			/* Reload the country selection and set the focus to the country dropdown */
			function init()
			{
				var sDataID = "<%: GetDataID() %>";
				if (sDataID != "")
				{
					document.FlatCountry.<%: com.qas.prowebintegration.Constants.FIELD_DATA_ID %>.value = sDataID;
				}
				document.FlatCountry.<%: com.qas.prowebintegration.Constants.FIELD_DATA_ID %>.focus();
			}

			/* Store the text of the DataID select control in the CountryName field */
			function setCountryValue()  
			{   
			    var theForm = document.forms(0); 
				var iSelected = theForm.<%: com.qas.prowebintegration.Constants.FIELD_DATA_ID %>.selectedIndex;
				theForm.<%: com.qas.prowebintegration.Constants.FIELD_COUNTRY_NAME %>.value = theForm.<%: com.qas.prowebintegration.Constants.FIELD_DATA_ID %>.options[iSelected].text;
			}
		</script>

           <br /><br />
                <ol class="breadcrumb" runat="server" id="breadcrumbapps">
                  <li><a href="default.aspx">Home</a></li>
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout.ascx">Checkout</a></li>
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_applications.ascx">Personal Details</a></li>
                  <li class="active">Address</li>
                </ol>
                <ol class="breadcrumb" runat="server" id="breadcrumbenrols">
                  <li><a href="default.aspx">Home</a></li>
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout.ascx">Checkout</a></li>
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments.ascx">Personal Details</a></li>
                  <li class="active">Address</li>
                </ol>

    
   <div class="panel panel-success" id="panel0" runat="server">
      <div class="panel-heading">Address</div>
    <p>Please select your country from the list below.</p>

       <div class="row">
           <div class="col-sm-6">
               <div class="form-group">
                   <label>Country</label>
                   <select name="<%: com.qas.prowebintegration.Constants.FIELD_DATA_ID %>" onchange="setCountryValue();">
                    <!-- #include virtual="countries.all.inc" -->
                </select>
               </div>
           </div>
       </div>
    
       </div>
    <input name="<%: com.qas.prowebintegration.Constants.FIELD_COUNTRY_NAME %>" type="hidden"  /><p>
        <cc1:CCCButton id="btnBack" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_enrolments_aspx"/>
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" ImageResource="btnContinue" />
            &nbsp;</p>
    </asp:PlaceHolder>

