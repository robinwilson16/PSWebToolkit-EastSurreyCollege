<%@ Page Title="" Language="VB" MasterPageFile="UserControlMasterPage.master" AutoEventWireup="false" CodeFile="~/webenrolment.aspx.vb" Inherits="webcontrols_webenrolment" MaintainScrollPositionOnPostback="true" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceholder" Runat="Server">

     <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
  <%--  <script type="text/javascript">
       
     
        function BeginRequestHandler(sender, args) {
            window.scrollBy(x, 200);
        }
    </script>


       <div class="loading">
 


</div>

     <style>
        /* Absolute Center Spinner */
.loading {
  position: fixed;
  display: none;
  z-index: 1031;
  height: 2em;
  width: 2em;
  overflow: show;
  margin: auto;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
}

/* Transparent Overlay */
.loading:before {
  content: '';
  display: block;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.3);
}

/* Transparent Overlay */



/* :not(:required) hides these rules from IE9 and below */
.loading:not(:required) {
  font: 0/0 a;
  color: transparent;
  text-shadow: none;
  background-color: transparent;
  border: 0;
}

.loading:not(:required):after {
  content: 'Please wait while we find your exam';
  display: block;
  font-size: 10px;
  width: 1em;
  height: 1em;
  margin-top: -0.5em;
  -webkit-animation: spinner 1500ms infinite linear;
  -moz-animation: spinner 1500ms infinite linear;
  -ms-animation: spinner 1500ms infinite linear;
  -o-animation: spinner 1500ms infinite linear;
  animation: spinner 1500ms infinite linear;
  border-radius: 0.5em;
  -webkit-box-shadow: rgb(0,119,200) 1.5em 0 0 0, rgb(0,119,200) 1.1em 1.1em 0 0, rgb(0,119,200) 0 1.5em 0 0, rgb(0,119,200) -1.1em 1.1em 0 0, rgba(0, 0, 0, 0.5) -1.5em 0 0 0, rgba(0, 0, 0, 0.5) -1.1em -1.1em 0 0, rgb(0,119,200) 0 -1.5em 0 0, rgb(0,119,200) 1.1em -1.1em 0 0;
  box-shadow: rgb(0,119,200) 1.5em 0 0 0, rgb(0,119,200) 1.1em 1.1em 0 0, rgb(0,119,200) 0 1.5em 0 0, rgb(0,119,200) -1.1em 1.1em 0 0, rgb(0,119,200) -1.5em 0 0 0, rgb(0,119,200) -1.1em -1.1em 0 0, rgb(0,119,200) 0 -1.5em 0 0, rgb(0,119,200) 1.1em -1.1em 0 0;
}

/* Animation */
@-webkit-keyframes spinner {
  0% {
      content: 'Please wait while we find your exam';
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
      content: 'Please wait while we find your exam';
    -webkit-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@-moz-keyframes spinner {
  0% {
      content: 'Please wait while we find your exam';
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
      content: 'Please wait while we find your exam';
    -webkit-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@-o-keyframes spinner {
  0% {
      content: 'Please wait while we find your exam';
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
      content: 'Please wait while we find your exam';
    -webkit-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@keyframes spinner {
  0% {
      content: 'Please wait while we find your exam';
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
      content: 'Please wait while we find your exam';
    -webkit-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}

    </style>
   <script>
       var busyIndicatorTimer = null;

       function displayBusyIndicator() {
           $('.loading').show();
       }

       function hideBusyIndicator() {
           if (busyIndicatorTimer) {
               clearTimeout(busyIndicatorTimer);
               busyIndicatorTimer = null;
           }

           $('.loading').hide();
       }

       function isClientValidationValid() {
           if (typeof (Page_ClientValidate) === "function") {
               Page_ClientValidate();
           }

           if (typeof (Page_IsValid) !== "undefined" && Page_IsValid === false) {
               return false;
           }

           return true;
       }

       function displayBusyIndicatorIfValid() {
           hideBusyIndicator();

           busyIndicatorTimer = window.setTimeout(function () {
               if (isClientValidationValid()) {
                   displayBusyIndicator();
               } else {
                   hideBusyIndicator();
               }
           }, 50);
       }

       $(window).on("beforeunload", function () {
           displayBusyIndicator();
       });

       $(document).on("submit", "form", function () {
           if (!isClientValidationValid()) {
               hideBusyIndicator();
               return false;
           }

           displayBusyIndicatorIfValid();
           return true;
       });

       document.addEventListener("invalid", function () {
           hideBusyIndicator();
       }, true);

       if (typeof (Sys) !== "undefined" && Sys.WebForms && Sys.WebForms.PageRequestManager) {
           Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
               hideBusyIndicator();
           });
       }
</script>

    <partial name="_BusyIndicatorPartial" />--%>
        
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            
</asp:Content>

