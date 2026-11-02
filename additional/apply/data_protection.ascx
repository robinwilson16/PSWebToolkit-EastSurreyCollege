<%@ Control Language="VB"  AutoEventWireup="false" CodeFile="data_protection.ascx.vb" Inherits="data_protection"  %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>
      <!--          <ol class="breadcrumb">
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments.ascx">Personal Details</a></li>
                    <li id="linkParent" runat="server" CausesValidation="true"><a href="webenrolment.aspx?page=~/webcontrols/checkout_parent_guardian.ascx">Guardian / Emergency</a></li>                   
                    <li id="linkFurther" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments2.ascx">Further Details</a></li>
                    <li id="lnkQuals" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_quals_on_entry.ascx">Qualifications</a></li>
                     <li id="linkAttach" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_attachments.ascx">Attachments</a></li>
                     <li id="linkDeclare">Declarations</li>
                </ol>
          -->

<script>

                 $(function () {
                     $('[data-toggle="tooltip"]').tooltip()
                 })

          </script>

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
                <a class="breadcrumb-link" href="#"><i class="fa-solid fa-clipboard-list"></i>&nbsp;Further Details</a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link" href="#"><i class="fa-solid fa-award"></i>&nbsp;Qualifications on Entry</a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link" href="#"><i class="fa-solid fa-city"></i>&nbsp;Employment Status</a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link" href="#"><i class="fa-solid fa-paperclip"></i>&nbsp;Documents/Evidence</a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link" href="#"><i class="fa-solid fa-camera"></i>&nbsp;Photo Upload</a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link active" href="#"><i class="fa-solid fa-circle-info"></i>&nbsp;Privacy Notice</a>
            </li>
        </ol>
    </nav>
</div>

<div class="progress mt-5 mb-5" role="progressbar" aria-label="Progress..." aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar bg-primary" style="width: 90%">90%</div>
</div>

<div class="bd-callout mt-5 mb-5 PrivacyNotice">
    <h4><i class="fa-solid fa-circle-info"></i> Privacy Notice</h4>

    <p>The College endeavours to be as transparent about the processing of individual data as it can be.</p>

    <p>This Privacy Notice sets out the purpose for collecting the information, your rights in relation to your information we have collected, how we protect your information and who we share your information with.</p>

    <p>For example, the personal information you supply to us will be used by the DfE, to issue you a Unique Learner Number (ULN), and a Personal Learning Record if not already set up. For further information about use and access to your personal data, details of organisations with whom we regularly share data, information about how long we retain your data, and how to change your consent to being contacted, please visit: <a href="https://guidance.submit-learner-data.service.gov.uk/<%=OfferingRow.AcademicYearID.Replace("/", "-") %>/ilr/ilrprivacynotice" target="_blank" rel="noopener">https://guidance.submit-learner-data.service.gov.uk/<%=OfferingRow.AcademicYearID.Replace("/", "-") %>/ilr/ilrprivacynotice</a></p>

    <p>Please also see the College’s Student Privacy Notice available at <a href="https://www.osc.ac.uk/" target="_blank" rel="noopener">https://www.osc.ac.uk/</a></p>

    <hr />

    <h5>How We Use Your Personal Data</h5>

    <p>The data you provide including in some cases, special category (or "sensitive") data, will be stored and processed i.e. collected and used, by the College to support your enrolment and provision of education. It will be used for administrative and financial purposes relating to the provision of your education and provision of accommodation (so we can perform our contract with you); for audit and for Ofsted inspection and to provide local education authorities (“LEAs”), schools and academies with information such as destinations data (where we have a statutory obligation to process and share your data); to track student loans, support care standards, safeguarding and health and safety (because of our legal obligations as a public body); for marketing and event management and to monitor compliance with policies and standards (to support the College’s legitimate interests) including the College’s collections policy for failure to pay fees (where we reserve the right to pass your personal details onto debt collectors, if necessary).</p>

    <hr />

    <h5>Sharing Your Data</h5>

    <p>We will share your data with some third parties, including the DfE (Department for Education), LEAs, OfS (Office for Students), Ofsted, Student Loans Company, Higher Education Statistics Agency ("HESA") and awarding bodies where this is necessary for the provision of your education or other core purposes and or where there is a statutory obligation to provide this information.</p>

    <p>For instance, every student must have an Individualised Learner Record (ILR) and the College must collect data about learners and learning undertaken and share those details with the DfE as a condition of its funding. Your information may be shared by the DfE with third parties for education, training, employment and well-being related purposes, including for research.</p>

    <p>Please note: in the case of international students, the College is required to share your personal information, including details of your visa status, with the UKVI, in order to comply with immigration rules.</p>
    
    <p>The College will not release any of your disclosed personal data to a third party where this contravenes the data protection legislation. <strong>However, we may make a disclosure without consent when: a learner under the age of 18 or a vulnerable adult is believed to be a serious risk of harm, i.e. for safeguarding reasons; there is evidence of serious public harm or risk of harm to others; there is evidence of serious health risk to the individual; instructed to do so by court of statutory agency in the prevention, detection or prosecution of crime.</strong> If you are under 18 years of age, the College also reserves the right to discuss e.g. your attendance, behaviour, financial matters including bursaries and any safeguarding issues with your named contacts.</p>

    <p>Where your consent is required for us to share your information with third parties such as the provision of catering and transport, offsite activities, etc there will be a clear purpose for the sharing and a data sharing agreement will be put in place to define expectations for the use, control and security of that data. Where your consent is required for us to share your information with third parties, you can withdraw your consent at any time; but this could prevent those services being provided to you.</p>

    <p><strong>We do not share information about our students with anyone without consent unless the law and our policies allow us to do so.</strong></p>

    <p>The College will contact you by email, post or phone/mobile whilst you are studying here regarding your course or progression. It will also contact your next of kin in an emergency by phone.</p>

    <p>You may be contacted after you have completed your programme of learning to establish whether you have entered employment or gone onto further training or education.</p>

    <hr />

    <h5>How Long We Keep Your Data For</h5>

    <p>We hold personal data in accordance with the College data retention policy (see <a href="https://www.osc.ac.uk/" target="_blank" rel="noopener">https://www.osc.ac.uk/</a> for further details). How long we keep information for will vary according to the type of information.</p>

    <p>Any data will either be deleted or anonymised when no longer needed. Unless otherwise stated, all data will remain at all times within the UK and European Economic Area ("EEA").</p>

    <p>If any data is to be shared outside the EEA, the College will enter into appropriate data processing agreements which will specify the safeguards that have to be in place to comply with UK data protection law, and if applicable, EU data protection law in cases where personal data will transfer to countries of the EU. If you are normally resident outside the EEA such as in the United States, China, Isle of Man or Channel Islands, you consent to your data being transferred outside of the EEA in the event that we have to contact your parents, guardian or carer, or for any other purposes related to your agreement with us, including medical emergency.</p>
    
    <hr />
    
    <h5>College Data Protection Officer</h5>

    <p>If you have any concerns about the way the College collects or uses your personal data, you should raise your concerns in the first instance with the College’s Data Protection Officer, <a href="mailto:person@osc.ac.uk?Subect=Privacy%20Statement">person@osc.ac.uk</a>. If you are not satisfied with the College's response, you you have the right to complain. See the College's Complaints Policy at <a href="https://www.osc.ac.uk/publication-scheme-customer-services/" rel="noopener">https://www.osc.ac.uk/publication-scheme-customer-services/</a> for further details. You also have the right to contact the Information Commissioner's Office at <a href="https://ico.org.uk/" target="_blank" rel="noopener">https://ico.org.uk/</a>.</p>

    <p>For further details about how we use your personal data and your rights under data protection legislation, see <a href="https://www.osc.ac.uk" target="_blank" rel="noopener">https://www.osc.ac.uk/publication-scheme-data-protection/</a></p>

    <hr />

    <h5>Terms and Conditions</h5>

    <p>These are available on the College web site <a href="https://www.osc.ac.uk/publication-scheme-admissions/" target="_blank" rel="noopener">https://www.osc.ac.uk/publication-scheme-admissions/</a> or by request from Student Records. You understand they include important information about our rights to vary the contract with you, our liability to you and our rights to terminate the contract with you.</p>

    <p>By enrolling you also confirm:</p>
    <ul>
        <li>you agree to be enrolled on the course as set out in the College’s Admissions Policy available at <a href="https://www.osc.ac.uk/publication-scheme-admissions/" target="_blank" rel="noopener">https://www.osc.ac.uk/publication-scheme-admissions/</a>.</li>
        <li>you give the College permission to view your personal learning record and to access your previous achievements to support this enrolment.</li>
        <li>you are not already studying at another institution, or with another training provider, on the start date of this course.</li>
        <li>you have received appropriate information and guidance to help you make an informed decision as to whether you want to enrol on this course.</li>
        <li>if you have to pay fees for your course, that you will pay those fees as and when they become due and payable.</li>
    </ul>

    <hr />

    <h5>Information Advice and Guidance</h5>

    <p>By enrolling, you have confirmed the following in relation to your chosen programme:</p>
    <ul>
        <li>You have received information, advice and guidance to assess your suitability for this course, and we reviewed your goals, expectations and career progressions options available post completion.</li>
        <li>You fully understand the requirements of the programme and understand the entry requirements.</li>
        <li>You have been made aware of the College policies <a href="https://www.osc.ac.uk/college-policies/" target="_blank" rel="noopener">https://www.osc.ac.uk/college-policies/</a>.</li>
        <li>The College aims to provide a healthy and safe environment for you to learn but you understand that you also play a part in taking reasonable care in all activities to safeguard the health and safety of yourself and others.</li>
        <li>You consented to your photograph being taken and used in College systems for the purpose of identification. It will also be used on your Photo ID card.  You further consented to wearing the ID card whenever you are on one for the College sites.</li>
        <li>You will be diligent in your learning, attend classes, and take exams as required to achieve the objectives agreed in your individual learning plan.</li>
        <li>You consent to being contacted by the College, or a third party acting on our behalf, for the purposes of collecting your destination on completion of your learning programme.</li>
        <li>If you are 16-18 the College has collected your parent(s)/guardian(s)/carer(s) contact details to notify them of an emergency situation or if the College feels you are at risk of becoming a NEET (Not in Education, Employment or Training) or if there is a disciplinary taking place.  If you are aged 19+ the College has collected next of kin emergency details.</li>
        <li>You will notify the College, if during the course, you are convicted of a criminal offence (other than minor motoring offences). For further details see the College’s Admissions Policy available at <a href="https://www.osc.ac.uk/publication-scheme-admissions/" target="_blank" rel="noopener">https://www.osc.ac.uk/publication-scheme-admissions/</a>.</li>
        <li>You understand why your information is being collected and who will have access to our personal data.  You declare that all the information you have provided is accurate and that any false statements may result in disciplinary proceedings.</li>
        <li>You understand that the personal information provided is passed to the DfE to meet legal duties under the Apprenticeship, Skills, Children and Learning Act 2009, and for the Agencies Learning Record Service (LRS) to create and maintain a unique learning number (ULN).  The information provided may be shared with other partner organisations for the purposes relating to education or training.  You understand you can opt out of sharing your personal data with LRS but realise that doing so may later restrict progression opportunities with other institutions.</li>
    </ul>
    
    <hr />

    <h5>Student Declaration</h5>

    <p>I declare that the information given on this enrolment form is correct to the best of my knowledge and that I have read and agree to the above statements. I have read the above Privacy Notice and understand how my personal information will be used and agree to my personal information being used and shared in this way. I have also read and agree to the College’s terms and conditions and understand by signing, this forms a legally binding contract between me and the College.</p>

    <p><strong>If you enrol, you will be deemed as having accepted the terms of your Learner Agreement by your actions.</strong></p>

</div>

<div class="bd-callout mt-5 mb-5">
    <h4><i class="fa-solid fa-check"></i> Confirmation</h4>
    
    <div class="form-input">
      <span class="textfieldlabelrequired"></span><span class="textfieldlabelrequired3"> After you enrol, we would like to send you details of services the College has to offer to support your study and your time here at the College. However, you can unsubscribe from those emails at any time.</span>
            <asp:DropDownList runat="server" ID="selectStayingInTouch"  CssClass="form-input" >
                <asp:ListItem Text="--Please Select--" Value=""></asp:ListItem>
                <asp:ListItem Text="Yes - please use my contact details to keep me informed of services the College has to offer to support my study and my time here at the College" Value="1"></asp:ListItem>
                <asp:ListItem Text="No - I do not wish to receive details of services the College has to offer to support my study and my time here at the College" Value="2"></asp:ListItem>
            </asp:DropDownList>
            <asp:CustomValidator ID="selectStayingInTouchValidator" runat="server"></asp:CustomValidator>
          </div>

        <div class="form-input">
      <span class="textfieldlabelrequired"></span><span class="textfieldlabelrequired3"> I consent to the use of SMS text message by the college with regarding to my enrolment and course.</span>
            <asp:DropDownList runat="server" ID="selectSMSConsent"  CssClass="form-input" >
                <asp:ListItem Text="--Please Select--" Value=""></asp:ListItem>
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="2"></asp:ListItem>
            </asp:DropDownList>
          </div>
            <asp:CustomValidator ID="selectSMSConsentValidator" runat="server"></asp:CustomValidator>

    <hr />

    <h5>Declaration</h5>
 
        <%--<div id="divAdult" runat="server">


        <span class="textfieldlabelrequired">Please note, over 19s are usually liable for course fees. For course fees, these will be higher if you live in a devolved authority area. You may be able to find support based on your personal circumstances. Please tick to confirm you acknowledge this.</span>
            <div class="form-input">
            <asp:CheckBox ID="rdoAdult" runat="server" 
            Text="" Font-Bold="True" CausesValidation="True" />
                </div>
        </div>--%>

    <div class="form-input">
    <p><strong>Please read the following statements.</strong></p>
        
     <ul>
         <li>I declare that the information given on this enrolment form is correct to the best of my knowledge.</li>
         <li>I have read the above Privacy Notice and understand how my personal information will be used and agree to my personal information being used and shared in this way.</li>
         <li>I have read and agree to the College terms and conditions.</li>
     </ul>  
    </div>
       
    <div class="form-input">
        <p><b>Please tick to acknowledge the above statements:</b></p>
     <asp:CheckBox ID="chkConfirm" runat="server" 
            Text="" Font-Bold="True" CausesValidation="True" ClientIDMode="Static" /> 

        <asp:CustomValidator ID="chkConfirmValidator" runat="server"></asp:CustomValidator>
    </div>

    <div class="form-input">
        <p><b>Please sign to acknowledge the above statements:</b></p>
        <uc1:StudentSignature ID="signature" runat="server" />
        <asp:CheckBox ID="IsSigned" runat="server" ClientIDMode="Static" class="d-none" />
        <asp:CheckBox ID="IsSignedComplex" runat="server" ClientIDMode="Static" class="d-none" /> 
        <asp:CustomValidator ID="signatureValidator" runat="server"></asp:CustomValidator>
    </div>

</div>


<%--       <cc1:CCCButton id="btnBack" runat="server" Text="Back" CssClass="button"  LinkResource="checkout_photo_FE_aspx"  />
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Submit" CssClass="button"  CausesValidation="true"/>--%>

<asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert theme-danger" ForeColor="" />

<div class="alert theme-inverse" role="alert">
    <div class="container">
        <div class="row">
            <div class="col">
                <button type="button" class="btn-solid btn-styled theme-secondary btn-lg BackButton"><i class="fa-solid fa-angles-left"></i> Back</button>
                <cc1:CCCButton ID="btnBack" LinkResource="apply_photo" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
            </div>
            <div class="col text-end">
                <span class="d-grid gap-2 md:d-block">
                    <button type="button" class="btn-solid btn-styled theme-primary btn-lg NextButton">Submit Your Details <i class="fa-solid fa-file-arrow-up"></i></button>
                    <cc1:CCCButton ID="btnContinue" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" />
                </span>
            </div>
        </div>
    </div>
</div>
        </div>
    </div>
</div>
<style>

    input[type=checkbox]{

        margin-inline-start:100px;
        width:50px;
        height:30px;
     

    }
</style>


<script>
    document.addEventListener("DOMContentLoaded", (event) => {
        //Marketing Info
        let rdo = document.getElementsByName("<%= selectStayingInTouch.UniqueID%>");
        let chkSentMarktingInfo = document.getElementById(`ctl00_MainContentPlaceholder_ctl00_fldConsent_chkSentMarktingInfo`);
        if (rdo[0].checked) {
            //chkSentMarktingInfo.checked = true;
        }
        else {
            //chkSentMarktingInfo.checked = false;
        }

        //Signature
        let signature = document.getElementById(`signature`);
        let clear = document.getElementById(`clear`);

        signature.addEventListener(`mouseup`, (event) => {
            checkSignature();
        });
        signature.addEventListener(`touchend`, (event) => {
            checkSignature();
        });
        clear.addEventListener(`click`, (event) => {
            setTimeout(() => {
                checkSignature();
            }, "200");
        });
    });

    function checkSignature() {
        let isSigned = document.getElementById(`IsSigned`);
        let isSignedComplex = document.getElementById(`IsSignedComplex`);
        let signatureComplexity = $("#signature").jSignature('getData', 'base30')[1].length;
        let signatureIsSigned = signatureComplexity > 0 ? true : false;
        let signatureIsComplex = signatureComplexity > 75 ? true : false;

        if (signatureIsSigned === true) {
            isSigned.checked = true;
        }
        else {
            isSigned.checked = false;
        }

        if (signatureIsComplex === true) {
            isSignedComplex.checked = true;
        }
        else {
            isSignedComplex.checked = false;
        }
    }
</script>