<%@ Control Language="VB" AutoEventWireup="false" CodeFile="further_details.ascx.vb" Inherits="further_details" %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>
<!--<br />
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
                <a class="breadcrumb-link" href="https://apply.osc.ac.uk"><i class="fa-solid fa-house"></i>&nbsp;Orbital South Colleges</a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item">
                <a class="breadcrumb-link" href="webenrolment.aspx?page=~/apply/courseapply.ascx"><i class="fa-solid fa-book"></i>&nbsp;<%=OfferingRow.CollegeLevelCode%> - <%=OfferingRow.CollegeLevelName %></a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link" href="#"><i class="fa-solid fa-graduation-cap"></i>&nbsp;<%=OfferingRow.Code%> - <%=OfferingRow.Name %></a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link" href="#"><i class="fa-solid fa-user"></i>&nbsp;Personal Details</a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link" href="#"><i class="fa-solid fa-users"></i>&nbsp;Emergency Contact Details</a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link active" href="#"><i class="fa-solid fa-clipboard-list"></i>&nbsp;Further Details</a>
            </li>
        </ol>
    </nav>
</div>

<div class="progress mt-5 mb-5" role="progressbar" aria-label="Progress..." aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar bg-primary" style="width: 40%">40%</div>
</div>

<div class="bd-callout mt-5 mb-5">
    <h4><i class="fa-solid fa-clipboard-list"></i> Further Details</h4>

     <div class="row">
       <div class="sm:col-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NationalityID" ID="fldNationalityID" runat="server" IsRequired="true" CustomCaption="Nationality" ClientIDMode="Static" />
            <asp:CustomValidator ID="fldNationalityIDValidator" runat="server"></asp:CustomValidator>
           </div>
       <div class="sm:col-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CountryID" ID="fldCountryID" runat="server" LabelWidth="400" CustomCaption="Main Country of residence (last 3 years)?" ClientIDMode="Static" AutoPostBack="true" />
            <asp:CustomValidator ID="fldCountryIDValidator" runat="server"></asp:CustomValidator>
           </div>
 
    </div>
    <hr />

          <p><strong>For equality of opportunity monitoring, please select to describe your cultural background (groups based on 2011 census) below:</strong></p>
    <div class="row">
      <div class="sm:col-12 columns form-group"> 
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EthnicGroupID" ID="fldEthnicGroupID" runat="server" IsRequired="false"  ExcludedIDValues="99" CustomCaption="Ethnicity" ClientIDMode="Static" />
            <asp:CustomValidator ID="fldEthnicGroupIDValidator" runat="server"></asp:CustomValidator>
          </div>
    
   </div>
   <hr />

        
    <div class="form-input">
            <span class="textfieldlabelrequired">Do you consider that you have a learning difficulty, disability or health condition?</span>
      
            <asp:DropDownList runat="server" ID="selectLearnDiff"  CssClass="form-input" AutoPostBack="true">
                <asp:ListItem Text="--Please Select--" Value=""></asp:ListItem>
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                <asp:ListItem Text="Rather not say" Value="9"></asp:ListItem>
            </asp:DropDownList>
            <asp:CustomValidator ID="selectLearnDiffValidator" runat="server"></asp:CustomValidator>
            <div style="display:none">
                <cc1:StudentEnrolmentField Visible="true" ClientIDMode="Static" StudentEnrolmentFieldType="LearningDiffOrDisID" ID="fldLearningDiffOrDisID" runat="server" IsRequired="false"   />
        </div>
        <div class="alert theme-warning hstack gap-3 mt-1" role="alert">
            <div>
                <i class="fa-solid fa-circle-info"></i>
            </div>
            <div>
                <p>
                    It is <strong>your</strong> responsibility to disclose any support requirements. This will help the College make reasonable adjustments, limited by funding available.
                </p>
            </div>
        </div>
    </div>
    <br />

<div class="form-input" id="disfields" >
<%--    <div class="panel-heading">Disability Category</div>--%>
    <p></p>
    <asp:Button runat="server" visible="false" ID="btnNoDisability" CssClass="button button-orange" Text="No learning difficulty, disability or health condition" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:Button>
    <br />
    <br />

    <div id="slidingdiv" class="slidingDiv" runat="server">
        <%--<asp:Table class="table table-striped text-center" ID="tblDisability" runat="server">--%>
            <%--<tr><th>Qualification</th><th>Subject (if not in list)</th><th>Predicted Grade</th><th>Grade</th><th>Date Awarded</th></tr>--%>
        <%--</asp:Table>--%>

        <p><strong>Learning difficulty, disability or health condition</strong></p>
        <p>Please indicate your primary 'main' condition which could impact on your studies</p>
        <div class="row" runat="server" id="Disabilities">

        </div>

        <asp:Button runat="server" ID="btnAdd" CssClass="btn-solid btn-styled theme-primary" Text="Add Row"></asp:Button>

    </div>
    <asp:CustomValidator ID="DisabilitiesValidator" runat="server"></asp:CustomValidator>

</div>

<%--    <div class="row"  id="disfields">
      <div class="sm:col-6 columns form-group"> 
             <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DisabilityCategory1ID" ID="stuDisabilityCategory1ID" runat="server" LabelWidth="550" IsRequired="false" CustomCaption="* Please indicate your primary 'main' condition which could impact on your studies" ExcludedIDValues="99"/>
              <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DisabilityCategory2ID" runat="server" Visible="true" IsRequired="false"  LabelWidth="400" CustomCaption="And, if appropriate, a secondary condition" />
        </div>

      </div>--%>

</div>

<%If GetUKResident() = False Then %>
    <div class="bd-callout bd-callout-askham bd-callout-grey">
        <h4><i class="fa-solid fa-passport"></i> International Student Information</h4>

        <div class="row">
            <div class="sm:col-12 columns form-group"> 
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="AsylumSeekerRef" ID="fldAsylumSeekerRef" runat="server" IsRequired="false" CustomCaption="What is your Immigration Health Surcharge (IHS) number?" HTML5InputType="number" />
                <div class="callout callout-info">The reference number issued when you pay the Immigration Health Surcharge as part of a UK visa or immigration application</div>
                <asp:CustomValidator ID="AsylumSeekerRefValidator" runat="server"></asp:CustomValidator>
            </div>
        </div>

        <div class="row">
            <div class="sm:col-12 columns form-group"> 
                <span class="textfieldlabelrequired">Do you have a right to work in the UK?</span>
                <p>Legal permission to work in the United Kingdom based on your citizenship, visa, or immigration status</p>
                <asp:RadioButtonList runat="server" ID="fldRightToWorkInUK" CssClass="form-input TableInline">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:CustomValidator ID="fldRightToWorkInUKValidator" runat="server"></asp:CustomValidator>
            </div>
        </div>

        <div class="row">
            <div class="sm:col-12 columns form-group"> 
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="RefugeeAsylumSeekerStatus" ID="fldRefugeeAsylumSeekerStatus" runat="server" IsRequired="false" CustomCaption="Do you have settled/pre settled status if you are non-UK Nationality?" ExcludedIDValues="100,101,102,103" />
                <div class="callout callout-info">Immigration status granted under the EU Settlement Scheme allowing eligible non-UK nationals to live, study, and work in the UK</div>
                <asp:CustomValidator ID="fldRefugeeAsylumSeekerStatusValidator" runat="server"></asp:CustomValidator>
            </div>
        </div>

        <div class="row">
            <div class="sm:col-12 columns form-group"> 
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="VisaTypeID" ID="fldVisaTypeID" runat="server" IsRequired="false" CustomCaption="Are you subject to any VISA such as dependents or spousal visa if you are non-UK nationalities?" ExcludedIDValues="100,101,102,103" />
                <div class="callout callout-info">Whether you hold a visa, such as a dependent or spousal visa, that allows you to live, study, or work in the UK</div>
                <asp:CustomValidator ID="fldVisaTypeIDValidator" runat="server"></asp:CustomValidator>
            </div>
        </div>

    </div>
<%End If %>

<div class="bd-callout mt-5 mb-5">
    <h4><i class="fa-solid fa-hand-holding"></i> Supporting You</h4>

    <div class="row">
        <div class="sm:col-12 columns form-group"> 
            <span class="textfieldlabelrequired">Are you currently in care?</span>
            <asp:RadioButtonList runat="server" ID="fldInCare" CssClass="form-input TableInline">
	            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
	            <asp:ListItem Text="No" Value="No"></asp:ListItem>
            </asp:RadioButtonList>
            <asp:CustomValidator ID="fldInCareValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>

    <div class="row">
        <div class="sm:col-12 columns form-group"> 
            <span class="textfieldlabelrequired">Are you are care leaver?</span>
            <p>Have you recently left care (care leaver)? - A care leaver is a young person aged 16-25 who has been 'looked after' at some point by a local authority (for example placed with foster carers) since the age of 14, and in care on or after their 16th birthday</p>
            <asp:RadioButtonList runat="server" ID="fldCareLeaver" CssClass="form-input TableInline">
                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                <asp:ListItem Text="No" Value="No"></asp:ListItem>
            </asp:RadioButtonList>
            <asp:CustomValidator ID="fldCareLeaverValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>

    <%If IsUnder19 = True Then %>
    <div class="row">
        <div class="sm:col-12 columns form-group"> 
            <span class="textfieldlabelrequired">Are you are young carer?</span>
            <p>Do you look after a family member who may have a physical disability, a long-term illness, a mental health problem or drug / alcohol dependencies?</p>
            <asp:RadioButtonList runat="server" ID="fldYoungCarer" CssClass="form-input TableInline">
                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                <asp:ListItem Text="No" Value="No"></asp:ListItem>
            </asp:RadioButtonList>
            <asp:CustomValidator ID="fldYoungCarerValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>
    <%End If %>

    <%--<div class="row">
        <div class="sm:col-12 columns form-group mb-3">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="LookedAfter" ID="StudentEnrolmentField3" runat="server"  LabelWidth="300" IsRequired="false" CustomCaption="Tick if you are currently in care?"/>
        </div>
    </div>--%>

    <%--<p>Have you recently left care (care leaver)? - A care leaver is a young person aged 16-25 who has been 'looked after' at some point by a local authority (for example placed with foster carers) since the age of 14, and in care on or after their 16th birthday.</p>
    <div class="row">
        <div class="sm:col-12 columns form-group mb-3">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CareLeaver" ID="StudentEnrolmentField16" runat="server"  LabelWidth="300" IsRequired="false" CustomCaption="Tick if you are a care leaver?"/>
        </div>
    </div>--%>

    <%--<%If IsUnder19 = True Then %>
    <p>Do you look after a family member who may have a physical disability, a long-term illness, a mental health problem or drug / alcohol dependencies (young carer)?</p>
    <div class="row">
        <div class="sm:col-12 columns form-group mb-3">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="YoungCarer" ID="StudentEnrolmentField7" runat="server"  LabelWidth="300" IsRequired="false" CustomCaption="Tick if you are a young carer?"/>
        </div>
    </div>
    <%End If %>--%>

    <%If IsUnder19 = True Then %>
    <div class="row">
        <div class="sm:col-12 columns form-group"> 
            <span class="textfieldlabelrequired">Were you eligible for free school meals at school?</span>
            <p>Meals provided free of charge during school due to low household income or eligibility for certain benefits</p>
		    <asp:RadioButtonList runat="server" ID="fldFreeSchoolMeals" CssClass="form-input TableInline">
			    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
			    <asp:ListItem Text="No" Value="No"></asp:ListItem>
		    </asp:RadioButtonList>
		    <asp:CustomValidator ID="fldFreeSchoolMealsValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>
    <%End If %>

    <div class="row">
        <div class="sm:col-12 columns form-group"> 
            <span class="textfieldlabelrequired">Are you a military service child?</span>
            <p>A person whose parent or carer serves in the Regular armed forces, or as a Reservist, or has done at any point during the first 25 years of that person’s life.</p>
	        <asp:RadioButtonList runat="server" ID="fldMilitaryServiceChild" CssClass="form-input TableInline">
		        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
		        <asp:ListItem Text="No" Value="No"></asp:ListItem>
	        </asp:RadioButtonList>
	        <asp:CustomValidator ID="fldMilitaryServiceChildValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>

    <%If IsUnder19 = True Then %>
    <div class="row">
        <div class="sm:col-12 columns form-group"> 
            <span class="textfieldlabelrequired">Are you known to social care services?</span>
            <p>Are you receiving support, involvement, or assistance from children's social care or social services</p>
	        <asp:RadioButtonList runat="server" ID="fldKnownToSocialCare" CssClass="form-input TableInline">
		        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
		        <asp:ListItem Text="No" Value="No"></asp:ListItem>
	        </asp:RadioButtonList>
	        <asp:CustomValidator ID="fldKnownToSocialCareValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>
    <%End If %>

    <%--<div class="row">
        <div class="sm:col-12 columns form-group mt-3 mb-3">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentCarerInArmedForces" ID="fldParentCarerInArmedForces" runat="server"  LabelWidth="300" IsRequired="false" CustomCaption="Are you a military service child?"/>
        </div>
    </div>--%>

    <%--<div class="alert alert-secondary hstack gap-3 mt-1" role="alert">
        <div>
            <i class="fa-solid fa-circle-info"></i>
        </div>
        <div>
            <p>
                A person whose parent or carer serves in the Regular armed forces, or as a Reservist, or has done at any point during the first 25 years of that person’s life.
            </p>
        </div>
    </div>--%>

</div>  


        <%--<cc1:CCCButton id="btnBack" runat="server" Text="Back" CssClass="button" />
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button"  CausesValidation="true" EnableEnterKey="true" />--%>


<asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert theme-danger" ForeColor="" />

<div class="alert theme-inverse" role="alert">
    <div class="container">
        <div class="row">
            <div class="col">
                <button type="button" class="btn-solid btn-styled theme-secondary btn-lg BackButton"><i class="fa-solid fa-angles-left"></i> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
            </div>
            <div class="col text-end">
                <span class="d-grid gap-2 md:d-block">
                    <button type="button" class="btn-solid btn-styled theme-primary btn-lg NextButton">Next <i class="fa-solid fa-angles-right"></i></button>
                    <cc1:CCCButton ID="btnContinue" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" SaveForLater="true" SaveForLaterIn="Request" />
                </span>
            </div>
        </div>
    </div>
</div>

<asp:HiddenField ID="NoDisability" Value="false" runat="server" ClientIDMode="static" />
<asp:HiddenField ID="intDisabilityRows" Value="0" runat="server" ClientIDMode="static" />

        </div>
    </div>
</div>
<script type="text/javascript">
<%--    $(document).ready(function () {

            //$("#disfields").hide();
            if ($("#<%=selectLearnDiff.ClientID%>").val() == "1") {
                $("#disfields").show();
            }
            $('#<%= selectLearnDiff.ClientID %>').change(function () {
              //  $('#cboLearningDiffOrDisID').val($(this).val());
            if ($("#<%=selectLearnDiff.ClientID%>").val() == "1") {
                $("#disfields").show();
                    return;
                }
                else {
                $("#disfields").hide();
                }
            });


    });--%>
</script>

<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        let fldNationalityIDInputBox = addSearchableDropDown(cboNationalityID);
        let fldCountryIDInputBox = addSearchableDropDown(cboCountryID);
        let fldEthnicGroupIDInputBox = addSearchableDropDown(cboEthnicGroupID);

        let selectBoxes = document.querySelectorAll(`#aspnetForm select`);

        selectBoxes.forEach(function (select) {
            if (select.name.indexOf(`cboDisabilityCategoryID`) >= 0) {
                let disabilityCategoryIDInputBox = addSearchableDropDown(select);
            }
        });

        let checkBoxes = document.querySelectorAll(`#aspnetForm input[type=checkbox]`);

        checkBoxes.forEach(function (checkbox) {
            if (checkbox.name.indexOf(`chkIsPrimary`) >= 0) {
                checkbox.addEventListener(`change`, function (event) {
                    untickOtherPrimaryOptions(checkbox);
                });
            }
        });
    });

    function untickOtherPrimaryOptions(clickedCheckbox) {
        let checkBoxes = document.querySelectorAll(`#aspnetForm input[type=checkbox]`);

        checkBoxes.forEach(function (checkbox) {
            if (checkbox.name.indexOf(`chkIsPrimary`) >= 0) {
                if (checkbox.id != clickedCheckbox.id) {
                    checkbox.checked = false;
                }
            }
        });
    }
</script>
