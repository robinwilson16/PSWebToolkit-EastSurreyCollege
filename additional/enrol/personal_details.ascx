<%@ Control Language="VB" AutoEventWireup="false"  CodeFile="personal_details.ascx.vb" Inherits="personal_details" %>

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
 --> <cc1:CourseEnrolAction ID="CourseEnrolAction" runat="server" Visible="false"/>
   
   <cc1:OfferingFeesDisplayAll runat="server" Visible="false" />

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
                <a class="breadcrumb-link active" href="webenrolment.aspx?page=~/additional/apply/personal_details.ascx"><i class="fa-solid fa-user"></i>&nbsp;Personal Details</a>
            </li>
        </ol>
    </nav>
</div>

<div class="progress mt-5 mb-5" role="progressbar" aria-label="Progress..." aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar bg-primary" style="width: 20%">20%</div>
</div>

<div class="bd-callout mt-5 mb-5">
    <h4><i class="fa-solid fa-user"></i> Personal Details</h4>

    <div class="row">
        <div class="sm:col-12 columns form-group mb-3"> 
            <p>Please note all fields marked with <span class="textfieldlabelrequired"></span> are required.</p>
        </div>
    </div>

     <div class="row">
        <div class="sm:col-12 columns form-group"> 
              <div class="callout callout-info">Please give your full legal name. The Department for Education (DfE) requires the College to collect legal gender.</div>
        </div>
    </div>

    <div class="row">
        <div class="sm:col-6 columns form-group"> 
            <cc1:StudentEnrolmentField AutoFocus="true" StudentEnrolmentFieldType="Title" ID="fldTitle" runat="server" IsRequired="true" CustomCaption="Title" ClientIDMode="Static" />
            <asp:CustomValidator ID="fldTitleValidator" runat="server"></asp:CustomValidator>
        </div>
        <div class="sm:col-6 columns form-group">     
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="fldFirstForename" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Forename or Given Name" />
            <asp:CustomValidator ID="fldFirstForenameValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>

    <div class="row" id="divRefno" runat="server" visible="false">
        <div class="sm:col-12 columns form-group"> 
            <h4>If you have already applied to the College or studied at the College as a student, your ID is <strong><asp:Label ID="lblRefno" runat="server"></asp:Label></strong> </h4>
        </div>
    </div>
    <div class="row">
        <div class="sm:col-6 columns form-group">     
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="OtherForenames" ID="fldOtherForenames" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Other Forenames (Middle Names)" />
        </div>
        <div class="sm:col-6 columns form-group">       
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Surname or Family Name" />
        </div>
    </div>
    <div class="row">
        <div class="sm:col-6 columns form-group">            
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="KnownAs" ID="fldKnownAs" runat="server" IsRequired="false" LabelWidth="300"  CustomCaption="Preferred Name" Placeholder="Billy instead of William, Jess instead of Jessica, etc." />
        
            <div class="alert alert-primary hstack gap-3" role="alert">
                <div>
                    <i class="fa-solid fa-circle-info"></i>
                </div>
                <div>
                    <p>
                        This is a name you prefer to be called instead of your legal forename. This name will be printed on your student ID card. If you do not have a preferred name, leave this field blank.
                    </p>
                </div>
            </div>
        </div>
        <div class="sm:col-6 columns form-group">  
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="SurnameAtBirth" ID="fldSurnameAtBirth" runat="server" IsRequired="false"  LabelWidth="300" CustomCaption="Previous Surname or Family Name (if changed)" />   
        </div>
    </div>

<div class="row align-items-end">
    <div class="sm:col-6 columns form-group"> 
        <cc1:StudentEnrolmentField ID="fldDateOfBirth" runat="server" IsRequired="true" StudentEnrolmentFieldType="DateOfBirth" LabelWidth="200" ClientIDMode="Static" Placeholder="dd/mm/yyyy" HTML5InputType="date" AutoPostBack="true" />
        <asp:CustomValidator ID="fldDateOfBirthValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class="sm:col-6 columns form-group"> 
        <div class="alert alert-secondary" role="alert" id="AgeInfo">
        &nbsp;
        </div>
        <asp:Textbox runat="server" ID="Age31stAug" Placeholder="Age31stAug" type="number" ClientIDMode="Static" class="d-none" />
    </div>
</div>
<div class="row">
      <div class="sm:col-6 columns form-group">            
                 <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Sex" ID="fldGender" runat="server" LabelWidth="300" CustomCaption="Legal Gender" IsRequired="true" ClientIDMode="Static" />
            <asp:CustomValidator ID="fldGenderValidator" runat="server"></asp:CustomValidator>
          </div>
      <div class="sm:col-6 columns form-group">            
                 <cc1:StudentEnrolmentField StudentEnrolmentFieldType="PreferredPronounID" ID="fldPronoun" runat="server" CustomCaption="Preferred Pronoun" IsRequired="true" ClientIDMode="Static" />
          </div>
   </div>

</div>

<div class="bd-callout mt-5 mb-5">
    <h4><i class="fa-solid fa-magnifying-glass"></i> Monitoring and Support</h4>

    <p>For equality of opportunity monitoring we would appreciate your answers to the following questions.</p>

        <div class="row">
       <div class="sm:col-12 columns form-group"> 
            <%--<cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined6" ID="StudentEnrolmentField15" CustomFieldType="Lookup" runat="server"  IsRequired="false"  LabelWidth="450" CustomCaption="Which of the following options best describes your sexual orientation?" /> <%-- Was UDF6 --%>
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="SexualOrientationCode" ID="SexualOrientationCode" runat="server"  IsRequired="false"  LabelWidth="450" CustomCaption="Which of the following options best describes your sexual orientation?" ClientIDMode="Static" /> <%-- Was UDF6 --%>
           </div>
       <div class="sm:col-12 columns form-group"> 
            <%--<cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined7" ID="StudentEnrolmentField16" CustomFieldType="Lookup" runat="server"  IsRequired="false"  LabelWidth="350" CustomCaption="What Gender do you identify as?" /> <%-- Was UDF7 --%>
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="GenderType" ID="GenderType" runat="server"  IsRequired="false" ExcludedIDValues="99" LabelWidth="350" CustomCaption="What Gender do you identify as?" ClientIDMode="Static" /> <%-- Was UDF7 --%>
           </div>
<%--       <div class="sm:col-12 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined8" ID="StudentEnrolmentField17" CustomFieldType="Lookup" runat="server"  IsRequired="false"  LabelWidth="450" CustomCaption="Do you identify as the same gender as registered at birth?" />
           </div>--%>
    </div>
</div>

<div class="bd-callout mt-5 mb-5">
    <h4><i class="fa-solid fa-hashtag"></i> National Insurance</h4>

    <div class="row">
        <div class="sm:col-12 columns form-group">            
            <%--<cc1:StudentEnrolmentField StudentEnrolmentFieldType="NI" ID="fldNI" runat="server"  IsRequired="false" LabelWidth="400" CustomCaption="National Insurance (NI) Number" title="The format of the number is two prefix letters, six digits and one suffix letter. Use UPPER CASE for letters.  An example is AB123456C. Neither of the first two letters can be D, F, I, Q, U or V. The second letter also cannot be O. The prefixes BG, GB, NK, KN, TN, NT and ZZ are not allowed" Pattern="^(?!BG)(?!GB)(?!NK)(?!KN)(?!TN)(?!NT)(?!ZZ)(?:[A-CEGHJ-PR-TW-Z][A-CEGHJ-NPR-TW-Z])(?:\s*\d\s*){6}([A-D]|\s)$" />--%>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NI" ID="fldNI" runat="server"  IsRequired="false" LabelWidth="400" CustomCaption="National Insurance (NI) Number" title="The format of the number is two prefix letters, six digits and one suffix letter. Use UPPER CASE for letters.  An example is AB123456C. Neither of the first two letters can be D, F, I, Q, U or V. The second letter also cannot be O. The prefixes BG, GB, NK, KN, TN, NT and ZZ are not allowed" />
            <asp:CustomValidator ID="fldNIValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>
</div>

<div class="bd-callout mt-5 mb-5">
    <h4><i class="fa-solid fa-scale-balanced"></i> Criminal Convictions</h4>

        <p>We must ask you to provide details of any <strong>unspent</strong> criminal convictions. You do not need to tell us about any spent convictions, as defined by the Rehabilitation of Offenders Act 1974, unless your course involves access to children and young adults under the age of 18. If you are enrolled to such a course, any failure to disclose such convictions may result in the College asking you to withdraw. Any information you give will be completely confidential and is only considered in relation to this enrolment.</p>
        
<%--        <span class="textfieldlabelrequired">Do you have any unspent criminal convictions?</span>
        <asp:DropDownList runat="server" ID="rdoCC" CssClass="form-group">
            <asp:ListItem Text="--please select--" Value=""></asp:ListItem>
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="2"></asp:ListItem>
       
        </asp:DropDownList>--%>

      <div class="row">
            <div class="sm:col-12 columns form-group"> 
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CriminalConvictionID" ID="fldCriminalConvictionID" runat="server" IsRequired="true" LabelWidth="400"   CustomCaption="Do you have any unspent criminal convictions?" />
                <asp:CustomValidator ID="fldCriminalConvictionIDValidator" runat="server"></asp:CustomValidator>
        </div>
        
      </div>
    <p>If ‘Yes’, this will be referred to the College Admissions Panel.</p>

<%--      <div class="row">
            <div class="sm:col-12 columns form-group"> 
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined60" ID="txtYesCriminalConviction" runat="server" IsRequired="false" CustomCaption="If yes, you are required to give full details. This will be referred to the College Admissions Panel." LabelWidth="650"/>
        </div>
      </div>--%>

    <%If IsUnder18 = True Then %>
        <div class="row">
            <div class="sm:col-12 columns form-group"> 
                <span class="textfieldlabelrequired">Are you known to the youth justice service?</span>
                <p>Are you receiving support or involvement from the Youth Justice Service due to offending behaviour or related concerns</p>
                <asp:RadioButtonList runat="server" ID="fldKnownToYouthJustice" CssClass="form-input TableInline">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:CustomValidator ID="fldKnownToYouthJusticeValidator" runat="server"></asp:CustomValidator>
            </div>
        </div>
        <%End If %>

        <%If IsUnder19 = True Then %>
        <div class="row">
            <div class="sm:col-12 columns form-group"> 
                <span class="textfieldlabelrequired">Do you have a parent or carer in prison?</span>
                <p>Do you have a parent, guardian, or main carer who is currently serving a prison sentence</p>
                <asp:RadioButtonList runat="server" ID="fldParentCarerInPrison" CssClass="form-input TableInline">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:CustomValidator ID="fldParentCarerInPrisonValidator" runat="server"></asp:CustomValidator>
            </div>
        </div>
        <%End If %>

</div>

<div class="bd-callout mt-5 mb-5">
    <h4><i class="fa-solid fa-address-book"></i> Address Details</h4>


<%--    <div class="row">
      <div class="sm:col-6 columns form-group"><p>Quickly find your address, enter postcode or partial address below:</p>
<p><asp:TextBox ID="txtLookup" runat="server" CssClass="formtext" ></asp:TextBox>
<asp:Button ID="btnFind" runat="server" Text="Find" CausesValidation="False" /></p>
          <div id="divlstResult" runat="server" visible="true"><asp:ListBox ID="lstresult" runat="server"  AutoPostBack="True" Width="400"></asp:ListBox></div>
          </div>
        </div>--%>

        <p><strong>Home/Permanent address</strong></p>

<div id="divAddresslines" runat="server" visible="true">
    <div class="row">
        <div class="sm:col-6 columns form-group"> 
            <cc1:StudentEnrolmentField runat="server" ID="fldAddress1" StudentEnrolmentFieldType="Address1" IsRequired="true" ClientIDMode="Static" CustomCaption="First Line of Address" Placeholder="Start typing your address here..." />
        </div>
        <div class="sm:col-6 columns form-group"> 
            <cc1:StudentEnrolmentField runat="server" ID="fldAddress2" StudentEnrolmentFieldType="Address2" ClientIDMode="Static" CustomCaption="Second Line of Address" />
        </div>
    </div>
  
    <div class="row">
        <div class="sm:col-6 columns form-group"> 
            <cc1:StudentEnrolmentField runat="server" ID="fldAddress3" StudentEnrolmentFieldType="Address3" IsRequired="true" ClientIDMode="Static" CustomCaption="Town" />
        </div>
        <div class="sm:col-6 columns form-group"> 
            <cc1:StudentEnrolmentField runat="server" ID="fldAddress4" StudentEnrolmentFieldType="Address4" IsRequired="true" ClientIDMode="Static" CustomCaption="County" />
        </div>
    </div>
    <div class="row">
        <div class="sm:col-6 columns form-group">
            <label for="postcode" class="textfieldlabelrequired">Postcode</label>
            <input runat="server" type="text" id="postcode" class="form-control" name="pre[postalcode]" placeholder="" autocomplete="off" pattern="^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$" title="Please enter a valid Postcode" ClientIDMode="Static" />
            <%--pattern="^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$" Title="Please enter a valid Postcode"--%>    
            <asp:CustomValidator ID="postcodeValidator" runat="server"></asp:CustomValidator>
        </div>
        <div class="sm:col-6 columns form-group"> 
            <cc1:StudentEnrolmentField runat="server" ID="fldNumberOfYearsAtCurrentAddress" StudentEnrolmentFieldType="NumberOfYearsAtCurrentAddress" IsRequired="true" ClientIDMode="Static" HTML5InputType="number" />
        </div>
    </div>
</div>
    <div class="alert alert-secondary" role="alert" id="DevolvedPostCodeAreaInfo">
        &nbsp;
    </div>
</div>

<div class="bd-callout bd-callout-warning bd-callout-fees d-none" id="DevolvedFeesInfo">
    <h4><i class="fa-solid fa-landmark"></i> Funding Details</h4>
    <p>
        Please note, over 19s are usually liable for course fees. As you live in the <span id="DevolvedAreaName">[DEVOLVED AREA]</span> devolved area <strong>your course fees will be higher</strong>. 
    </p>
    <p>
        Orbital South Colleges receive government funding which allows us to offer courses at a lower cost. The guidelines relating to devolution means that we cannot apply this funding to learners who live in devolved areas. 
    </p>
    <p>
        Before committing to a course with Orbital South Colleges, we would recommend that you explore options to study the course in your local area. If the course you have chosen is not available in your local area, it may be worth checking with your devolved education team to see if they will fund your course with Orbital South Colleges.
    </p>
    <p>
        If you would prefer to continue your application with Orbital South Colleges please note that the price of the course <strong>could be doubled the advertised cost</strong>. Definitive fees can only be confirmed at point of enrolment (usually in September).
    </p>
    <p>
        You may be able to find support for these fees based on your personal circumstances. Please confirm you acknowledge this.
    </p>
    <div class=" form-group">
        <asp:Checkbox runat="server" ID="ConfirmNoFundingAvailable" Text="I confirm my acknowledgement" ClientIDMode="Static" />
        <asp:CustomValidator ID="ConfirmNoFundingAvailableValidator" runat="server"></asp:CustomValidator>
        <asp:Textbox runat="server" ID="ExpectedSourceOfFundingID" Placeholder="ExpectedSourceOfFundingID" type="number" ClientIDMode="Static" class="d-none" />
        <asp:Textbox runat="server" ID="ExpectedSourceOfFundingName" Placeholder="ExpectedSourceOfFundingName" ClientIDMode="Static" class="d-none" />
        <asp:Checkbox runat="server" ID="DevolutionAreaIsFunded" Text="DevolutionAreaIsFunded" ClientIDMode="Static" class="d-none" />
    </div>
</div>

<div class="bd-callout mt-5 mb-5">
    <h4><i class="fa-solid fa-comment"></i> Contact Details</h4>

    <div class="row">
        <div class="sm:col-12 columns form-group">
            <p><strong>You must provide at least one phone number below:</strong></p>
        </div>
    </div>
    <div class="row">
        <div class="sm:col-6 columns form-group"> 
            <span class="textfieldlabelrequired">Personal Mobile</span>
            <%--<cc1:StudentEnrolmentField CustomCaption="Personal Mobile" LabelWidth="0" StudentEnrolmentFieldType="MobileTel" ID="fldMobileTel" runat="server" Placeholder="Mobile numbers beginning 07" title="The format of the mobile must be beginning 07, with no spaces and 11 digits in length eg 07771900900" Pattern="^(07[\d]{8,12}|447[\d]{7,11})$ "/>--%>
            <cc1:StudentEnrolmentField CustomCaption="Personal Mobile" LabelWidth="0" StudentEnrolmentFieldType="MobileTel" ID="fldMobileTel" runat="server" Placeholder="Mobile numbers beginning 07" title="The format of the mobile must be beginning 07, with no spaces and 11 digits in length eg 07771900900" />
        </div>
        <div class="sm:col-6 columns form-group"> 
            <span class="textfieldlabelrequired">Home Phone (inc. STD code)</span>
            <%--<cc1:StudentEnrolmentField CustomCaption="Home Phone (inc. STD code)" LabelWidth="0" StudentEnrolmentFieldType="Tel" ID="fldTel" runat="server" title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900" Pattern="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$ "/>--%>
            <cc1:StudentEnrolmentField CustomCaption="Home Phone (inc. STD code)" LabelWidth="0" StudentEnrolmentFieldType="Tel" ID="fldTel" runat="server" title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900" />
        </div>
        <div class="sm:col-12 columns form-group">
            <asp:CustomValidator ID="fldMobileTelValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>

    <div class="row">
        <div class="sm:col-12 columns form-group"> 
              <cc1:StudentEmailField StudentEnrolmentFieldType="Email" HTML5InputType="email" ID="fldEmail" runat="server" IsRequired="true"  CustomCaption="Personal Email"  />
        </div>
    </div>

    <div class="row">
        <div class="sm:col-12 columns form-group"> 
            <span class="textfieldlabelrequired">Will you be living in College accommodation?</span>
            <asp:RadioButtonList runat="server" ID="ddCollegeAccomodation" CssClass="form-input TableInline" AutoPostBack="true">
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
            <asp:CustomValidator ID="ddCollegeAccomodationValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>

    <%If ddCollegeAccomodation.SelectedValue <> "1" Then %>
    <div class="row">
        <div class="sm:col-12 columns form-group"> 
            <span class="textfieldlabelrequired">Is your term time address different to your home address?</span>
            <asp:RadioButtonList runat="server" ID="RadioButtonListAlt" CssClass="form-input TableInline">
                <asp:ListItem Text="No, it is the same" Value="2"></asp:ListItem>
                <asp:ListItem Text="Yes, it is different" Value="1"></asp:ListItem>
            </asp:RadioButtonList>
            <asp:CustomValidator ID="RadioButtonListAltValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>

    <div class="altaddress">
    <br />
        <h5>Term Time Address</h5>


        <p>Term Time address (if different from Home/Permanent address)</p>

  <div class="row">
      <div class="sm:col-6 columns form-group">
            <cc1:StudentEnrolmentField runat="server" ID="AltAddress1" StudentEnrolmentFieldType="AltAddress1" IsRequired="false" ClientIDMode="Static" CustomCaption="First Line of Address" Placeholder="Start typing your address here..." />
            <asp:CustomValidator ID="AltAddress1Validator" runat="server"></asp:CustomValidator>
        </div>
      <div class="sm:col-6 columns form-group">
            <cc1:StudentEnrolmentField runat="server" ID="AltAddress2" StudentEnrolmentFieldType="AltAddress2" ClientIDMode="Static" CustomCaption="Second Line of Address" />
        </div>
   </div>

  <div class="row">
      <div class="sm:col-6 columns form-group">
            <cc1:StudentEnrolmentField runat="server" ID="AltAddress3" StudentEnrolmentFieldType="AltAddress3" IsRequired="false" ClientIDMode="Static" CustomCaption="Town" />
        </div>
      <div class="sm:col-6 columns form-group">
            <cc1:StudentEnrolmentField runat="server" ID="AltAddress4" StudentEnrolmentFieldType="AltAddress4" IsRequired="false" ClientIDMode="Static" CustomCaption="County" />
        </div>
   </div>

    <div class="row">
         <div class="sm:col-12 columns form-group">
            <span class="textfieldlabelrequired1">Postcode</span>
            <input type="text" runat="server" id="AltPostcode" title="Postcode" maxlength="9" Pattern="^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\ [0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$" ClientIDMode="Static" />
            <asp:CustomValidator ID="AltPostcodeValidator" runat="server"></asp:CustomValidator>
        </div>

         <div class="sm:col-12 columns form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="AltTel1" ID="AltTel1" runat="server" CustomCaption="Term phone (inc. STD code)" IsRequired="false" LabelWidth="400" Pattern="^(0[\d]{8,12}|447[\d]{7,11})$" title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900" ClientIDMode="Static" />
        </div>
    </div>

    <br />
    
 </div>
    <%End If %>
</div>


      <!--  <cc1:CCCButton id="btnBack2" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_aspx"/> -->
<%--        <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button"  LinkResource="courseenrolFE_aspx" />

 <cc1:CCCButton  runat="server" Text="Continue" CausesValidation="true" CssClass="button" ID="btnContinue" />--%>

<asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert theme-danger" ForeColor="" />

<div class="alert theme-inverse" role="alert">
    <div class="container">
        <div class="row">
            <div class="col">
                <button type="button" class="btn-solid btn-styled theme-secondary btn-lg BackButton"><i class="fa-solid fa-angles-left"></i> Back</button>
                <cc1:CCCButton ID="btnBack" LinkResource="apply_courseapply" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
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

<asp:Label ID="Test" runat="server" />
        </div>
    </div>
</div>


<script>

    $(document).ready(function () {

        $('.altaddress').hide();

        // Hide or Show Learning Difficulty 
        var rdo = document.getElementsByName("<%= RadioButtonListAlt.UniqueID%>")
        if (rdo[0].checked) {
            $(".altaddress").hide();
        }
        else if (rdo[1].checked) {
            $(".altaddress").show();
        }
        else {
            $(".altaddress").hide();
        }

        // Set Learning Difficulty Fields visibility when Learning Difficulty 'Yes' radio button is clicked
        var rdo1 = document.getElementById("<%= RadioButtonListAlt.ClientID%>")
    rdo1.onchange = function () {
            var rdo = document.getElementsByName("<%= RadioButtonListAlt.UniqueID%>")
            if (rdo[0].checked) {
                $(".altaddress").slideUp();
                clearAltAddress();
            }
            else if (rdo[1].checked) {
                $(".altaddress").slideDown();
            }
            else {
                $(".altaddress").slideUp();
                clearAltAddress();
            }


        };
    });

    function clearAltAddress() {
        let altAddress1 = document.getElementById(`txtAltAddress1`);
        let altAddress2 = document.getElementById(`txtAltAddress2`);
        let altAddress3 = document.getElementById(`txtAltAddress3`);
        let altAddress4 = document.getElementById(`txtAltAddress4`);
        let altPostcode = document.getElementById(`AltPostcode`);
        let altTel1 = document.getElementById(`txtAltTel1`);

        altAddress1.value = ``;
        altAddress2.value = ``;
        altAddress3.value = ``;
        altAddress4.value = ``;
        altPostcode.value = ``;
        altTel1.value = ``;
    }

</script>

<script>
    document.addEventListener("DOMContentLoaded", (event) => {
        
        //Provide better descriptions for Sex fields
        let fldSex = document.getElementById("cboSex");
        fldSex.options[1].textContent = "Female";
        fldSex.options[2].textContent = "Male";

        //Re-order fields so most common values are moved to the top
        let titleDropdown = document.getElementById(`cboTitle`);
        sortSelectMoveToTop(titleDropdown, "Ms");
        sortSelectMoveToTop(titleDropdown, "Miss");
        sortSelectMoveToTop(titleDropdown, "Mrs");
        sortSelectMoveToTop(titleDropdown, "Mr");
        sortSelectMoveToTop(titleDropdown, "");

        //Calculate age and show under input box
        let dob = document.getElementById(`txtDateOfBirth`);
        let postcode = document.getElementById(`postcode`);
        let postCodeKeyup = new Event('keyup');
        
        if (dob.value !== null) {
            //If DOB already has a value then attempt to show age from DOB
            //alert(`|` + dob.value + `|`);
            showAge();
        }
        dob.addEventListener(`keyup`, function (event) {
            showAge();
            postcode.dispatchEvent(postCodeKeyup);
        });

        function showAge() {
            
            let today = new Date();
            let date31stAug = new Date(today.getFullYear() + `-08-31`);
            let dateOfBirth = new Date(dob.value);
            let age31stAug = calculateAge(dateOfBirth, date31stAug);
            let AgeInfo = document.getElementById(`AgeInfo`);
            let AgeField = document.getElementById(`Age31stAug`);
            
            if (isNaN(dateOfBirth) || (dateOfBirth === ` `)) {
                AgeInfo.innerHTML = `&nbsp;`;
                AgeField.value = ``;
            }
            else {
                AgeInfo.innerHTML = `<i class="fa-solid fa-calendar-day"></i> Age on ${date31stAug.getDate()}${nth(date31stAug.getDate())} ${date31stAug.toLocaleString(`default`, { month: `long` })} ${date31stAug.getFullYear()}: <kbd>${age31stAug}</kbd>`;
                AgeField.value = age31stAug;
            }
        }

        //Put most common promouns first - uses custom JS function
        let pronounDropdown = document.getElementById(`cboPreferredPronounID`);
        sortSelectMoveToTop(pronounDropdown, "T");
        sortSelectMoveToTop(pronounDropdown, "U");
        sortSelectMoveToTop(pronounDropdown, "I");
        sortSelectMoveToTop(pronounDropdown, "S");
        sortSelectMoveToTop(pronounDropdown, "H");
        sortSelectMoveToTop(pronounDropdown, "");

        let fldTitleInputBox = addSearchableDropDown(cboTitle);
        let fldSexInputBox = addSearchableDropDown(cboSex);
        let fldPreferredPronounIDInputBox = addSearchableDropDown(cboPreferredPronounID);
        let fldSexualOrientationCodeInputBox = addSearchableDropDown(cboSexualOrientationCode);
        let fldGenderTypeInputBox = addSearchableDropDown(cboGenderType);

        //Add better label for Email Confirmation
        let emailConfirm = document.getElementById(`ctl00_MainContentPlaceholder_ctl00_fldEmail`);
        let emailConfirmLabel = emailConfirm.querySelector('div:last-of-type').firstElementChild;

        if (emailConfirmLabel != null) {
            emailConfirmLabel.innerHTML = `Confirm Personal Email`;
        }

        // Get Address IO - Main Address
        document.addEventListener("getaddress-autocomplete-suggestions", function (e) {
            console.log(e.suggestions);
        });

        document.addEventListener("getaddress-autocomplete-suggestions-failed", function (e) {
            console.log(e.status);
            console.log(e.message);
        });

        document.addEventListener("getaddress-autocomplete-address-selected", function (e) {
            console.log(e.address);

            //Check devolution area
            postcode.dispatchEvent(postCodeKeyup);
        });

        document.addEventListener("getaddress-autocomplete-address-selected-failed", function (e) {
            console.log(e.status);
            console.log(e.message);
        });

        getAddress.autocomplete(
            'txtAddress1',
            'jxO2lYlUvUO86UTwrjA57w42776',
            {
                output_fields: {
                    formatted_address_0: 'txtAddress1',  /* The id of the element bound to 'formatted_address[0]' */
                    town_or_city: 'txtAddress3',  /* The id of the element bound to 'town_or_city' */
                    county: 'txtAddress4',  /* The id of the element bound to 'county' */
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

        //Alt Address
        getAddress.autocomplete(
            'txtAltAddress1',
            'jxO2lYlUvUO86UTwrjA57w42776',
            {
                output_fields: {
                    formatted_address_0: 'txtAltAddress1',  /* The id of the element bound to 'formatted_address[0]' */
                    town_or_city: 'txtAltAddress3',  /* The id of the element bound to 'town_or_city' */
                    county: 'txtAltAddress4',  /* The id of the element bound to 'county' */
                    postcode: 'AltPostcode'  /* The id of the element bound to 'postcode' */
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

        postcode.addEventListener(`keyup`, function (event) {
            if (isPostCode(postcode.value) === true) {
                getFundingSourceinfo(postcode.value);
            }
        });

        //Check entry when page is loaded too
        postcode.dispatchEvent(postCodeKeyup);

        function isPostCode(postcode) {
            postcode = postcode.replace(/\s/g, "");
            const regex = /^[A-Z]{1,2}[0-9]{1,2}[A-Z]{0,1} ?[0-9][A-Z]{2}$/i;
            return regex.test(postcode);
        }

        async function getFundingSourceinfo(postcode) {
            await fetch(`https://api.osc.ac.uk/DevolvedAreaPostCode/${postcode}`, {
                method: `GET`,
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    'Origin': 'https://apply.osc.ac.uk/'
                }
            })
                .then(response => response.json())
                .then(response => showFundingSourceInfo(response));
        }

        function showFundingSourceInfo(devolvedPostCode) {
            console.log(JSON.stringify(devolvedPostCode));

            let DevolvedPostCodeAreaInfo = document.getElementById(`DevolvedPostCodeAreaInfo`);
            let fundingIsAvailable = true;
            let fundingMessage = null;

            let Age31stAug = document.getElementById(`Age31stAug`);
            let ExpectedSourceOfFundingID = document.getElementById(`ExpectedSourceOfFundingID`);
            let ExpectedSourceOfFundingName = document.getElementById(`ExpectedSourceOfFundingName`);
            let DevolutionAreaIsFunded = document.getElementById(`DevolutionAreaIsFunded`);
            let DevolvedFeesInfo = document.getElementById(`DevolvedFeesInfo`);
            let ConfirmNoFundingAvailable = document.getElementById(`ConfirmNoFundingAvailable`);

            if (Age31stAug.value < 19) {
                //If 16-18
                let fundSource1618 = `Department for Education (DfE) - 16-19`
                ExpectedSourceOfFundingID.value = 107;
                ExpectedSourceOfFundingName.value = fundSource1618;
                DevolvedAreaName.innerHTML = fundSource1618;

                fundingMessage = `<i class="fa-solid fa-circle-check"></i> Funding Available from ${fundSource1618}`;
                fundingIsAvailable = true
                DevolutionAreaIsFunded.checked = true;
                DevolvedFeesInfo.classList.add(`d-none`);
                ConfirmNoFundingAvailable.checked = false;

                //Reset in case DOB changed
                DevolvedPostCodeAreaInfo.classList.remove(`alert-secondary`);
                DevolvedPostCodeAreaInfo.classList.remove(`alert-danger`);
                DevolvedPostCodeAreaInfo.classList.add(`alert-success`);

                DevolvedFeesInfo.classList.add(`d-none`);
                ConfirmNoFundingAvailable.checked = false;
            }
            else {
                if (devolvedPostCode.status === 404) {
                    fundingMessage = `<i class="fa-solid fa-circle-check"></i> Cannot determine if funding is available. Please re-enter your post code above to check again`;
                    fundingIsAvailable = false;
                    DevolutionAreaIsFunded.checked = false;
                }
                else {
                    //Set hidden fields on page
                    ExpectedSourceOfFundingID.value = devolvedPostCode.fundingSourceCode;
                    ExpectedSourceOfFundingName.value = devolvedPostCode.fundingSourceName;
                    DevolvedAreaName.innerHTML = devolvedPostCode.fundingSourceName;

                    if (devolvedPostCode.isSOFOffered === true) {
                        fundingMessage = `<i class="fa-solid fa-circle-check"></i> Funding Available from ${devolvedPostCode.fundingSourceName}`;
                        fundingIsAvailable = true;
                        DevolutionAreaIsFunded.checked = true;
                    }
                    else {
                        fundingMessage = `<i class="fa-solid fa-circle-xmark"></i> No Funding Available from ${devolvedPostCode.fundingSourceName}`;
                        fundingIsAvailable = false;
                        DevolutionAreaIsFunded.checked = false;
                    }
                }

                if (fundingIsAvailable === true) {
                    DevolvedPostCodeAreaInfo.classList.remove(`alert-secondary`);
                    DevolvedPostCodeAreaInfo.classList.remove(`alert-danger`);
                    DevolvedPostCodeAreaInfo.classList.add(`alert-success`);

                    DevolvedFeesInfo.classList.add(`d-none`);
                    ConfirmNoFundingAvailable.checked = false;
                }
                else {
                    DevolvedPostCodeAreaInfo.classList.remove(`alert-secondary`);
                    DevolvedPostCodeAreaInfo.classList.remove(`alert-success`);
                    DevolvedPostCodeAreaInfo.classList.add(`alert-danger`);

                    DevolvedFeesInfo.classList.remove(`d-none`);
                }
            }

            DevolvedPostCodeAreaInfo.innerHTML = fundingMessage;
        }
    });
</script>
