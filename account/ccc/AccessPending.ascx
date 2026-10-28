<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AccessPending.ascx.vb" Inherits="account_ccc_AccessPending" %>

<style>
    .account-message {
        width: 100%;
        margin: 0;
        padding: 56px;
        background: #ffffff;
        font-family: Montserrat, Helvetica, sans-serif;
        color: #000000;
    }

    .account-message * {
        box-sizing: border-box;
    }

    .account-message::before {
        content: "Account verification";
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

    .account-message__hero {
        margin-bottom: 36px;
        padding: 48px;
        background: #F3F1EE;
        border-left: 8px solid #43973D;
    }

    .account-message__hero h1 {
        margin: 0 0 14px 0;
        color: #000000;
        font-size: 44px;
        font-weight: 800;
        line-height: 1.12;
    }

    .account-message__hero p {
        max-width: 820px;
        margin: 0;
        color: #333333;
        font-size: 18px;
        line-height: 1.55;
    }

    .account-message__panel {
        max-width: 920px;
        padding: 32px;
        background: #ffffff;
        border: 1px solid #e3e3e3;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
    }

    .account-message__panel h2 {
        margin: -32px -32px 28px -32px;
        padding: 22px 28px;
        background: #43973D;
        color: #ffffff;
        font-size: 22px;
        font-weight: 800;
    }

    .account-message__field {
        display: flex;
        flex-direction: column;
        gap: 8px;
        margin-bottom: 24px;
    }

    .account-message__field label {
        color: #000000;
        font-size: 14px;
        font-weight: 800;
    }

    .account-message__field label::after {
        content: " *";
        color: #b00020;
    }

    .account-message__field input[type="email"] {
        min-height: 50px;
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #cfcfcf;
        border-radius: 0;
        color: #000000;
        font-family: Montserrat, Helvetica, sans-serif;
        font-size: 14px;
    }

    .account-message__field input[type="email"]:focus {
        outline: none;
        border-color: #43973D;
        box-shadow: 0 0 0 3px rgba(67, 151, 61, 0.18);
    }

    .account-message .btn,
    .account-message .btn-primary {
        min-height: 54px;
        padding: 0 34px;
        background: #43973D !important;
        border: 2px solid #43973D !important;
        border-radius: 0;
        color: #ffffff !important;
        font-weight: 800;
    }

    .account-message .btn:hover,
    .account-message .btn:focus,
    .account-message .btn-primary:hover,
    .account-message .btn-primary:focus {
        background: #000000 !important;
        border-color: #000000 !important;
    }

    .account-message .alert-danger {
        margin-top: 24px;
        padding: 16px 20px;
        background: #fff4f4;
        border: 1px solid #d80000;
        border-left: 8px solid #d80000;
        border-radius: 0;
        color: #000000;
        font-weight: 700;
    }

    .account-message .alert-success {
        margin-top: 24px;
        padding: 16px 20px;
        background: #eef8ec;
        border: 1px solid #43973D;
        border-left: 8px solid #43973D;
        border-radius: 0;
        color: #000000;
        font-weight: 700;
    }

    .account-message .close {
        color: #000000;
        opacity: 1;
    }

    @media (max-width: 768px) {
        .account-message {
            padding: 32px 20px;
        }

        .account-message__hero {
            padding: 28px 22px;
        }

        .account-message__hero h1 {
            font-size: 32px;
        }

        .account-message__panel {
            padding: 24px 20px;
        }

        .account-message__panel h2 {
            margin: -24px -20px 24px -20px;
        }
    }
</style>



<div class="account-message">
    <div class="account-message__hero">
        <h1>Access pending</h1>
        <p>We have sent you an email. Please click the link in that email to verify your account.</p>
    </div>

    <div class="account-message__panel">
        <h2>Request a new verification code</h2>

        <div class="account-message__field">
            <label for="email">Email</label>
            <input type="email" id="email" class="form-control" name="pre[email]" placeholder="Enter your email address" autocomplete="off" required />
        </div>

        <asp:Button runat="server" ID="btnResendCode" Text="Resend verification code" CssClass="btn btn-primary btn-block" />

        <div class="alert alert-success alert-dismissable" runat="server" visible="false" id="altSuccess">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <strong>Success!</strong> We've sent an email to your inbox. Please check it for the link to verify your account.
        </div>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />
    </div>
</div>