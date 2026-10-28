<%@ Control Language="VB" AutoEventWireup="false" CodeFile="directapply.ascx.vb" Inherits="directapply" %>
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
    <section class="application-form__hero" aria-labelledby="applicationFormTitle">
        <h1 id="applicationFormTitle">Complete your application</h1>
        <p>Please complete each section below. Fields marked with an asterisk (*) are required.</p>
    </section>

    <section class="application-form__section">
        <h2>Your selected course(s)</h2>
        <asp:PlaceHolder runat="server" ID="BasketPlaceHolder"></asp:PlaceHolder>
    </section>

    <section class="application-form__section">
        <h2>Personal details</h2>

        <div class="application-form__grid">
            <div class="application-form__field">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Title" ID="fldTitle" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Title" />
            </div>

            <div class="application-form__field">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="fldForename" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="First Name" />
            </div>

            <div class="application-form__field">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Surname" />
            </div>

            <div class="application-form__field">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="dateofbirth" ID="fldDateOfBirth" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Date of Birth" />
            </div>

            <div class="application-form__field">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="GenderType" ID="fldGenderType" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Gender" />
            </div>

            <div class="application-form__field">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="MobileTel" ID="fldMobileTel" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Mobile Number" />
            </div>

            <div class="application-form__field">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Tel" ID="fldTel" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Home Telephone Number" />
            </div>

            <div class="application-form__field">
                <cc1:StudentEmailField StudentEnrolmentFieldType="Email" ID="fldEmail" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Email" />
            </div>

            <div class="application-form__field">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NI" ID="fldNI" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="National Insurance" />
            </div>
        </div>
    </section>

    <section class="application-form__section">
        <h2>Address</h2>

        <div class="application-form__notice">
            <p>Please enter your home address manually.</p>
        </div>

        <div class="application-form__grid">
            <div class="application-form__field application-form__field--full">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Address1" ID="txtAddress1" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Address Line 1" />
            </div>

            <div class="application-form__field application-form__field--full">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Address2" ID="txtAddress2" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Address Line 2" />
            </div>

            <div class="application-form__field">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Address3" ID="txtAddress3" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Town/City" />
            </div>

            <div class="application-form__field">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Address4" ID="txtAddress4" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="County" />
            </div>

            <div class="application-form__field">
                <label for="<%= postcode.ClientID %>" class="application-form__label application-form__label--required">Postcode</label>
                <input type="text" runat="server" id="postcode" />
            </div>

            <div class="application-form__field">
                <label for="<%= txtYearsAtCurrentAddress.ClientID %>" class="application-form__label application-form__label--required">Years at Current Address</label>
                <asp:TextBox ID="txtYearsAtCurrentAddress" runat="server" TextMode="Number" min="0" step="1"></asp:TextBox>
            </div>
        </div>
    </section>

    <div class="application-form__actions">
        <cc1:CCCButton ID="btnBack" runat="server" CssClass="application-form__button application-form__button--secondary" Text="Back" LinkResource="checkout_home_aspx" CausesValidation="false" />
        <cc1:CCCButton ID="btnContinue" runat="server" CssClass="application-form__button" Text="Next" CausesValidation="true" EnableEnterKey="true" SaveForLater="true" SaveForLaterIn="All" />
    </div>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

    <asp:HiddenField ID="intDisabilityRows" Value="0" runat="server" ClientIDMode="static" />
</div>
