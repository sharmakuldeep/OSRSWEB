<%--
  Created by IntelliJ IDEA.
  User: aman
  Date: 11/26/12
  Time: 6:00 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <title>Simple GSP page</title>
      <meta name="layout" content="main"/>
      <script src="../js/RGraph/RGraph.common.core.js" ></script>
    <script src="../js/RGraph/RGraph.common.dynamic.js" ></script>
    <script src="../js/RGraph/RGraph.common.tooltips.js" ></script>
    <script src="../js/RGraph/RGraph.common.effects.js" ></script>
    <script src="../js/RGraph/RGraph.line.js" ></script>
    <script src="../js/RGraph/jquery.min.js" ></script>
    <!--[if lt IE 9]><script src="../js/excanvas/excanvas.js"></script><![endif]-->

  </head>
  <body>
     <div style="border:2px solid #000000;height: 400px ">
      <div style="width: 100%;background-color: #666666;">
          <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">Analytics(Performance graph)</h2>
      </div>
      <div style="margin-left: 20px;font-size: 20px;">

          <canvas id="cvs" width="800" height="300">[No canvas support]</canvas>

      </div>

  </div>
            <script>
        window.onload = function ()
        {
            var line1 = new RGraph.Line('cvs',[5,5,5,5,5,5,5]);
            line1.Set('chart.curvy', true);
            line1.Set('chart.colors', ['black']);
            line1.Set('chart.curvy.tickmarks', true);
            line1.Set('chart.curvy.tickmarks.fill', null);
            line1.Set('chart.curvy.tickmarks.stroke', '#aaa');
            line1.Set('chart.curvy.tickmarks.stroke.linewidth', 2);
            line1.Set('chart.curvy.tickmarks.size', 5);
            line1.Set('chart.linewidth', 3);
            line1.Set('chart.hmargin', 5);
            line1.Set('chart.ymax', 10);
           // line1.Set('chart.labels', ['Mon','Tue','Wed','Thu','Fri','Sat','Sun']);
           // RGraph.Effects.Line.jQuery.Trace(line1);




             var line = new RGraph.Line('cvs', [4,5,1,6,3,5,2],[]);
            line.Set('chart.curvy', true);
            line.Set('chart.curvy.tickmarks', true);
            line.Set('chart.curvy.tickmarks.fill', null);
            line.Set('chart.curvy.tickmarks.stroke', '#aaa');
            line.Set('chart.curvy.tickmarks.stroke.linewidth', 2);
            line.Set('chart.curvy.tickmarks.size', 5);
            line.Set('chart.linewidth', 3);
            line.Set('chart.hmargin', 5);
            line.Set('chart.labels', ['Mon','Tue','Wed','Thu','Fri','Sat','Sun']);
            line.Set('chart.tooltips', ['Mon','Tue','Wed','Thu','Fri','Sat','Sun']);
            line.Set('chart.tickmarks', 'circle');
            RGraph.Effects.Line.jQuery.Trace(line,line1);
        }
    </script>

  </body>
</html>