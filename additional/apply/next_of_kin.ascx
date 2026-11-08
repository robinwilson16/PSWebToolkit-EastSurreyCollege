<%@ Control Language="VB" AutoEventWireup="false" CodeFile="next_of_kin.ascx.vb" Inherits="next_of_kin" %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>
<!--
<br />
<div class="container">
   <div class="row">
      <div class="sm:col-12 columns form-group"> 
                <asp:Label runat="server" ID="lblAge"></asp:Label>
          </div>   

   </div>
       <div class="row">
         
       <div class="sm:col-12 columns form-group"> 
<asp:Label runat="server" ID="lblAgeCourse"></asp:Label>
          </div>
       </div>
    </div>
<br />
    -->

<div class="container">
    <div class="row">
        <div class="col">

<div class="alert theme-primary" role="alert">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="breadcrumb-link" href="https://www.osc.ac.uk/"><i class="fa-solid fa-house"></i>&nbsp;Orbital South Colleges</a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item">
                <a class="breadcrumb-link" href="webenrolment.aspx?page=~/additional/apply/courseapply.ascx&OfferingID=<%=OfferingRow.OfferingID %>"><i class="fa-solid fa-basket-shopping"></i>&nbsp;Basket</a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item">
                <a class="breadcrumb-link" href="webenrolment.aspx?page=~/additional/apply/courseapply.ascx&OfferingID=<%=OfferingRow.OfferingID %>"><i class="fa-solid fa-book"></i>&nbsp;<%=OfferingRow.CollegeLevelCode%> - <%=OfferingRow.CollegeLevelName %></a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link" href="webenrolment.aspx?page=~/additional/apply/courseapply.ascx&OfferingID=<%=OfferingRow.OfferingID %>"><i class="fa-solid fa-calendar-days"></i>&nbsp;<%=OfferingRow.AcademicYearID %></a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link" href="webenrolment.aspx?page=~/additional/apply/courseapply.ascx&OfferingID=<%=OfferingRow.OfferingID %>"><i class="fa-solid fa-graduation-cap"></i>&nbsp;<%=OfferingRow.Code%> - <%=OfferingRow.Name %></a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link" href="webenrolment.aspx?page=~/additional/apply/personal_details.ascx"><i class="fa-solid fa-user"></i>&nbsp;Personal Details</a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link active" href="webenrolment.aspx?page=~/additional/apply/next_of_kin.ascx"><i class="fa-solid fa-users"></i>&nbsp;Emergency Contact Details</a>
            </li>
        </ol>
    </nav>
</div>

<div class="progress mt-5 mb-5" role="progressbar" aria-label="Progress..." aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar bg-primary" style="width: 40%">40%</div>
</div>

<div class="bd-callout mt-5 mb-5">
    <h4><i class="fa-solid fa-users"></i> <asp:Label runat="server" ID="Contact1Label">Emergency Contact Details</asp:Label></h4>

    <div class="row">
      <div class="sm:col-12 columns form-group"> 
            <p><strong>If you are aged under 18, we MUST</strong> have details of a <strong>parent, guardian or carer</strong> we can contact in case of an emergency. <strong>If aged 18 or over</strong>, please provide details of a <strong>next of kin.</strong> The person must know they are your emergency contact.</p>
        </div>
  </div>

  <div class="row">
      <div class="sm:col-6 columns form-group"> 
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentFirstName" ID="fldParentFirstName" runat="server" IsRequired="true" CustomCaption="Forename or Given Name" />
          </div>
       <div class="sm:col-6 columns form-group"> 
                 <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentSurname" ID="fldParentSurname" runat="server" IsRequired="true"  CustomCaption="Surname or Family Name" />
          </div>
   </div>

          <div class="row">
        <div class="sm:col-12 columns form-group"> 
                       <p><strong>You must provide at least one Parent, Guardian or Carer phone number below:</strong></p>
            </div>
       </div>
    <div class="row">
            <div class="sm:col-6 columns form-group">
                <span class="textfieldlabelrequired">Mobile Number</span>
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentMobileTel" ID="fldParentMobileTel" runat="server" IsRequired="false" Placeholder="Mobile numbers beginning 07" CustomCaption="Mobile Number (eg 07)" LabelWidth="0" title="The format of the mobile must be beginning 07, with no spaces and 11 digits in length eg 07771900900" Pattern="^(07[\d]{8,12}|447[\d]{7,11})$" />
        </div>
       <div class="sm:col-6 columns form-group">
           <span class="textfieldlabelrequired">Contact Phone (inc. STD code)</span>
                   <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentPhoneNumber" ID="fldParentPhoneNumber" runat="server" CustomCaption="Contact phone (inc. STD code)" LabelWidth="0" title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900" Pattern="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$"/>
    </div>
        <div class="sm:col-12 columns form-group">
            <asp:CustomValidator ID="fldMobileTelValidator" runat="server"></asp:CustomValidator>
        </div>
     </div>

     <div class="row">
        <div class="sm:col-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentEmailAddress" HTML5InputType="email" ID="fldEmail" runat="server" IsRequired="false" LabelWidth="200" CustomCaption="Email Address" />
        </div>
         <div class="sm:col-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentRelationshipID" ID="fldParentRelationshipID" runat="server" IsRequired="true"  CustomCaption="Relationship" ClientIDMode="Static" />
             <asp:CustomValidator ID="fldParentRelationshipIDValidator" runat="server"></asp:CustomValidator>
            </div>
     </div>
   
<%--     <div class="row">
      <div class="sm:col-6 columns form-group"><p>Quickly find an address by entering postcode or partial address below:</p>
<p><asp:TextBox ID="txtLookup" runat="server" CssClass="formtext" ></asp:TextBox>
<asp:Button ID="btnFind" runat="server" Text="Find" CausesValidation="False" /></p>
          <div id="divlstResult" runat="server" visible="true"><asp:ListBox ID="lstresult" runat="server"  AutoPostBack="True" Width="400"></asp:ListBox></div>
          </div>
        </div>--%>
      <div id="divAddresslines" runat="server" visible="true">
  <div class="row">
    <div class="sm:col-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress1" ID="txtAddress1" runat="server" IsRequired="true" CustomCaption="First Line of Address" ClientIDMode="Static" Placeholder="Start typing your address here..." />
    </div>
        <div class="sm:col-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress2" ID="txtAddress2" runat="server" IsRequired="false"  CustomCaption="Second Line of Address" ClientIDMode="Static" />
    </div>
</div>
  <div class="row">
        <div class="sm:col-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress3" ID="txtAddress3" runat="server" IsRequired="true"  CustomCaption="Town" ClientIDMode="Static" />
    </div>
        <div class="sm:col-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress4" ID="txtAddress4" runat="server" IsRequired="true"  CustomCaption="County" ClientIDMode="Static" />
    </div>
      </div>
    <div class="row">
         <div class="sm:col-12 columns form-group">
             <label for="postcode" class="textfieldlabelrequired">Postcode</label>
             <input title="Postcode" runat="server" maxlength="9" type="text" id="postcode" class="form-control" name="pre[postalcode]" autocomplete="off" ClientIDMode="Static" />
             <asp:CustomValidator ID="postcodeValidator" runat="server"></asp:CustomValidator>
             </div>
        </div>
    </div>

    <%If ConsentRequired = True %>
    <hr />

        <div class="row">
            <div class="sm:col-12 columns form-group">
                <p><strong>As you are under 18,</strong> we would also like to discuss your progress on your course with your parents/guardian/carer. Please confirm if you consent to us doing so. You can withdraw your consent at any time by contacting Student Records. <strong>We reserve the right to discuss e.g. your attendance, behaviour, financial matters including bursaries and any safeguarding issues with your named contacts.</strong></p>
         <span class="textfieldlabelrequired"> Please confirm</span>
         <asp:DropDownList runat="server" ID="ddConsent" CssClass="form-group" ClientIDMode ="Static">
            <asp:ListItem Text="--Please Select--" Value=""></asp:ListItem>
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="2"></asp:ListItem>
         </asp:DropDownList>
            </div>
        </div>
    <%End If %>
 </div>




        <%--<cc1:CCCButton id="btnBack" runat="server" Text="Back" CssClass="button" LinkResource="checkout_enrolments_1618_aspx"/>
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button"  LinkResource="checkout_enrolments2_1618_aspx" CausesValidation="true" EnableEnterKey="true" />--%>

<asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert theme-danger" ForeColor="" />

<div class="alert theme-inverse" role="alert">
    <div class="container">
        <div class="row">
            <div class="col">
                <button type="button" class="btn-solid btn-styled theme-secondary btn-lg BackButton"><i class="fa-solid fa-angles-left"></i> Back</button>
                <cc1:CCCButton ID="btnBack" LinkResource="apply_personal_details" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
            </div>
            <div class="col text-end">
                <span class="d-grid gap-2 md:d-block">
                    <button type="button" class="btn-solid btn-styled theme-primary btn-lg NextButton">Next <i class="fa-solid fa-angles-right"></i></button>
                    <cc1:CCCButton ID="btnContinue" LinkResource="apply_further_details" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" SaveForLater="true" SaveForLaterIn="Request" />
                </span>
            </div>
        </div>
    </div>
</div>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", (event) => {
        let fldParentRelationshipIDInputBox = addSearchableDropDown(cboParentRelationshipID);

        // Get Address IO
        document.addEventListener("getaddress-autocomplete-suggestions", function (e) {
            console.log(e.suggestions);
        });

        document.addEventListener("getaddress-autocomplete-suggestions-failed", function (e) {
            console.log(e.status);
            console.log(e.message);
        });

        document.addEventListener("getaddress-autocomplete-address-selected", function (e) {
            console.log(e.address);

            //postcode.dispatchEvent(postCodeKeyup);
        });

        document.addEventListener("getaddress-autocomplete-address-selected-failed", function (e) {
            console.log(e.status);
            console.log(e.message);
        });

        getAddress.autocomplete(
            'txtParentAddress1',
            'jxO2lYlUvUO86UTwrjA57w42776',
            {
                output_fields: {
                    formatted_address_0: 'txtParentAddress1',  /* The id of the element bound to 'formatted_address[0]' */
                    town_or_city: 'txtParentAddress3',  /* The id of the element bound to 'town_or_city' */
                    county: 'txtParentAddress4',  /* The id of the element bound to 'county' */
                    postcode: 'postcode'  /* The id of the element bound to 'postcode' */
                },
                id_prefix: 'getAddress-autocomplete-native',  /* The id of the textbox and list container */
                delay: 200, /* millisecond delay between keypress and API call */
                minimum_characters: 2,  /* minimum characters to initiate an API call */
                select_on_focus: true,  /* if true, highlights textbox characters on focus*/
                alt_autocomplete_url: undefined,  /* alterative local autocomplete URL (when API key is not used) */
                alt_get_url: undefined,  /* alterative local get URL (when API key is not used) */
                suggestion_count: 6, /* number of retreived suggestions (max 20) */
                filter: undefined, /* the suggestion filter (see Autocomplete API)*/
                bind_output_fields: true, /* if true, bind the output_fields to the address*/
                input_focus_on_select: true,  /* if true, sets the focus to the textbox after selecting an address*/
                debug: false, /* if true, logs behavior */
                enable_get: true /* if true, retreives address on select */
            }
        );
    });
</script>