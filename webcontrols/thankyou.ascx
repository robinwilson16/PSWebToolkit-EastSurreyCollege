<%@ control Language="VB"  AutoEventWireup="false" CodeFile="thankyou.ascx.vb" Inherits="thankyou"  %>

<style>
    * {
        font-family: Montserrat, Helvetica, sans-serif;
    }

    .thankyou-container {
        max-width: 800px;
        margin: 0 auto;
        padding: 64px 40px;
        background: #ffffff;
        border-radius: 24px;
        text-align: center;
    }

    .thankyou-badge {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 8px 20px;
        background: #fe0018;
        color: #ffffff;
        border-radius: 50px;
        font-size: 14px;
        font-weight: 600;
        letter-spacing: 0.3px;
        margin-bottom: 24px;
    }

    .thankyou-badge-icon {
        font-size: 18px;
        line-height: 1;
    }

    .thankyou-heading {
        font-size: 36px;
        font-weight: 700;
        color: #02213e;
        margin: 0 0 12px 0;
        line-height: 44px;
    }

    .thankyou-subheading {
        font-size: 18px;
        font-weight: 400;
        color: #4b5563;
        margin: 0 0 32px 0;
        line-height: 28px;
    }

    .thankyou-step {
        display: flex;
        align-items: flex-start;
        gap: 16px;
        padding: 20px 24px;
        background: #f7f9fc;
        border: 1px solid #d6dce5;
        border-left: 4px solid #02213e;
        border-radius: 8px;
        text-align: left;
        max-width: 600px;
        margin: 0 auto 24px auto;
    }

    .thankyou-step-icon {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 36px;
        height: 36px;
        background: #02213e;
        color: #ffffff;
        border-radius: 50%;
        font-size: 16px;
        font-weight: 700;
        flex-shrink: 0;
    }

    .thankyou-step-text h3 {
        font-size: 16px;
        font-weight: 600;
        color: #02213e;
        margin: 0 0 4px 0;
        line-height: 22px;
    }

    .thankyou-step-text p {
        font-size: 14px;
        font-weight: 400;
        color: #4b5563;
        margin: 0;
        line-height: 22px;
    }

    .thankyou-contact {
        display: inline-flex;
        align-items: center;
        gap: 12px;
        padding: 16px 24px;
        background: #f7f9fc;
        border: 1px solid #d6dce5;
        border-left: 4px solid #fe0018;
        border-radius: 8px;
        text-align: left;
    }

    .thankyou-contact p {
        font-size: 14px;
        font-weight: 400;
        color: #4b5563;
        margin: 0;
        line-height: 22px;
    }

    .thankyou-contact a {
        color: #fe0018;
        font-weight: 600;
        text-decoration: underline;
    }

    .thankyou-contact a:hover {
        color: #d50014;
    }

    @media (max-width: 768px) {
        .thankyou-container {
            padding: 32px 16px;
        }

        .thankyou-heading {
            font-size: 26px;
            line-height: 34px;
        }

        .thankyou-subheading {
            font-size: 15px;
            line-height: 22px;
        }

        .thankyou-step {
            padding: 16px;
        }
    }
</style>

<div class="thankyou-container">
    <span class="thankyou-badge">
        <span class="thankyou-badge-icon">✓</span>
        Enrolment form Submitted
    </span>

    <h1 class="thankyou-heading">Thank You!</h1>
    <p class="thankyou-subheading">Your enrolment request has been successfully submitted to Orbital South Colleges.</p>

    <div class="thankyou-step">
        <span class="thankyou-step-icon">✉</span>
        <div class="thankyou-step-text">
            <h3>We'll Be In Touch</h3>
            <p>We will now review your completed enrolment form and begin processing your enrolment. You will receive an email to confirm that we have received your form and to guide you on any next steps.<br />
Submitting this form does not mean you are fully enrolled or have a place in the course. Once we have reviewed your form and everything is correct, we will send you an email to confirm your enrolment has been fully processed, and you have a place on your course. <br />
If we find any missing information or documents, we will contact you by email to request what’s needed. Please ensure you are monitoring your emails, so you do not risk missing out on your place. </p>
        </div>
    </div>

    <div class="thankyou-contact">
        <p>In the meantime, if you have any questions please don’t hesitate to get in touch via <a href="mailto:clientservices@esc.ac.uk">clientservices@esc.ac.uk</a> or <a href="tel:01737 772611">01737 772611</a>.</p>
    </div>
</div>