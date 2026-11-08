<%@ Control Language="VB" AutoEventWireup="false" CodeFile="employment.ascx.vb" Inherits="employment" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

    
       <script type="text/javascript">
         $(document).ready(function () {

            if ($("#<%=selectEmployed.ClientID%>").val() == "10") {
                $("#divEmploymentLength").show();
          

            }
            else if ($("#<%=selectEmployed.ClientID%>").val() == "11") {
                $("#divUnEmploymentLength").show();
            }
            else if ($("#<%=selectEmployed.ClientID%>").val() == "12") {
                $("#divUnEmploymentLength").show();
            }

             $('#<%= selectEmployed.ClientID %>').change(function () {
                 $("#divEmploymentLength").hide();
           
                 $("#divUnEmploymentLength").hide();
           
                 $("#<%=selectEmploymentLength.ClientID%>").val("")
                 $("#<%=selectEmploymentIntensity.ClientID%>").val("")
                 $("#<%=selectLengthUnemployed.ClientID%>").val("")
                 if ($("#<%=selectEmployed.ClientID%>").val() == "10") {
                     $("#divEmploymentLength").show();
             
                     return;
                 }
                 else if ($("#<%=selectEmployed.ClientID%>").val() == "11") {
                     $("#divUnEmploymentLength").show();
                     return;
                 }
                 else if ($("#<%=selectEmployed.ClientID%>").val() == "12") {
                     $("#divUnEmploymentLength").show();
                     return;
                 }
             });
         });
 
       </script>

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
                <a class="breadcrumb-link" href="webenrolment.aspx?page=~/additional/apply/next_of_kin.ascx"><i class="fa-solid fa-users"></i>&nbsp;Emergency Contact Details</a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link" href="webenrolment.aspx?page=~/additional/apply/further_details.ascx"><i class="fa-solid fa-clipboard-list"></i>&nbsp;Further Details</a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link" href="webenrolment.aspx?page=~/additional/apply/quals_on_entry.ascx"><i class="fa-solid fa-award"></i>&nbsp;Qualifications on Entry</a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link active" href="webenrolment.aspx?page=~/additional/apply/employment.ascx"><i class="fa-solid fa-city"></i>&nbsp;Employment Status</a>
            </li>
        </ol>
    </nav>
</div>

<div class="progress mt-5 mb-5" role="progressbar" aria-label="Progress..." aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar bg-primary" style="width: 60%">60%</div>
</div>

<div class="bd-callout mt-5 mb-5">
    <h4><i class="fa-solid fa-city"></i> Employment Status</h4>

      <div class="row">
          <div class="form-input"> 
              <span class="textfieldlabelrequired">What will be your employment status the day before you start your studies?</span>
             <asp:DropDownList ID="selectEmployed" runat="server"   EnableViewState="true" ClientIDMode="Static">
             <asp:ListItem value="">--Please Select--</asp:ListItem>
             <asp:ListItem value="10">In paid employment</asp:ListItem>
             <asp:ListItem value="11">Not in paid employment, looking for work</asp:ListItem>
             <asp:ListItem value="12">Not in paid employment, not looking for work</asp:ListItem>
             </asp:DropDownList>
          </div>
      </div>
    <!-- START YES Employed - These are all related to YES employed -->


      <div class="row"  id="divEmploymentLength" style="display:none">
          <div class="form-input">
              <span class="textfieldlabelrequired">Are you self Employed?</span>
            <asp:RadioButtonList runat="server" ID="rdoSelfEmp" CssClass="form-input TableInline">
            <asp:ListItem Text="Yes" Value="1" ></asp:ListItem>
            <asp:ListItem Text="No" Value="0"></asp:ListItem>        
            </asp:RadioButtonList>
         </div>

          <div class="form-input">
              <span class="textfieldlabelrequired">I have worked (number of months)</span>
             <asp:DropDownList ID="selectEmploymentLength" runat="server"   EnableViewState="true" ClientIDMode="Static">
             <asp:ListItem value="">--Please Select--</asp:ListItem>
             <asp:ListItem value="1">Upto 3 months</asp:ListItem>
             <asp:ListItem value="2">4 to 6 months</asp:ListItem>
             <asp:ListItem value="3">7 to 12 months</asp:ListItem>
             <asp:ListItem value="4">Over 12 months</asp:ListItem>
             </asp:DropDownList>
          </div>

        <div class="form-input">
              <span class="textfieldlabelrequired">I work (hours per week)</span>
             <asp:DropDownList ID="selectEmploymentIntensity" runat="server"    EnableViewState="true" ClientIDMode="Static">
             <asp:ListItem value="">--Please Select--</asp:ListItem>
             <asp:ListItem value="5">Employed for 1 to 10 hours per week</asp:ListItem>
             <asp:ListItem value="6">Employed for 11 to 20 hours per week</asp:ListItem>
             <asp:ListItem value="7">Employed for 21 to 30 hours per week</asp:ListItem>
             <asp:ListItem value="8">Employed for 31+ hours per week</asp:ListItem>
             </asp:DropDownList>
          </div>

         <div class="form-input">
                 <span class="textfieldlabelrequired">Employed From date</span>
            <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="DateFrom"  ID="StudentEmploymentHistoryField2" runat="server" IsRequired="false" Width="150" CustomFieldType="Date"
           CustomCaption=" " HTML5InputType="date" />
          </div>

          <%If IsUnder19 = False Then %>
            <div class="form-input">
                <span class="checkbox">
				<asp:CheckBox ID="chkLowWage" runat="server" ClientIDMode="static"
					Text="Tick this box if you earn less than &pound;26,800 per year in gross pay." Font-Bold="True" 
					CausesValidation="True" />
</span>	
            </div>
          <div class="form-input mt-3">
            <div id="alertLowWage" class="alert alert-warning hstack gap-3 d-none" role="alert">
                <div>
                    <i class="fa-solid fa-triangle-exclamation"></i>
                </div>
                <div>
                    <p>
                        Please upload 2 wage slips identifying a gross salary of less than <asp:Label runat="server" ID="lblLowWageThreshold">&pound;26,800</asp:Label> if you tick this box
                    </p>
                </div>
            </div>
        </div>

<div class="form-input mt-3">
    <div class="alert alert-primary hstack gap-3" role="alert">
        <div>
            <i class="fa-solid fa-circle-info"></i>
        </div>
        <div>
            <p>
                You may be eligible for fee remission if you earn less than the above amount and are enrolling to a Level 2 or Level 3 course.
            </p>
        </div>
    </div>
</div>

          
          <%End If %>
      </div>

   <div class="row"  id="divUnEmploymentLength" style="display:none">
        <div class="form-input"> 
              <span class="textfieldlabelrequired">Length of time unemployed</span>
             <asp:DropDownList ID="selectLengthUnemployed" runat="server"  EnableViewState="true" ClientIDMode="Static">
             <asp:ListItem value="">--Please Select--</asp:ListItem>
             <asp:ListItem value="1">Less than 6 months</asp:ListItem>
             <asp:ListItem value="2">6 to 11 months</asp:ListItem>
             <asp:ListItem value="3">12 to 23 months</asp:ListItem>
             <asp:ListItem value="4">24 to 35 months</asp:ListItem>
             <asp:ListItem value="5">36 months or over</asp:ListItem>
             </asp:DropDownList>
          </div>
 
      </div>
    

          <%If IsUnder19 = False Then %>
            <div class="form-input mt-3">
                <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="BenefitStatusIndicatorID"  ID="fldBenefitStatusIndicatorID" runat="server" IsRequired="false" CustomCaption="Are you in receipt of any benefits? (Leave blank if not)" LabelWidth="400" ClientIDMode="Static" />
            </div>
                
            <div class="form-input mt-3">
                <div id="alertBenefitStatusIndicatorID" class="alert alert-warning hstack gap-3 d-none" role="alert">
                    <div>
                        <i class="fa-solid fa-triangle-exclamation"></i>
                    </div>
                    <div>
                        <p>
                            Please ensure you upload any evidence of benefits on the next page.
                        </p>
                    </div>
                </div>
            </div>
          <%End If %>
</div>

      
<!--
  <asp:button runat="server" id="btnNoPreviousEmployment" cssClass="show_hide btn btn-primary" text="No previous employment" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:button>
    <br />
    -->
<%-- <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" LinkResource="checkout_quals_on_entry_FE_aspx" />
<cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button"  CausesValidation="true" />--%>

<asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert theme-danger" ForeColor="" />

<div class="alert theme-inverse" role="alert">
    <div class="container">
        <div class="row">
            <div class="col">
                <button type="button" class="btn-solid btn-styled theme-secondary btn-lg BackButton"><i class="fa-solid fa-angles-left"></i> Back</button>
                <cc1:CCCButton ID="btnBack" LinkResource="apply_quals_on_entry" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
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
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        let fldEmployedInputBox = addSearchableDropDown(selectEmployed);
        let fldEmploymentLengthInputBox = addSearchableDropDown(selectEmploymentLength);
        let fldEmploymentIntensityInputBox = addSearchableDropDown(selectEmploymentIntensity);
        let fldLengthUnemployedInputBox = addSearchableDropDown(selectLengthUnemployed);

        let chkLowWage = document.getElementById(`chkLowWage`);
        let alertLowWage = document.getElementById(`alertLowWage`);

        <% If Not Is19PlusOutsideAreaConfirmed = True Then %>
        chkLowWage.addEventListener(`change`, function (event) {
            if (chkLowWage.checked == true) {
                alertLowWage.classList.remove(`d-none`);
            }
            else {
                alertLowWage.classList.add(`d-none`);
            }
        });
        <% End If %>

        let fldBenefitStatusIndicatorID = document.getElementById(`cboBenefitStatusIndicatorID`);
        let alertBenefitStatusIndicatorID = document.getElementById(`alertBenefitStatusIndicatorID`);

        fldBenefitStatusIndicatorID.addEventListener(`change`, function (event) {
        if (fldBenefitStatusIndicatorID.value.length > 0) {
            alertBenefitStatusIndicatorID.classList.remove(`d-none`);
        }
        else {
            alertBenefitStatusIndicatorID.classList.add(`d-none`);
        }
    });

    });
</script>