<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_home.ascx.vb" Inherits="checkout_home" %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<style>
    .application-home {
        width: 100%;
        font-family: Montserrat, Helvetica, sans-serif;
        color: #000000;
        background: #ffffff;
    }

    .application-home * {
        box-sizing: border-box;
    }

    .application-home__hero {
        position: relative;
        overflow: hidden;
        padding: 72px 56px;
        background: #F3F1EE;
    }

    .application-home__hero::before {
        content: "";
        position: absolute;
        top: -130px;
        right: -90px;
        width: 360px;
        height: 360px;
        border-radius: 50%;
        background: #cfe3a9;
        opacity: 0.9;
    }

    .application-home__hero::after {
        content: "";
        position: absolute;
        bottom: -150px;
        left: -90px;
        width: 300px;
        height: 300px;
        border-radius: 50%;
        background: #FAA926;
        opacity: 0.35;
    }

    .application-home__hero-inner {
        position: relative;
        z-index: 1;
        width: 100%;
        max-width: none;
        margin: 0;
    }

    .application-home__eyebrow {
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

    .application-home__hero h1 {
        max-width: 980px;
        margin: 0 0 20px 0;
        color: #000000;
        font-size: 48px;
        font-weight: 800;
        line-height: 1.12;
    }

    .application-home__hero p {
        max-width: 980px;
        margin: 0;
        color: #333333;
        font-size: 19px;
        line-height: 1.6;
    }

    .application-home__notice {
        width: calc(100% - 112px);
        margin: -28px 56px 40px 56px;
        position: relative;
        z-index: 2;
        padding: 22px 26px;
        background: #ffffff;
        border-left: 8px solid #43973D;
        box-shadow: 0 12px 34px rgba(0, 0, 0, 0.1);
    }

    .application-home__notice p {
        margin: 0;
        color: #000000;
        font-size: 16px;
        line-height: 1.55;
    }

    .application-home__notice a {
        color: #000000;
        font-weight: 800;
        text-decoration: underline;
    }

    .application-home__notice a:hover {
        text-decoration: none;
    }

    .application-home__content {
        width: 100%;
        margin: 0;
        padding: 0 56px 72px 56px;
    }

    .application-home__grid {
        display: grid;
        grid-template-columns: minmax(0, 1fr) minmax(360px, 0.35fr);
        gap: 40px;
        align-items: start;
    }

    .application-home__panel {
        background: #ffffff;
        border: 1px solid #e3e3e3;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
    }

    .application-home__panel-header {
        padding: 28px 32px;
        background: #43973D;
        color: #ffffff;
    }

    .application-home__panel-header h2 {
        margin: 0;
        color: #ffffff;
        font-size: 26px;
        font-weight: 800;
        line-height: 1.25;
    }

    .application-home__panel-header p {
        margin: 8px 0 0 0;
        color: #ffffff;
        font-size: 15px;
        line-height: 1.5;
    }

    .application-home__summary-grid {
        padding: 32px;
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 22px;
    }

    .application-home__summary-card {
        min-height: 170px;
        padding: 24px;
        background: #F3F1EE;
        border-left: 6px solid #94C947;
    }

    .application-home__summary-card h3 {
        margin: 0 0 12px 0;
        color: #000000;
        font-size: 18px;
        font-weight: 800;
        line-height: 1.3;
    }

    .application-home__summary-card p {
        margin: 0;
        color: #333333;
        font-size: 15px;
        line-height: 1.55;
    }

    .application-home__side-card {
        padding: 32px;
        background: #000000;
        color: #ffffff;
    }

    .application-home__side-card h2 {
        margin: 0 0 16px 0;
        color: #ffffff;
        font-size: 25px;
        font-weight: 800;
        line-height: 1.25;
    }

    .application-home__side-card p {
        margin: 0 0 18px 0;
        color: #ffffff;
        font-size: 15px;
        line-height: 1.55;
    }

    .application-home__steps {
        display: grid;
        gap: 16px;
        margin: 26px 0 0 0;
        padding: 0;
        list-style: none;
        counter-reset: applicationSteps;
    }

    .application-home__steps li {
        counter-increment: applicationSteps;
        position: relative;
        min-height: 42px;
        padding-left: 58px;
        color: #ffffff;
        font-size: 14px;
        line-height: 1.5;
    }

    .application-home__steps li::before {
        content: counter(applicationSteps);
        position: absolute;
        top: 0;
        left: 0;
        width: 38px;
        height: 38px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: #FAA926;
        color: #000000;
        border-radius: 50%;
        font-weight: 800;
    }

    .application-home__account-link {
        display: inline-block;
        margin-top: 22px;
        color: #ffffff;
        font-weight: 800;
        text-decoration: underline;
    }

    .application-home__account-link:hover {
        color: #ffffff;
        text-decoration: none;
    }

    .application-home__accordion {
        margin-top: 42px;
        border-top: 1px solid #d8d8d8;
    }

    .application-home__accordion h2 {
        margin: 0;
        padding: 32px 0 18px 0;
        color: #000000;
        font-size: 25px;
        font-weight: 800;
    }

    .application-home__accordion-item {
        border-bottom: 1px solid #d8d8d8;
    }

    .application-home__accordion-button {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 20px;
        padding: 22px 0;
        background: transparent;
        border: 0;
        color: #000000;
        cursor: pointer;
        font: inherit;
        text-align: left;
    }

    .application-home__accordion-button span:first-child {
        font-size: 17px;
        font-weight: 800;
    }

    .application-home__accordion-icon {
        width: 34px;
        height: 34px;
        flex: 0 0 34px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        background: #43973D;
        color: #ffffff;
        font-size: 24px;
        font-weight: 700;
        line-height: 1;
    }

    .application-home__accordion-button[aria-expanded="true"] .application-home__accordion-icon {
        background: #000000;
    }

    .application-home__accordion-content {
        display: none;
        padding: 0 0 24px 0;
        color: #333333;
        font-size: 15px;
        line-height: 1.6;
    }

    .application-home__accordion-content p {
        margin: 0 0 12px 0;
    }

    .application-home__accordion-content a {
        color: #000000;
        font-weight: 800;
        text-decoration: underline;
    }

    .application-home__accordion-content a:hover {
        text-decoration: none;
    }

    .application-home__accordion-item.is-open .application-home__accordion-content {
        display: block;
    }

    .application-home__actions {
        margin-top: 42px;
        padding: 30px 32px;
        background: #F3F1EE;
        border-top: 8px solid #43973D;
    }

    .application-home__checkbox {
        display: flex;
        align-items: flex-start;
        gap: 12px;
        margin-bottom: 24px;
    }

    .application-home__checkbox input[type="checkbox"] {
        width: 22px;
        height: 22px;
        margin: 2px 0 0 0;
        flex: 0 0 22px;
        accent-color: #43973D;
        cursor: pointer;
    }

    .application-home__checkbox label {
        margin: 0;
        color: #000000;
        font-size: 15px;
        line-height: 1.5;
        cursor: pointer;
    }

    .application-home__button {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-height: 54px;
        padding: 0 34px;
        background: #43973D;
        border: 2px solid #43973D;
        color: #ffffff;
        font-family: Montserrat, Helvetica, sans-serif;
        font-size: 16px;
        font-weight: 800;
        text-decoration: none;
        cursor: pointer;
        transition: background-color 0.2s ease, border-color 0.2s ease, color 0.2s ease;
    }

    .application-home__button:hover,
    .application-home__button:focus {
        background: #000000;
        border-color: #000000;
        color: #ffffff;
    }

    .application-home__validation {
        width: 100%;
        margin: 0 0 32px 0;
        padding: 0 56px;
    }

    .application-home__validation .alert,
    .application-home__validation .alert-danger {
        margin: 0;
        padding: 16px 20px;
        background: #fff4f4;
        border: 1px solid #d80000;
        border-left: 8px solid #d80000;
        color: #000000;
        font-size: 15px;
        font-weight: 700;
    }

    @media (max-width: 1200px) {
        .application-home__summary-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }

    @media (max-width: 1024px) {
        .application-home__hero {
            padding: 48px 28px;
        }

        .application-home__hero h1 {
            font-size: 38px;
        }

        .application-home__notice {
            width: calc(100% - 56px);
            margin-left: 28px;
            margin-right: 28px;
        }

        .application-home__content {
            padding: 0 28px 48px 28px;
        }

        .application-home__grid {
            grid-template-columns: 1fr;
        }

        .application-home__validation {
            padding: 0 28px;
        }
    }

    @media (max-width: 768px) {
        .application-home__hero {
            padding: 38px 20px;
        }

        .application-home__hero h1 {
            font-size: 31px;
        }

        .application-home__hero p {
            font-size: 16px;
        }

        .application-home__notice {
            width: calc(100% - 40px);
            margin: -18px 20px 32px 20px;
            padding: 18px;
        }

        .application-home__content {
            padding: 0 20px 40px 20px;
        }

        .application-home__panel-header,
        .application-home__summary-grid,
        .application-home__side-card,
        .application-home__actions {
            padding: 22px;
        }

        .application-home__summary-grid {
            grid-template-columns: 1fr;
        }

        .application-home__summary-card {
            min-height: 0;
        }

        .application-home__button {
            width: 100%;
        }

        .application-home__validation {
            padding: 0 20px;
        }
    }
</style>

<div class="application-home">
    <section class="application-home__hero" aria-labelledby="applicationHomeTitle">
        <div class="application-home__hero-inner">
            <span class="application-home__eyebrow">Online application</span>
            <h1 id="applicationHomeTitle">Before you start your application</h1>
            <p>
                You are about to start your online application. Please check the information below so you know what details you may need before continuing.
            </p>
        </div>
    </section>

    <div class="application-home__notice">
        <p>
            You can save your progress and return later if you are logged in. If you do not already have an account,
            <a href="webenrolment.aspx?page=~/account/ccc/login.ascx">register or sign in before starting your application</a>.
        </p>
    </div>

    <main class="application-home__content">
        <div class="application-home__grid">
            <section class="application-home__panel" aria-labelledby="applicationHomeInfoTitle">
                <div class="application-home__panel-header">
                    <h2 id="applicationHomeInfoTitle">Information you may be asked for</h2>
                    <p>The application is split into clear sections. You will only be asked for information needed to process your application.</p>
                </div>

                <div class="application-home__summary-grid">
                    <div class="application-home__summary-card">
                        <h3>About you</h3>
                        <p>Your name, date of birth, gender, contact details, National Insurance number and home address.</p>
                    </div>

                    <div class="application-home__summary-card">
                        <h3>Contacts</h3>
                        <p>Details for up to two contacts, including their name, email address, telephone number and relationship to you.</p>
                    </div>

                    <div class="application-home__summary-card">
                        <h3>Background</h3>
                        <p>Your school history, how you heard about us, nationality, ethnicity, country of residence and residency information.</p>
                    </div>

                    <div class="application-home__summary-card">
                        <h3>Support and wellbeing</h3>
                        <p>Information about disabilities, learning difficulties, medical needs, EHCPs, exam support, care status and safeguarding support.</p>
                    </div>

                    <div class="application-home__summary-card">
                        <h3>Qualifications</h3>
                        <p>Your GCSE English Literature, GCSE English Language and GCSE Maths grades, plus your highest level of qualification.</p>
                    </div>

                    <div class="application-home__summary-card">
                        <h3>Keeping in touch</h3>
                        <p>Your preferences for college news, events, courses, email, SMS and relevant information sharing.</p>
                    </div>
                </div>
            </section>

            <aside class="application-home__side-card" aria-labelledby="applicationHomeStepsTitle">
                <h2 id="applicationHomeStepsTitle">What happens next?</h2>
                <p>
                    The application will guide you through each section. Please enter your details carefully and review your answers before submitting.
                </p>

                <ol class="application-home__steps">
                    <li>Register or sign in if you want to save and return later.</li>
                    <li>Confirm you have read the College policies and privacy notice.</li>
                    <li>Select Start application to begin.</li>
                    <li>Review and submit your application when complete.</li>
                </ol>

                <a class="application-home__account-link" href="webenrolment.aspx?page=~/account/ccc/login.ascx">Register or sign in</a>
            </aside>
        </div>

        <section class="application-home__accordion" aria-labelledby="applicationHomeHelpTitle">
            <h2 id="applicationHomeHelpTitle">Good to know</h2>

            <div class="application-home__accordion-item">
                <button type="button" class="application-home__accordion-button" aria-expanded="false" onclick="toggleApplicationHomeAccordion(this)">
                    <span>Can I save and come back later?</span>
                    <span class="application-home__accordion-icon" aria-hidden="true">+</span>
                </button>
                <div class="application-home__accordion-content">
                    <p>
                        Yes, if you are logged in. To use this feature, please
                        <a href="webenrolment.aspx?page=~/account/ccc/register.ascx">register or sign in</a> before starting your application.
                    </p>
                </div>
            </div>

            <div class="application-home__accordion-item">
                <button type="button" class="application-home__accordion-button" aria-expanded="false" onclick="toggleApplicationHomeAccordion(this)">
                    <span>Why do you ask for support and wellbeing information?</span>
                    <span class="application-home__accordion-icon" aria-hidden="true">+</span>
                </button>
                <div class="application-home__accordion-content">
                    <p>This helps the College understand whether you may need learning, wellbeing, safeguarding, exam or medical support during your course.</p>
                </div>
            </div>

            <div class="application-home__accordion-item">
                <button type="button" class="application-home__accordion-button" aria-expanded="false" onclick="toggleApplicationHomeAccordion(this)">
                    <span>Why do you ask for contact preferences?</span>
                    <span class="application-home__accordion-icon" aria-hidden="true">+</span>
                </button>
                <div class="application-home__accordion-content">
                    <p>
                        Data protection law means the College needs your permission to keep you updated about college news, events, courses and related information.
                    </p>
                </div>
            </div>
        </section>

        <div class="application-home__actions">
            <div class="application-home__checkbox">
                <asp:CheckBox ID="chkConfirm" runat="server" />
                <label for="<%= chkConfirm.ClientID %>">I confirm that I have read the College's policies and procedures, and the privacy notice.</label>
            </div>

            <asp:Button ID="getstarted" runat="server" CssClass="application-home__button" Text="Start application" />
        </div>
    </main>
</div>

<div class="application-home__validation">
    <asp:ValidationSummary ID="ValidationSummary4" runat="server" CssClass="alert alert-danger" />
</div>

<script>
    function toggleApplicationHomeAccordion(button) {
        const item = button.closest('.application-home__accordion-item');
        const isOpen = item.classList.toggle('is-open');

        button.setAttribute('aria-expanded', isOpen ? 'true' : 'false');

        const icon = button.querySelector('.application-home__accordion-icon');
        if (icon) {
            icon.textContent = isOpen ? '−' : '+';
        }
    }
</script>