<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<g:javascript library="application"/>
<g:javascript library="jquery" plugin="jquery"/>
  <g:urlMappings/>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
<title>Multi-Tenant Information Management System</title>
<link rel="stylesheet" type="text/css"
      href="${resource(dir: 'css', file: 'damayant.css')}"/>
<link rel="shortcut icon" href="${resource(dir:'images',file:'d_logo.jpg')}" type="image/x-icon" />
<!--[if lte IE 8]>
<script type="text/javascript" src="${resource(dir: 'js', file: 'html5.js')}" ></script>
<![endif]-->
<script type="text/javascript"
        src="${resource(dir: 'js', file: 'script.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js',file:'jquery.1.7.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js',file:'validation.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js',file:'ddsmoothmenunew.js')}"></script>
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />

<script type="text/javascript">

    ddsmoothmenu.init({
        mainmenuid: "smoothmenu1", //menu DIV id
        orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
        classname: 'ddsmoothmenu', //class added to menu's outer DIV
        //customtheme: ["#1c5a80", "#18374a"],
        contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
    })</script>

<script src="${resource(dir:'js',file:'DD_roundies_0.js')}" type="text/javascript"></script>
<script src="${resource(dir:'js',file:'corner.js')}" type="text/javascript"></script>

</head>

    %{--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--}%
    %{--<title>Damayant</title>--}%
    %{--<g:javascript library="jquery" plugin="jquery"/>--}%

    %{--<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>--}%
    %{--<title>Multi-Tenant Information Management System</title>--}%
    %{--<link href="${resource(dir: 'css', file: 'damayant.css')}" rel="stylesheet" type="text/css"/>--}%
    <!--[if lt IE 8]>

<![endif]-->
    %{--<script type="text/javascript" src="${resource(dir:'js',file:'DD_roundies_0.js')}"></script>--}%

    %{--<script src="${resource(dir:'js',file:'corner.js')}" type="text/javascript"></script>--}%
    %{--<script src=${resource(dir:'js',file:'html5.js')}"" type="text/javascript"></script>--}%
    <![endif]-->




    <style type="text/css">

    .DocumentLeftInner {
            width: 200px;
            float: left;
            margin-top: 1px;
            background: #fff;
        }

    .DocumentLeftInner h2 {
        width: 202px;
        float: left;
        position: relative;
        top: -1px;
        left: -1px;
        font: bold 12px Arial, Helvetica, sans-serif;
        color: #FFFFFF;
        margin: 0px;
        background: url(../images/temp/ui-bg_gloss-wave.png) repeat-x scroll 50% 50% #5C9CCC;
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;
    }

    .DocumentLeftInner h2 span {
        float: left;
        padding: 7px 0px 5px 12px;
        width: 180px;
    }



    .DocumentLeftBdrBtm img {
        float: left;
    }
        .DocumentLeftCtn {
        width: 178px;
        height: 300px;
        overflow: auto;
        float: left;
        padding: 11px 11px 0px 11px;
    }


    </style>


</head>

<body>

<div class="outer">
    <div class="wrapper">
    <header>
       <div style="height: 100px">
        <div class="top-left">
            <img src="${resource(dir: 'images', file: 'logo.png')}" alt="">
        </div>

        <div class="top-right">
            <p class="welcome" align="right">

            </p>
        </div>
    </div>

    <div style="height: 36px;color: #ffffff;text-transform: uppercase;font-weight: bold;font-size: 20px" align="center">
        Multi-Tenant Information Management System
    </div>
    </header>
    <section class="login-wp">
        <div style="margin-left: 125px;text-decoration: underline">
            <g:link uri="/mobile">
                <img src="${resource(dir:'images',file:'mobile.png')}" alt="" width="50px" height="50px">
                Mobile version</g:link></div>
        <h1>
           Online Statistical Revenue System
           <span> Empowering Information Management, Reporting, and Intelligence </span>
                                            </h1>
        <div class="login">
            <section id="login">
                <form action='${postUrl}' method='POST' id="loginForm" name="loginForm" autocomplete='off'>
                <h2>LOGIN BOX</h2>
               <p><label>Username</label> <input name="j_username" type="text" class="text_field"
                                                 value="USER NAME" onfocus="if
                               (this.value == this.defaultValue) this.value = '';"     />                </p>
                <p><label>Password</label><input name="j_password" type="password" class="text_field" value="PASSWORD" onfocus="if
                        (this.value == this.defaultValue) this.value = '';" onpaste="return false;"/></p>
                %{--<p><label>Password :</label> <input name="" type="text"></p>--}%
                <p class="btn"><label>&nbsp;</label> <input name="" type="submit" value="Submit"></p>
                %{--<p class="remember"><label>Remember me?</label><input name="" type="checkbox" value=""></p>--}%
                <p>
                <a href="#" onclick="$('#pop_up').attr('style', 'display:inline');" class="forgotpass">
                    <g:message code='spring.security.ui.login.forgotPassword'/>

                </a>
                <g:if test="${flash.message}">

                    <p style="color: red">     ${flash.message}</p>

                </g:if>
                </p>
                </form>
            </section>
            <div class="register1">
            <section id="register"><h2>About MIMS</h2>
                <p>MIMS is an open-source system to support integrated data management, analytic and business intelligence services for Government and Enterprise Customers. </p>
                <li>Provide an easy to use information processing gateway</li>
        <li>Enable access to information from web or mobile apps</li>
        <li>Enhance decision making by accessing right information at the right time</li>
        %{--<li>Build a collaborative ecosystem to bring best industry best practices and processes</li>--}%
          </section>
                </div>
        </div>
    </section>

     <g:render template="/layouts/footer"/>

</div></div>
<div>
    %{--// on click of forgot password this particular dialog box opens--}%
    <div id="pop_up" class="blackOuterDiv" style="display: none;">
        <div id="popUpOuterDiv" class="DocumentLeftInner"
             style="width: 360px; height: 320px;z-index: 1000;position:absolute;top:200px;left:500px;">
            <h2 style="width: 362px;">
                <span style="width: 340px;border-top-left-radius: 8px;">
                    Forgot Password
                    %{--<div id="Overlay">--}%
                   <a href="#" style="text-decoration: none;float: right;font-weight:bold;color: #FFFFFF;"
                       onclick="hidePopUp()">Close</a>
                </span>
            </h2>

            <div id="popUpInnerDiv" class="DocumentLeftCtn" style="width: 338px;height: 274px;float: left;">
                <p>A mail will be sent to your domain manager, to reset the password.</p>
                <table border="0" style="font-size: small;">
                    <tr><td>User Name :</td><td><input type="text" id="forgotPasswordUserName" style="width:180px;"/>
                    </td></tr>
                    <tr><td></td><td></td></tr>

                    <tr><td><input type="button" class="buttonClass" value="Send Mail"  id="sendButton"/></td>
                        <td><input type="button" class="buttonClass" value="Cancel" onclick="hidePopUp1()" id="cancelSendButton"/>
                        </td></tr>
                   <tr>
                        <td id="mailStatus" colspan="2" style="text-align:center;">

                        </td>
                    </tr>
                </table>
                <div  id="overlay" style="display: none">
                    <div class="progress" style="margin-top: 40px;padding-left: 130px">
                 &nbsp;<img src="${ g.resource( dir:'images', file:'progressbar.gif' ) }" alt="logo"/>
                    </div>
                </div>
            </div>

            <div class="DocumentLeftBdrBtm" style="width: 362px;"><img alt="" src="../images/temp/BdrBtmLeft.jpg">
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#username').focus();
    });
//
    function getSelectedRadio(selectedRadio) {
        var value = '';
        $('[name="' + selectedRadio + '"]').each(function () {
            if ($(this).attr('checked'))
                value = $(this).attr('value');
        });
        return value;
    }

     function sendMail() {
//         alert("aabbbb");
        var username = $('#forgotPasswordUserName').val().trim();
//         alert("username"+username);
        var domainName = '';
            $('#sendButton').attr('disabled', true);
            $('#cancelSendButton').attr('disabled', true);
            $('#mailStatus').html('Trying To Send Mail....');
            $.ajax({
                url:'${createLink(controller: 'login', action: 'forgotPassword')}',
                data:{userName:username},
                type:'POST',
                async:false,
                cache:false,
                timeout:30000,
                error:function () {
                    return true;
                },
                success:function (response) {
                    alert(response);
                    $('#sendButton').attr('disabled', false);
                    $('#cancelSendButton').attr('disabled', false);
                    $('#mailStatus').html('');
                    hidePopUp();
                }
            });
        }



    function hidePopUp() {
//        alert("aaaaaaa") ;
        $('#forgotPasswordUserName').val('');
        $('#pop_up').attr('style', 'display:none');
    }

    %{--<s2ui:initCheckboxes/>--}%

</script>
</body>
</html>
