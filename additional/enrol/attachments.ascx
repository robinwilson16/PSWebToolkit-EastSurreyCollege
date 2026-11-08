<%@ Control Language="VB" AutoEventWireup="false" CodeFile="attachments.ascx.vb" Inherits="attachments" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

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
                <a class="breadcrumb-link" href="webenrolment.aspx?page=~/additional/apply/employment.ascx"><i class="fa-solid fa-city"></i>&nbsp;Employment Status</a>
            </li>
            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
            <li class="breadcrumb-item" aria-current="page">
                <a class="breadcrumb-link active" href="webenrolment.aspx?page=~/additional/apply/attachments.ascx"><i class="fa-solid fa-paperclip"></i>&nbsp;Documents/Evidence</a>
            </li>
        </ol>
    </nav>
</div>

<div class="progress mt-5 mb-5" role="progressbar" aria-label="Progress..." aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar bg-primary" style="width: 70%">70%</div>
</div>

<div class="bd-callout mt-5 mb-5">
    <h4><i class="fa-solid fa-paperclip"></i> Documents/Evidence</h4>
     <p>
        <strong>Please use this page to upload evidence to support your enrolment.  You can take a picture using your phone as long as the image is clear.</strong>    
    </p>
    <p><strong>Failure to upload the required documents will delay or prevent your enrolment to the College.</strong></p>
    <ul runat="server" id="ulList">
        <li>You must upload 1 proof of identity such as a passport, birth certificate or driving licence</li>
        <li>Adults only – You must also upload proof of your address if you are being funded via West Yorkshire Combined Authority (WYCA) or York and North Yorkshire Combined Authority (YNYCA) – this could be a Utility Bill, Bank Statement, Driving Licence, Phone Contract, Universal Credit Statement or Council Tax Bill</li>
        <li>You must upload copies of certificates for any qualifications you have already achieved. If you are awaiting your results, you do not need to upload them here.</li>
  
    </ul>

    <p><strong>The maximum file size is up to 5 MB per file, the supported file formats allowed are jpg, png, jpeg, heic)</strong>
            </p>

    <div class="row">
        <div class="col mb-4">
            <div class="card w-100">
                <div class="card-body">
                    <div class="row">
                        <div class="form-group md:col-6 xl:col-3 mb-2">
                            <label for="ddlTypeOfEvidence">Type of Evidence</label>
                            <asp:DropDownList ID="ddlTypeOfEvidence" runat="server" CSSClass="form-control">
                                <asp:ListItem Text="Select" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group md:col-6 xl:col-4 mb-2">
                            <label for="txtNotes">Notes</label>
                            <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group md:col-6 xl:col-3 mb-2">
                            <label for="fuAttachment" class="">File</label>
                            <cc1:CCCFileUpload ID="fuAttachment" runat="server" data-html="true"  ClientIDMode="static"  IsRequired="true" SupportedFileTypes=".jpg, .jpeg, .png, .gif, .bmp, .heic, .pdf, .doc, .docx" accept=".jpg,.jpeg,.png,.gif,.bmp,.heic,.pdf,.doc,.docx" MaxAllowedFileSize="5000" MaxAllowedFileSizeErrorMessage="File size is larger than 5 MB" CSSClass="form-control pt-2 pb-3" />
                        </div>
                        <div class="form-group md:col-6 xl:col-2 text-end mt-auto mb-2">
                            <asp:LinkButton ID="btnUpload" runat="server" CssClass="btn-solid btn-styled theme-primary" CausesValidation="False"><i class="fa-solid fa-file-import"></i> Upload</asp:LinkButton>
                        </div>
                        <asp:CustomValidator ID="ddlTypeOfEvidenceValidator" runat="server"></asp:CustomValidator>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:CustomValidator ID="btnUploadValidator" runat="server"></asp:CustomValidator>

    <hr />

 <div class="panel panel-success"  runat="server" id="divMain">

    <!--
        Following properties are there to use in the File Upload control
        - IsRequired (To set control mandatory)
        - RequiredErrorMessage (A message to display when user is not uploading file)
        - MaxAllowedFileSize (Maximum size allowed for a file upload in KB). Use this to override value set in System Setting of same name.
        - MaxAllowedFileSizeErrorMessage  (A message to display when user has uploaded larger file than allowed)
        - SupportedFileTypes (File Types supported by the control (.jpg, .png, .xlsx)). Use this to override value set in System Setting of same name.
        - SupportedFileTypesErrorMessage (A message to display when user has uploaded file of type which is not valid)
        - HideUserInfoOnTooltip (To prevent showing of information related to file upload requirements)
        - UserInfo (User Information related to file upload requirements - if need to display at any specific location manually)
        -->
    
     <%If rptAttachments.Items.Count = 0 %>
        <div runat="server" visible="<%#rptAttachments.Items.Count = 0 %>">
            <div class="alert theme-warning hstack gap-3" role="alert">
                <div>
                    <i class="fa-solid fa-file-import"></i>
                </div>
                <div>
                    No files uploaded yet
                </div>
            </div>
        </div>
    <%End If %>
    <asp:Repeater ID="rptAttachments" runat="server" OnItemCommand="rptAttachments_ItemCommand">
        <ItemTemplate>
            <div class="row">
                <div class="md:col-12 mb-4 d-flex align-items-stretch">
                    <div class="card w-100">
                        <div class="card-body d-flex flex-column">
                            <div class="row">
                                <div class="form-group md:col-6 xl:col-3">
                                    <p><strong>Type of Evidence</strong></p>
                                    <p><%# Eval("TypeOfEvidence") %></p>
                                </div>
                                <div class="form-group md:col-6 xl:col-5 pt-2">
                                    <p><strong>Notes</strong></p>
                                    <asp:PlaceHolder runat="server" Visible='<%#displayNotesIcon(DataBinder.Eval(Container.DataItem, "Notes").ToString) %>'>
                                        <p><i class="fa-solid fa-note-sticky"></i> <%# Eval("Notes") %></p>
                                    </asp:PlaceHolder>
                                </div>
                                <div class="form-group md:col-6 xl:col-3 pt-2">
                                    <p><strong>Attachment</strong></p>
                                    <p><i class="fa-solid fa-file-lines"></i> <%# Eval("FileName") %></p>
                                </div>
                                <div class="form-group md:col-12 xl:col-1 text-end">
                                    <p><strong>Remove</strong></p>
                                    <asp:Button ID="btnRemove" runat="server" Text="X" CssClass="btn-solid btn-styled theme-danger" CommandName="RemoveAttachment" CommandArgument='<%# Eval("AttachmentID") %>' OnClientClick="return confirmDeletion()" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
     <asp:CustomValidator ID="AttachmentsValidatorType" runat="server"></asp:CustomValidator>
     <asp:CustomValidator ID="AttachmentsValidatorFiles" runat="server"></asp:CustomValidator>

     <asp:HiddenField runat="server" ID="hiddenvalidator" Visible="true"/>
         <p class="mt-5"><strong>Not Able To Upload Your File/s</strong></p>
    <div class=" form-group">
        <cc1:StudentEnrolmentField runat="server" ID="StudentDetailUserDefined25" CustomFieldType="Lookup" StudentEnrolmentFieldType="StudentDetailUserDefined25" ClientIDMode="Static" CustomCaption="Can't upload your file/s at the moment - please select a reason why"  />
    </div>

    <div id="UploadWarning" class="alert theme-warning hstack gap-3 d-none" role="alert">
        <div>
            <i class="fa-solid fa-triangle-exclamation"></i>
        </div>
        <div>
            <p>
                You must provide the required documents/evidence as soon as possible after completing this form. 
            </p>
            <p>
                You cannot be fully enrolled without this evidence. You can:
            </p>
            <ul>
                <li>
                    Email a photograph of your ID and Certificates to <a href="mailto:xxx@osc.ac.uk?subject=Cannot Upload Evidence">xxx@osc.ac.uk</a>. Please include your <strong>full name</strong> in the subject line.
                </li>
                <li>
                    Bring your ID and Certificates to college in person <strong>before</strong> the start date of your course and we can take a copy.
                </li>
            </ul>
        </div>
    </div>
</div>
</div>

<asp:ValidationSummary ID="vsAttachments" runat="server" CssClass="alert theme-danger" />
 
<%--<cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" LinkResource="checkout_employment_FE_aspx"  />
<cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button"  LinkResource="checkout_photo_FE_aspx" CausesValidation="true" />--%>

<div class="alert theme-inverse" role="alert">
    <div class="container">
        <div class="row">
            <div class="col">
                <button type="button" class="btn-solid btn-styled theme-secondary btn-lg BackButton"><i class="fa-solid fa-angles-left"></i> Back</button>
                <cc1:CCCButton ID="btnBack" LinkResource="apply_employment" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
            </div>
            <div class="col text-end">
                <span class="d-grid gap-2 md:d-block">
                    <button type="button" class="btn-solid btn-styled theme-primary btn-lg NextButton">Next <i class="fa-solid fa-angles-right"></i></button>
                    <cc1:CCCButton ID="btnContinue" LinkResource="apply_photo" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" SaveForLater="true" SaveForLaterIn="Request" />
                </span>
            </div>
        </div>
    </div>
</div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $("#btnChooseFile").click(function () {
        $('#fuAttachment').click();
    });
    function confirmDeletion() {
        var result = confirm("Are you sure you want to delete this attachment? Press OK to continue deletion.");
        if (result) {
            return true;
        }
        return false;
    }

    $(function () {
        $('.example-popover').popover({
            container: 'body'
        })
    })
</script>

<asp:TextBox runat="server" ID="FileChosen" ClientIDMode="Static" Value="N" class="d-none" />

<script>
    let fuAttachment = document.getElementById("fuAttachment");
    let fileChosen = document.getElementById("FileChosen");

    fuAttachment.addEventListener('change', function (event) {
        fileChosen.value = "Y";
    });

    //Show message about providing required evidence
    let cannotUpload = document.getElementById("cboStudentDetailUserDefined25");
    let uploadWarning = document.getElementById("UploadWarning");
    cannotUpload.addEventListener('change', function (event) {
        if (cannotUpload.value == "Fail" || cannotUpload.value == "NoInfo") {
            uploadWarning.classList.remove("d-none");
        }
        else {
            uploadWarning.classList.add("d-none");
        }
    });

</script>