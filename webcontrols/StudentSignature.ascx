<%@ Control Language="VB" AutoEventWireup="false" CodeFile="StudentSignature.ascx.vb" Inherits="webcontrols_StudentSignature" %>
<style>
    .student-signature-pad {
        width: 500px;
    }
</style>

<div class="form-group">
    <p class="textfieldlabelrequired">Signature</p>
    <div id="<%= Me.ClientID %>_signature" class="student-signature-pad"></div>
    <div class="btn btn-danger" id="<%= Me.ClientID %>_clear" data-action="clear"> Clear Signature
    <%--    <p><small><i>Press to reset signature</i></small></p>--%>
    </div>
</div>

<asp:HiddenField runat="server" ID="hidSignature" />
<!--[if lt IE 9]>
    <script type="text/javascript" src="scripts/jSignature/flashcanvas.js"></script>
<![endif]-->
<script src="scripts/jSignature/jSignature.min.js"></script>
<script>
    $(document).ready(function () {
        var $signature = $("#<%= Me.ClientID %>_signature");
        var $clear = $("#<%= Me.ClientID %>_clear");
        var $hidden = $("#<%= hidSignature.ClientID %>");

        $signature.jSignature();

        if ($hidden.val().length > 0) {
            try {
                $signature.jSignature("setData", $hidden.val());
            } catch (e) {
            }
        }

        $signature.bind("change", function () {
            var datapair = $signature.jSignature("getData", "base30");
            $hidden.val(datapair.join(","));
        });

        $clear.bind("click", function (e) {
            e.preventDefault();
            $signature.jSignature("reset");
            $hidden.val("");
        });
    });
</script>