<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <g:urlMappings/>
    %{--<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>--}%
    <meta name="description" content="Multi-Tenant Information Management System" />
    <title>Multi-Tenant Information Management System</title>
    <g:javascript library="application"/>
    <g:javascript library="jquery" plugin="jquery"/>
    <jqui:resources/>


    %{--<script type="text/javascript" src="${resource(dir: 'js/jQuery', file: 'jquery-1.7.1.js')}" ></script>--}%
    %{--<script type="text/javascript" src="${resource(dir: 'js/jQuery', file: 'jquery-1.7.1.min.js')}" ></script>--}%
    <g:javascript library="jquery"/>
    <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'css', file: 'damayant.css')}"/>
    <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'css', file: 'ddsmoothmenu.css')}"/>

    <script type="text/javascript"
            src="${resource(dir: 'DataTables-1.8.2', file: 'media/js/jquery.dataTables.js')}"></script>
    <script type="text/javascript"
            src="${resource(dir: 'TableTools-2.0.1', file: 'media/js/TableTools.js')}"></script>

    <script type="text/javascript"
            src="${resource(dir: 'TableTools-2.0.1', file: 'media/js/ZeroClipboard.js')}"></script>
    <script type="text/javascript"
            src="${resource(dir: 'js/jQuery', file: 'jquery.ui.datepicker.js')}"></script>
    <script type="text/javascript"
            src="${resource(dir: 'js/jQuery', file: 'jquery.ui.core.js')}"></script>

    <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'DataTables-1.8.2', file: 'media/css/demo_table.css')}"/>
    <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'DataTables-1.8.2', file: 'media/css/demo_page.css')}"/>
    <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'DataTables-1.8.2', file: 'examples/examples_support/themes/redmond/jquery-ui-1.8.16.custom.css')}"/>
    <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'TableTools-2.0.1', file: 'media/css/TableTools.css')}"/>
    <script src="${resource(dir: 'js', file: 'graph.js')}" ></script>
      <script src="${resource(dir: 'js', file: 'validation.js')}" ></script>

    <g:javascript library="prototype"/>
    <script src="../js/RGraph/RGraph.common.core.js"></script>
    <script src="../js/RGraph/RGraph.common.context.js"></script>
    <script src="../js/RGraph/RGraph.bar.js"></script>
    <script src="../js/RGraph/RGraph.pie.js"></script>

    %{--<script type="text/javascript"--}%
            %{--src="${resource(dir: 'DataTables-1.8.2', file: 'media/js/jquery.dataTables.js')}"></script>--}%
    %{--<script type="text/javascript"--}%
            %{--src="${resource(dir: 'TableTools-2.0.1', file: 'media/js/TableTools.js')}"></script>--}%
    %{--<script type="text/javascript"--}%
    %{--src="${resource(dir: 'DataTables-1.8.2', file: 'media/js/jquery.jquery.js')}"></script>--}%

    %{--<script type="text/javascript"--}%
            %{--src="${resource(dir: 'TableTools-2.0.1', file: 'media/js/ZeroClipboard.js')}"></script>--}%
    %{--<script type="text/javascript"--}%
            %{--src="${resource(dir: 'js/jQuery', file: 'jquery.ui.datepicker.js')}"></script>--}%
    %{--<script type="text/javascript"--}%
            %{--src="${resource(dir: 'js/jQuery', file: 'jquery.ui.core.js')}"></script>--}%

    %{--<link rel="stylesheet" type="text/css"--}%
          %{--href="${resource(dir: 'DataTables-1.8.2', file: 'media/css/demo_table.css')}"/>--}%
    %{--<link rel="stylesheet" type="text/css"--}%
          %{--href="${resource(dir: 'DataTables-1.8.2', file: 'media/css/demo_page.css')}"/>--}%
    %{--<link rel="stylesheet" type="text/css"--}%
          %{--href="${resource(dir: 'DataTables-1.8.2', file: 'examples/examples_support/themes/redmond/jquery-ui-1.8.16.custom.css')}"/>--}%
    %{--<link rel="stylesheet" type="text/css"--}%
          %{--href="${resource(dir: 'TableTools-2.0.1', file: 'media/css/TableTools.css')}"/>--}%





    <link rel="shortcut icon" href="${resource(dir:'images',file:'d_logo.jpg')}" type="image/x-icon" />
    <script type="text/javascript">
        var downArrowImg='${resource(dir: 'images', file: 'down.gif')}',rightArrowImg='${resource(dir: 'images', file: 'right.gif')}';
    </script>


    <!--[if lte IE 8]>
   <!--<script type="text/javascript" src="${resource(dir: 'js', file: 'html5.js')}" ></script>-->

<![endif]-->
    <script type="text/javascript"
            src="${resource(dir: 'js', file: 'script.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/jQuery', file: 'jquery-ui-1.8.15.custom.js')}"></script>
    %{--<script type="text/javascript" src="${resource(dir: 'js/jQuery', file: 'jquery-ui-1.8.15.custom.min.js')}"></script>--}%
    <script type="text/javascript" src="${resource(dir: 'js', file: 'ddsmoothmenunew.js')}"></script>
    <script type="text/javascript">

        var contextPath = "${request.contextPath}";
        ddsmoothmenu.init({
                    mainmenuid: "smoothmenu1", //menu DIV id
                    orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
                    classname: 'ddsmoothmenu', //class added to menu's outer DIV
                    //customtheme: ["#1c5a80", "#18374a"],
                    contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
                })

        function hiLightTab(){
            var a='${params.action}', c='${params.controller}';
            if(a=='index' && c=='home')
              jQuery('.homeTab').addClass("selected") ;
            else if(c=='dataCollection' ||c=='healthDataCollection' ||c=='educationDataCollection' ||c=='isfDataCollection')
              jQuery('.dataCollectionTab').addClass("selected") ;
            else if(c=='dataCorrection')
              jQuery('.dataCorrectionTab').addClass("selected") ;
            else if(c=='report')
              jQuery('.reportTab').addClass("selected") ;
        }
    </script>

    %{--<script src="${resource(dir: 'js', file: 'DD_roundies_0.js')}" type="text/javascript"></script>--}%

      <script src="${resource(dir: 'js', file: 'validation.js')}" type="text/javascript"></script>
      <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'css', file: 'style.css')}"/>
    <g:layoutHead/>

</head>

<body onload="hiLightTab()">
<div class="outer">
    <div class="wrapper">

        <g:render template="/layouts/newLayoutHeader1"/>
        <article id="content-wp">
            <div style="min-height: 400px">
                <g:layoutBody/>
            </div>

        </article>
        <g:render template="/layouts/footer"/>
    </div>
</div>
</body>
</html>