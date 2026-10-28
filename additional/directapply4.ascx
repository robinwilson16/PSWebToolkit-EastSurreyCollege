<%@ Control Language="VB" AutoEventWireup="false" CodeFile="directapply4.ascx.vb" Inherits="directapply4" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit" TagPrefix="cc1" %>

<style>
    .application-form {
        width: 100%;
        margin: 0;
        padding: 56px;
        background: #ffffff;
        color: #000000;
        font-family: Montserrat, Helvetica, sans-serif;
    }

    .application-form * {
        box-sizing: border-box;
    }

    .application-form::before {
        content: "Online application";
        display: inline-block;
        margin-bottom: 16px;
        padding: 8px 14px;
        background: #43973D;
        color: #ffffff;
        font-size: 14px;
        font-weight: 700;
        letter-spacing: 0.02em;
        text-transform: uppercase;
    }

    .application-form__hero {
        margin-bottom: 36px;
        padding: 48px;
        background: #F3F1EE;
        border-left: 8px solid #43973D;
    }

    .application-form__hero h1 {
        margin: 0 0 14px 0;
        color: #000000;
        font-size: 44px;
        font-weight: 800;
        line-height: 1.12;
    }

    .application-form__hero p {
        max-width: 980px;
        margin: 0;
        color: #333333;
        font-size: 18px;
        line-height: 1.55;
    }

    .application-form__section {
        margin-bottom: 32px;
        padding: 32px;
        background: #ffffff;
        border: 1px solid #e3e3e3;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
    }

    .application-form__section h2 {
        margin: -32px -32px 28px -32px;
        padding: 22px 28px;
        background: #43973D;
        color: #ffffff;
        font-size: 24px;
        font-weight: 800;
        line-height: 1.25;
    }

    .application-form__section-description {
        margin: -8px 0 24px 0;
        color: #333333;
        font-size: 15px;
        line-height: 1.55;
    }

    .application-form__grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 22px 28px;
    }

    .application-form__field {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    .application-form__field--full {
        grid-column: 1 / -1;
    }

    .application-form__label,
    .application-form__field label {
        display: block;
        margin: 0;
        color: #000000;
        font-size: 14px;
        font-weight: 800;
        line-height: 1.4;
    }

    .application-form__label--required::after,
    .application-form__field label.required::after {
        content: " *";
        color: #b00020;
    }

    .application-form input[type="text"],
    .application-form input[type="email"],
    .application-form input[type="tel"],
    .application-form input[type="number"],
    .application-form input[type="date"],
    .application-form select,
    .application-form textarea,
    .application-form .form-control {
        min-height: 50px;
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #cfcfcf;
        border-radius: 0;
        background: #ffffff;
        color: #000000;
        font-family: Montserrat, Helvetica, sans-serif;
        font-size: 14px;
    }

    .application-form textarea {
        min-height: 120px;
        resize: vertical;
    }

    .application-form input:focus,
    .application-form select:focus,
    .application-form textarea:focus {
        outline: none;
        border-color: #43973D;
        box-shadow: 0 0 0 3px rgba(67, 151, 61, 0.18);
    }

    .application-form__notice {
        margin-bottom: 24px;
        padding: 18px 20px;
        background: #F3F1EE;
        border-left: 8px solid #FAA926;
    }

    .application-form__notice p {
        margin: 0;
        color: #000000;
        font-size: 15px;
        line-height: 1.5;
    }

    .application-form__course-list {
        display: grid;
        gap: 14px;
    }

    .application-form__course {
        padding: 18px 20px;
        background: #F3F1EE;
        border-left: 8px solid #43973D;
    }

    .application-form__course h3 {
        margin: 0 0 6px 0;
        color: #000000;
        font-size: 18px;
        font-weight: 800;
    }

    .application-form__course p {
        margin: 0;
        color: #333333;
        font-size: 14px;
    }

    .application-form__radio-list table,
    .application-form__radio-list tbody {
        display: block;
        width: auto;
        margin: 0;
    }

    .application-form__radio-list tr {
        display: flex;
        flex-wrap: wrap;
        gap: 12px 24px;
        align-items: center;
    }

    .application-form__radio-list td {
        display: inline-flex;
        align-items: center;
        width: auto;
        margin: 0;
        padding: 0;
    }

    .application-form__radio-list input[type="radio"] {
        flex: 0 0 auto;
        width: 20px;
        height: 20px;
        margin: 0 8px 0 0;
        accent-color: #43973D;
    }

    .application-form__radio-list label {
        display: inline-flex;
        align-items: center;
        margin: 0;
        font-weight: 700;
        line-height: 20px;
    }

    .application-form input[type="checkbox"] {
        width: 20px;
        height: 20px;
        margin: 0 8px 0 0;
        accent-color: #43973D;
    }

    .application-form__support-grid {
        align-items: stretch;
    }

    .application-form__support-card {
        min-height: 112px;
        padding: 18px;
        background: #F8F7F5;
        border: 1px solid #e3e3e3;
    }

    .application-form__support-card--full {
        grid-column: 1 / -1;
    }

    .application-form__support-card .application-form__label {
        margin-bottom: 4px;
    }

    .application-form__table-wrapper {
        width: 100%;
        overflow-x: auto;
    }

    .application-form__table {
        width: 100%;
        border-collapse: collapse;
    }

    .application-form__table th,
    .application-form__table td {
        padding: 14px;
        border: 1px solid #d8d8d8;
        vertical-align: middle;
        text-align: left;
    }

    .application-form__table th {
        background: #000000;
        color: #ffffff;
        font-weight: 800;
    }

    .application-form__table td {
        background: #ffffff;
    }

    .application-form__table input,
    .application-form__table select {
        min-width: 180px;
    }
.application-form__disability-table th:nth-child(2),
.application-form__disability-table td:nth-child(2),
.application-form__primary-cell {
    width: 96px;
    min-width: 96px;
    text-align: center;
    vertical-align: middle;
}

.application-form__primary-source {
    display: none !important;
}

.application-form__primary-display {
    appearance: none;
    -webkit-appearance: none;
    display: inline-grid;
    place-content: center;
    width: 24px !important;
    min-width: 24px !important;
    height: 24px !important;
    min-height: 24px !important;
    margin: 0 !important;
    padding: 0 !important;
    border: 2px solid #666666 !important;
    border-radius: 3px;
    background: #ffffff !important;
    cursor: pointer;
}

.application-form__primary-display::before {
    content: "";
    width: 12px;
    height: 12px;
    transform: scale(0);
    background: #43973D;
    transition: transform 120ms ease-in-out;
}

.application-form__primary-display:checked::before {
    transform: scale(1);
}

.application-form__primary-display:focus {
    outline: none;
    border-color: #43973D !important;
    box-shadow: 0 0 0 3px rgba(67, 151, 61, 0.22);
}

    .application-form__actions {
        display: flex;
        flex-wrap: wrap;
        gap: 16px;
        align-items: center;
        margin-top: 32px;
    }

    .application-form__button,
    .application-form .button,
    .application-form .btn,
    .application-form .btn-primary {
        min-height: 54px;
        padding: 0 34px;
        background: #43973D !important;
        border: 2px solid #43973D !important;
        border-radius: 0;
        color: #ffffff !important;
        font-family: Montserrat, Helvetica, sans-serif;
        font-size: 16px;
        font-weight: 800;
        cursor: pointer;
        text-decoration: none;
    }

    .application-form__button:hover,
    .application-form__button:focus,
    .application-form .button:hover,
    .application-form .button:focus,
    .application-form .btn:hover,
    .application-form .btn:focus,
    .application-form .btn-primary:hover,
    .application-form .btn-primary:focus {
        background: #000000 !important;
        border-color: #000000 !important;
        color: #ffffff !important;
    }

    .application-form__button--secondary {
        background: #000000 !important;
        border-color: #000000 !important;
    }

    .application-form__button--secondary:hover,
    .application-form__button--secondary:focus {
        background: #43973D !important;
        border-color: #43973D !important;
    }

    .application-form__button--compact {
        align-self: flex-start;
        min-height: 42px;
        width: auto;
        padding: 0 18px;
        font-size: 14px;
    }

    .application-form__academic-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 22px 28px;
    }

    .application-form__academic-gcse {
        display: contents;
    }

    .application-form__academic-gcse .application-form__grid {
        display: contents;
    }

    .application-form__gdpr-list {
        display: grid;
        gap: 14px;
    }

    .application-form__checkbox-line {
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 14px 16px;
        background: #F8F7F5;
        border: 1px solid #e3e3e3;
    }

    .application-form__declaration {
        display: flex;
        align-items: flex-start;
        gap: 12px;
        padding: 22px;
        background: #F3F1EE;
        border-left: 8px solid #43973D;
    }

    .application-form__declaration label {
        margin: 0;
        color: #000000;
        font-size: 15px;
        font-weight: 700;
        line-height: 1.55;
    }

    .application-form .alert-danger {
        margin-top: 24px;
        padding: 16px 20px;
        background: #fff4f4;
        border: 1px solid #d80000;
        border-left: 8px solid #d80000;
        border-radius: 0;
        color: #000000;
        font-size: 15px;
        font-weight: 700;
    }

    .application-form .alert-danger ul {
        margin-bottom: 0;
    }

    .application-form__hidden {
        display: none !important;
    }

    @media (max-width: 1024px) {
        .application-form {
            padding: 40px 28px;
        }

        .application-form__hero {
            padding: 36px 30px;
        }

        .application-form__hero h1 {
            font-size: 36px;
        }

        .application-form__grid,
        .application-form__academic-grid {
            grid-template-columns: 1fr;
        }
    }

    @media (max-width: 768px) {
        .application-form {
            padding: 32px 20px;
        }

        .application-form__hero {
            padding: 28px 22px;
        }

        .application-form__hero h1 {
            font-size: 31px;
        }

        .application-form__section {
            padding: 24px 20px;
        }

        .application-form__section h2 {
            margin: -24px -20px 24px -20px;
        }

        .application-form__actions {
            flex-direction: column;
            align-items: stretch;
        }

        .application-form__actions input,
        .application-form__actions a {
            width: 100%;
        }
    }
</style>

<div class="application-form">
    
    <section class="application-form__section">
        <h2>Academic qualifications</h2>

        <div class="application-form__academic-grid">
            <asp:Panel ID="pnlGcseGrades" runat="server" CssClass="application-form__academic-gcse">
                <p class="application-form__section-description application-form__field--full">Required for applicants aged 16 to 18.</p>

                <div class="application-form__grid">
                    <div class="application-form__field">
                        <label for="<%= ddlEnglishLiteratureGrade.ClientID %>" class="application-form__label application-form__label--required">GCSE English Literature Grade</label>
                        <asp:DropDownList ID="ddlEnglishLiteratureGrade" runat="server"></asp:DropDownList>
                    </div>

                    <div class="application-form__field">
                        <label for="<%= ddlMathsGrade.ClientID %>" class="application-form__label application-form__label--required">GCSE Maths Grade</label>
                        <asp:DropDownList ID="ddlMathsGrade" runat="server"></asp:DropDownList>
                    </div>

                    <div class="application-form__field">
                        <label for="<%= ddlEnglishLanguageGrade.ClientID %>" class="application-form__label application-form__label--required">GCSE English Language Grade</label>
                        <asp:DropDownList ID="ddlEnglishLanguageGrade" runat="server"></asp:DropDownList>
                    </div>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlHighestQualification" runat="server" CssClass="application-form__field">
                <cc1:StudentEnrolmentField ID="fldPrior" runat="server" StudentEnrolmentFieldType="PriorAttainmentLevelID" IsRequired="false" LabelWidth="300" CustomCaption="Highest Level of Qualification" />
            </asp:Panel>
        </div>

        <div class="application-form__hidden">
            <asp:Table ID="tblQuals" runat="server"></asp:Table>
        </div>
    </section>

   
    <div class="application-form__actions">
        <cc1:CCCButton ID="btnBack" runat="server" CssClass="application-form__button application-form__button--secondary" Text="Back" LinkResource="directapply3_aspx" CausesValidation="false" />
        <cc1:CCCButton ID="btnContinue" runat="server" CssClass="application-form__button" Text="Next" CausesValidation="true" EnableEnterKey="true" SaveForLater="true" SaveForLaterIn="All" />
    </div>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

    <asp:HiddenField ID="intDisabilityRows" Value="0" runat="server" ClientIDMode="static" />
</div>

<script>
    (function () {
        function findInput(containerId) {
            var container = document.getElementById(containerId);

            if (!container) {
                return null;
            }

            return container.querySelector("input, select, textarea");
        }

        function parseDate(value) {
            if (!value) {
                return null;
            }

            var trimmed = value.toString().trim();

            if (/^\d{4}-\d{2}-\d{2}$/.test(trimmed)) {
                var isoDate = new Date(trimmed + "T00:00:00");
                return isNaN(isoDate.getTime()) ? null : isoDate;
            }

            var parts = trimmed.split("/");

            if (parts.length === 3) {
                var day = parseInt(parts[0], 10);
                var month = parseInt(parts[1], 10) - 1;
                var year = parseInt(parts[2], 10);
                var ukDate = new Date(year, month, day);
                return isNaN(ukDate.getTime()) ? null : ukDate;
            }

            var fallback = new Date(trimmed);
            return isNaN(fallback.getTime()) ? null : fallback;
        }

        function getAge(dateOfBirth) {
            if (!dateOfBirth) {
                return null;
            }

            var today = new Date();
            var age = today.getFullYear() - dateOfBirth.getFullYear();
            var monthDiff = today.getMonth() - dateOfBirth.getMonth();

            if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dateOfBirth.getDate())) {
                age--;
            }

            return age;
        }

        function setVisible(element, shouldShow) {
            if (!element) {
                return;
            }

            element.style.display = shouldShow ? "" : "none";
        }

        function toggleAgeSections() {
            var dobInput = findInput("<%= WorkingData.ApplicationRequestRow.DateOfBirth %>");
            var age = dobInput ? getAge(parseDate(dobInput.value)) : null;
            var isAge16To18 = age !== null && age >= 16 && age <= 18;
            var isAge19Plus = age !== null && age >= 19;

          
            setVisible(document.getElementById("<%= pnlGcseGrades.ClientID %>"), age === null || isAge16To18);
            setVisible(document.getElementById("<%= pnlHighestQualification.ClientID %>"), age === null || isAge19Plus);
        }

        document.addEventListener("DOMContentLoaded", function () {
            var dobInput = findInput("<%= WorkingData.ApplicationRequestRow.DateOfBirth %>");

           if (dobInput) {
               dobInput.addEventListener("change", toggleAgeSections);
               dobInput.addEventListener("keyup", toggleAgeSections);
           }

           document.querySelectorAll("form").forEach(function (form) {
               form.addEventListener("submit", copyPrimaryDisabilityCheckboxesToSource);
           });

          
           toggleAgeSections();
       });

        

       
        
    })();


</script>