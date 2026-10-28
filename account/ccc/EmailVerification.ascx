<%@ Control Language="VB" AutoEventWireup="false" CodeFile="EmailVerification.ascx.vb" Inherits="account_ccc_EmailVerification" %>

<style>
    .email-verification {
        width: 100%;
        margin: 0;
        padding: 56px;
        background: #ffffff;
        font-family: Montserrat, Helvetica, sans-serif;
        color: #000000;
    }

    .email-verification * {
        box-sizing: border-box;
    }

    .email-verification::before {
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

    .email-verification__hero {
        margin-bottom: 36px;
        padding: 48px;
        background: #F3F1EE;
        border-left: 8px solid #43973D;
    }

    .email-verification__hero h1 {
        margin: 0 0 14px 0;
        color: #000000;
        font-size: 44px;
        font-weight: 800;
        line-height: 1.12;
    }

    .email-verification__hero p {
        max-width: 820px;
        margin: 0;
        color: #333333;
        font-size: 18px;
        line-height: 1.55;
    }

    .email-verification__panel {
        max-width: 920px;
        padding: 32px;
        background: #ffffff;
        border: 1px solid #e3e3e3;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
    }

    .email-verification__panel h2 {
        margin: -32px -32px 28px -32px;
        padding: 22px 28px;
        background: #43973D;
        color: #ffffff;
        font-size: 22px;
        font-weight: 800;
    }

    .email-verification__actions {
        display: grid;
        gap: 20px;
    }

    .email-verification .btn,
    .email-verification .btn-primary {
        min-height: 54px;
        padding: 0 34px;
        background: #43973D !important;
        border: 2px solid #43973D !important;
        border-radius: 0;
        color: #ffffff !important;
        font-weight: 800;
    }

    .email-verification .btn:hover,
    .email-verification .btn:focus,
    .email-verification .btn-primary:hover,
    .email-verification .btn-primary:focus {
        background: #000000 !important;
        border-color: #000000 !important;
        color: #ffffff !important;
    }

    .email-verification .alert-danger {
        margin: 0;
        padding: 16px 20px;
        background: #fff4f4;
        border: 1px solid #d80000;
        border-left: 8px solid #d80000;
        border-radius: 0;
        color: #000000;
        font-weight: 700;
    }

    .email-verification .alert-success {
        margin: 0;
        padding: 16px 20px;
        background: #eef8ec;
        border: 1px solid #43973D;
        border-left: 8px solid #43973D;
        border-radius: 0;
        color: #000000;
        font-weight: 700;
    }

    .email-verification .close {
        color: #000000;
        opacity: 1;
    }

    @media (max-width: 768px) {
        .email-verification {
            padding: 32px 20px;
        }

        .email-verification__hero {
            padding: 28px 22px;
        }

        .email-verification__hero h1 {
            font-size: 32px;
        }

        .email-verification__panel {
            padding: 24px 20px;
        }

        .email-verification__panel h2 {
            margin: -24px -20px 24px -20px;
        }
    }
</style>

<div class="email-verification">
    <div class="email-verification__hero">
        <h1>Email verification</h1>
        <p>Please verify your email address before continuing. If you have not received the verification email, you can request a new code below.</p>
    </div>

    <div class="email-verification__panel">
        <h2>Verify your account</h2>

        <div class="email-verification__actions">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

            <asp:Button ID="ResendVerification" runat="server" Text="Resend verification code" Visible="false" CssClass="btn btn-primary btn-block" />

            <div class="alert alert-success alert-dismissable" runat="server" visible="false" id="altSuccess">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong>Success!</strong> We've sent an email to your inbox. Please check it for the link to verify your account.
            </div>
        </div>
    </div>
</div>