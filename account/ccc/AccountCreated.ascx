<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AccountCreated.ascx.vb" Inherits="account_ccc_AccountCreated" %>

<style>
    .account-created {
        width: 100%;
        margin: 0;
        padding: 56px;
        background: #ffffff;
        font-family: Montserrat, Helvetica, sans-serif;
        color: #000000;
    }

    .account-created * {
        box-sizing: border-box;
    }

    .account-created::before {
        content: "Account created";
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

    .account-created__hero {
        margin-bottom: 36px;
        padding: 48px;
        background: #F3F1EE;
        border-left: 8px solid #43973D;
    }

    .account-created__hero h1 {
        margin: 0 0 14px 0;
        color: #000000;
        font-size: 44px;
        font-weight: 800;
        line-height: 1.12;
    }

    .account-created__hero p {
        max-width: 820px;
        margin: 0;
        color: #333333;
        font-size: 18px;
        line-height: 1.55;
    }

    .account-created__panel {
        max-width: 920px;
        padding: 32px;
        background: #eef8ec;
        border: 1px solid #43973D;
        border-left: 8px solid #43973D;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
    }

    .account-created__panel p {
        margin: 0;
        color: #000000;
        font-size: 16px;
        font-weight: 700;
        line-height: 1.6;
    }

    @media (max-width: 768px) {
        .account-created {
            padding: 32px 20px;
        }

        .account-created__hero {
            padding: 28px 22px;
        }

        .account-created__hero h1 {
            font-size: 32px;
        }
    }
</style>

<div class="account-created">
    <div class="account-created__hero">
        <h1>Account created successfully</h1>
        <p>Your account has been created. Please wait while we log you in.</p>
    </div>

    <div class="account-created__panel">
        <p>Redirecting you now...</p>
    </div>
</div>