<%@ page contentType="text/html;charset=UTF-8" %>
<html>


<head>

<style>
.RGraph_zoom_window {
    border: 2px solid #ccc ! important;
    box-shadow: 0 0 15px #aaa ! important;;
    -moz-box-shadow: 0 0 15px #aaa ! important;
    -webkit-box-shadow: 0 0 15px #aaa ! important;
}
</style>
    <title>Simple GSP page</title>
    <g:javascript library="jquery" plugin="jquery"/>
    <script src="${resource(dir:'js/RGraph',file:'RGraph.common.core.js')}"></script>
    <script src="${resource(dir:'js/RGraph',file:'RGraph.common.zoom.js')}"></script>
    <script src="${resource(dir:'js/RGraph',file:'RGraph.common.annotate.js')}"></script>
    <script src="${resource(dir:'js/RGraph',file:'RGraph.common.context.js')}"></script>
    <script src="${resource(dir:'js/RGraph',file:'RGraph.common.dynamic.js')}"></script>
    <script src="${resource(dir:'js/RGraph',file:'RGraph.pie.js')}"></script>
    <script src="${resource(dir:'js/RGraph',file:'RGraph.bar.js')}"></script>
    %{--<script src="${resource(dir:'js/RGraph',file:'RGraph.vprogress.js')}"></script>--}%
    %{--<script src="${resource(dir:'js/RGraph',file:'RGraph.hprogress.js')}"></script>--}%
    %{--<script src="${resource(dir:'js/RGraph',file:'RGraph.bipolar.js')}"></script>--}%

    <script>
        window.onload = function ()
        {

            {

                  alert(" aim"+${finall});
                // The data to be shown on the Pie chart
                var data = ${finall} ;
                alert( "data "+data) ;
                var data1=${finalLabel}
//
                alert(" data 1111"+data1)    ;
//                data='['+data+']';
//                alert(" data " +data)       ;

                // Create the Pie chart. The arguments are the canvas ID and the data to be shown.
                var pie = new RGraph.Pie('pie', data);

                // Configure the chart to look as you want.
                pie.Set('chart.labels',data1);
                pie.Set('chart.linewidth', 1);
                pie.Set('chart.stroke', 'blue');
//                pie.Set('chart.title', 'Summary');
                pie.Set('chart.text.color','orange');




//                if (!RGraph.isOld()) {
//                    pie.Set('chart.contextmenu', [
//                        ['Clear annotations', function () {RGraph.ClearAnnotations(pie.canvas);RGraph.Clear(pie.canvas); pie.Draw();}],
//                        ['Zoom in', RGraph.Zoom]
//                    ]);
//                    pie.Set('chart.annotatable', true);
//                    pie.Set('chart.zoom.hdir', 'left');
//                    pie.Set('chart.zoom.factor', 1.5);
//                    pie.Set('chart.zoom.vdir', 'center');
//                    pie.Set('chart.zoom.frames', 100); // Number of frames
//                    pie.Set('chart.zoom.delay', 5);  // Delay between each frame
//                    pie.Set('chart.zoom.shadow', true);  // Show a shadow on the zoomed chart
//                    pie.Set('chart.zoom.background', true);
//                }
//
//                pie.Set('chart.title', 'Chart with zoom (context, annotatable)');
//                pie.Set('chart.shadow', true);
//                pie.Set('chart.shadow.color', '#999');
                pie.Draw();

//                pie.Set('chart.contextmenu', [
//                    ['Clear annotations', function ()
//                    {
//                        RGraph.ClearAnnotations(pie.canvas);
//                        RGraph.Clear(pie.canvas);
//                        pie.Draw();
//                    }],
//                    ['Zoom in', RGraph.Zoom]
//                ]);
//                pie.Set('chart.title', 'Chart with zoom (context-menu, annotatable)');
//                pie.Set('chart.shadow', true);
//                pie.Set('chart.annotatable', false);
//                pie.Draw();









                // Call the .Draw() chart to draw the Pie chart.

            }






            {

                // Some data that is to be shown on the bar chart. To show a stacked or grouped chart
                // each number should be an array of further numbers instead.

                alert( "data "+data) ;


                // An example of the data used by stacked and grouped charts
//                var data = [[1,5,6], [4,5,3], [7,8,9]]


                // Create the br chart. The arguments are the ID of the canvas tag and the data
                var bar = new RGraph.Bar('bar', data1);
%{----}%
%{----}%
//                Now configure the chart to appear as wanted by using the .Set() method.
//                All available properties are listed below.
                bar.Set('chart.labels',data1);
                bar.Set('chart.gutter.left', 45);
                bar.Set('chart.gutter', 70);
                bar.Set('chart.background.barcolor1', 'orange');
                bar.Set('chart.background.barcolor2', 'orange');
                bar.Set('chart.text.color','orange');
                bar.Set('chart.title', 'Summary');
                bar.Set('chart.title.yaxis', 'No.Of Education Sources');
                bar.Set('chart.title.xaxis', 'Schools & Colleges');
%{----}%
%{----}%
                bar.Set('chart.contextmenu',[
                    ['Clear annotations', function ()
                    {
                        RGraph.ClearAnnotations(bar.canvas);
                        RGraph.Clear(bar.canvas);
                        bar.Draw();
                    }],
                    ['Zoom in', RGraph.Zoom]
                ]);
                bar.Set('chart.title', 'Chart with zoom (context-menu, annotatable)');
                bar.Set('chart.shadow', true);
                bar.Set('chart.annotatable', false);



//                Now call the .Draw() method to draw the chart
                bar.Draw();

            }



//            {
//                // Create the object. The arguments are: The canvas ID, the indicated value and the maximum value.
//                var myProgress = new RGraph.VProgress('vprogress', 78, 100);
//
//                // Configure the chart to look as you want.
//                myProgress.Set('chart.colors', ['red']);
//
//                // Now call the .Draw() method to draw the chart.
//                myProgress.Draw();
//            }




//            {
//                // Create the progress bar. The arguments are: the canvas tag ID, the value and the
//                // maximum value.
//                var myProgress = new RGraph.HProgress('hprogress', 78, 100);
//
//                // Configure the progress bar to appear as requested.
//                myProgress.Set('chart.colors', ['red']);
//
//                // Now call the .Draw() method to draw the chart.
//                myProgress.Draw();
//            }

//            {
//                // The Bipolar chart takes two arrays of data - one for the left side and one for the right.
//                var left  = [5,6,8];
//                var right = [5,8,4];
//
//
//
//                // Create the Bi-polar object. Give the constructor the ID of the canvas tag along with
//                // the left sides data and the right sides data.
//                var bipolar = new RGraph.Bipolar('bipolar', left, right);
//
//                // Configure the Bipolar chart to appear as wished.
//                bipolar.Set('chart.colors', ['#fff', '#eef', '#ddf', '#ccf', '#bbf', '#bbf', '#aaf', '#99f']);
//                bipolar.Set('chart.margin', 3);
//                bipolar.Set('chart.labels', ['Districts', 'Blocks', 'Villages']);
//                bipolar.Set('chart.title.left', '2011');
//                bipolar.Set('chart.title.right', '2012');
//                bipolar.Set('chart.gutter.bottom', 45);
//
//                // Now call the .Draw() method to draw the chart
//                bipolar.Draw();
//            }



        }


        </script>
    <style>

    body {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px; /*background-image: url(images/page-bg.jpg);*/
        background-image: url(${resource(dir:'images',file:'page-bg.jpg')});
        background-repeat: repeat-x;
    }

    .s2ui_hidden_button {
        float: right;
        height: 0;
        left: 1px;
        margin: 0;
        padding: 0;
        position: absolute;
        width: 0;
        z-index: -1000;
        border: 0;
        background: white;
    }

    .txtlink2:link {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 12px;
        font-weight: bold;
        color: #FFF;
        text-decoration: underline;
    }

    .txtlink2:visited {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 12px;
        font-weight: bold;
        color: #FFF;
        text-decoration: underline;
    }

    .txtlink2:hover {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 12px;
        font-weight: bold;
        color: #FFF;
        text-decoration: none;
    }

    .txtlink2:active {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 12px;
        font-weight: bold;
        color: #FFF;
        text-decoration: underline;
    }

    .smalltxt {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 9px;
        font-weight: normal;
        color: #FFF;
        text-decoration: none;
    }

        /*now onwards css for pop up div of forgot password     */
    .DocumentLeftInner {
        width: 300px;
        height: 50%;
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
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
    }

    .DocumentLeftInner h2 span {
        float: left;
        padding: 7px 0px 5px 12px;
        width: 180px;
    }

    .DocumentLeftCtn {
        width: 178px;
        height: 300px;
        overflow: auto;
        float: left;
        padding: 11px 11px 0px 11px;
    }

    .DocumentLeftBdrBtm {
        width: 360px;
        float: left;
        position: relative;
        top: 1px;
        left: -1px;
        background: url(../images/temp/BdrBtmRight.jpg) top right no-repeat;
    }

    .DocumentLeftBdrBtm img {
        float: left;
    }

    .blackOuterDiv {
        width: 100%;
        float: left;
        position: fixed;
        z-index: 1000;
        top: 0;
        left: 0;
        height: 100%;
        background: url(../images/overlay_bg.png) top left;
        display: none; /*opacity: 0.8;*/
    }
    </style>
    </head>
    <body>

    %{--<table cellpadding="0" cellspacing="0" border="1px;"--}%
           %{--style="margin: 9px;width: 80%;border: 1px solid #ff0000">--}%
        %{--<thead>--}%
          %{--<tr>--}%
              %{--<td>Number of District</td>--}%
              %{--<td>District Name</td>--}%
              %{--<td>Number of PrimarySchools </td>--}%
              %{--<td>Number of SecondarySchools</td>--}%
              %{--<td>Number of SeniorSecondarySchools</td>--}%
              %{--<td>Number of Colleges</td>--}%
          %{--</tr>--}%
        %{--</thead>--}%
        %{--<tbody>--}%
        %{--<tr><td>${dataVar[0]}</td><td>${dataVar[1]}</td><td>${dataVar[2]}</td></tr>--}%
        %{--<g:each in="${dataObjects}" var="dataObject">--}%
        %{--<tr>--}%
            %{--<td>${a}</td>--}%
            %{--<td>${dataObject.districtName}</td>--}%
            %{--<td>${dataObject.primarySchool}</td>--}%
            %{--<td>${dataObject.secondarySchool}</td>--}%
            %{--<td>${dataObject.seniorSecondarySchool}</td>--}%
            %{--<td>${dataObject.college}</td>--}%
        %{--</tr>--}%
        %{--</g:each>--}%

        %{--<tr>--}%
            %{--<td>Total</td>--}%
            %{--<td>${primarySchools}</td>--}%
            %{--<td>${secondarySchools}</td>--}%
            %{--<td>${seniorSecondarySchools}</td>--}%
            %{--<td>${colleges}</td>--}%
        %{--</tr>--}%

        %{--</tbody>--}%
    %{--</table>--}%

    %{--<img src="../images/temp/pie.jpeg" alt="" width="100px" height="100px">--}%
   %{--<a href="#" onclick="$('#pop_up').attr('style', 'display:inline');" >Pie</a>--}%
    <input type="button" style= "width:30px;height:30px ;background-image:url(../images/temp/pie.jpeg) "
           %{--name="Pie" value="Pie" /--}%
   <a href="Graph.gsp#" onclick="$('#pop_up').attr('style', 'display:inline');" >Pie</a>
   %{--<a href="#" onclick="$('#aaa').attr('style', 'display:inline');" >Pie</a>--}%
    %{--<input type="button" style= "width:50px;height:50px ;background-image:url(../images/temp/pie.jpeg)"--}%
           %{--name="Pai" ><a href="#" onclick="$('#pop_up').attr('style', 'display:inline');">Pie</a>--}%
    <input type="button" style="width:30px;height:30px ;background-image:url(../images/temp/bar.jpeg) "
           %{--name="Bar" value="Bar"/--}%
    <a href="Graph.gsp#" onclick="$('#pop_up1').attr('style', 'display:inline');" >Bar</a>
        <h1>
            %{--${data}--}%
        </h1>
        <canvas id="pie1" width="600" height="300">"UTSDkdjg</canvas>
        <canvas id="bar1" width="300" height="300" style="cursor: crosshair;">"UTSDkdjg</canvas>
        %{--<canvas id="vprogress" width="100" height="300">"UTSDkdjg</canvas>--}%
        %{--<canvas id="hprogress" width="600" height="90">"UTSDkdjg</canvas>--}%
        %{--<canvas id="bipolar" width="800" height="200">"UTSDkdjg</canvas>--}%
    %{--${dataVar}--}%
    <div>
        %{--// on click of forgot password this particular dialog box opens--}%
        <div id="pop_up" class="blackOuterDiv" style="display: none;">
            <div id="popUpOuterDiv" class="DocumentLeftInner"
                 style="width: 0px; height: 360px;z-index: 1000;position:absolute;top:155px;left:290px;">
                <h2 style="width: 0px;">
                    <span style="width: 710px;border-top-left-radius: 8px;">

                        <a href="Graph.gsp#" style="text-decoration: none;float: right;font-weight:bold;color: #ffffff;"
                           onclick="hidePopUp()">Close</a>
                    </span>
                </h2>

                <div id="popUpInnerDiv" class="DocumentLeftCtn" style="width: 850px;height: 574px;float: left;">
                    %{--<p>A mail will be sent to your domain manager, to reset the password.</p>--}%
                    <table border="0" style="font-size: small;">
                        %{--<tr><td>User Name :</td><td><input type="text" id="forgotPasswordUserName" style="width:180px;"/>--}%
                        %{--</td></tr>--}%
                        %{--<tr><td></td><td></td></tr>--}%
                        %{--<tr><td><g:radio name="selectedDomain" value="circle" checked="checked"/> Circle</td><td><g:select--}%
                        %{--from="${Circle.list().name}" id="circleList" noSelection="['': '- Choose A Circle -']"--}%
                        %{--style="width:180px;"/></td>--}%
                        %{--</tr>--}%
                        %{--<tr><td><g:radio name="selectedDomain" value="division"/> Division</td><td><g:select--}%
                        %{--from="${Division.list().name}" id="divisionList"--}%
                        %{--noSelection="['': '- Choose A Division -']" disabled="true" style="width:180px;"/></td></tr>--}%
                        %{--<tr><td><g:radio name="selectedDomain" value="subDivision"/> SubDivision</td><td><g:select--}%
                        %{--from="${SubDivision.list().name}" id="subDivisionList"--}%
                        %{--noSelection="['': '- Choose A Sub-Division -']" disabled="true" style="width:180px;"/></td>--}%
                        %{--</tr>--}%
                        %{--<tr><td><g:radio name="selectedDomain" value="irca"/> IRCA</td><td><g:select--}%
                        %{--from="${Irca.list().name}" id="ircaList"--}%
                        %{--noSelection="['': '- Choose An IRCA -']" disabled="true" style="width:180px;"/></td></tr>--}%
                        <div id="aaa">
                            <canvas id="pie" width="800" height="350">"UTSDkdjg</canvas>



                    </div></table>
                     </div></div>  </div>
                    <div>
                        %{--// on click of forgot password this particular dialog box opens--}%
                        <div id="pop_up1" class="blackOuterDiv" style="display: none;">
                            <div id="popUpOuterDiv1" class="DocumentLeftInner"
                                 style="width: 1060px; height: 00px;z-index: 2000;position:relative;top:10px;left:290px;">
                                <h2 style="width: 0px;">
                                    <span style="width: 800px;border-top-left-radius: 8px;">

                                        <a href="Graph.gsp#" style="text-decoration: none;float: right;font-weight:bold;color: #ffffff;"
                                           onclick="hidePopUp()">Close</a>
                                    </span>
                                </h2>

                                <div id="popUpInnerDiv1" class="DocumentLeftCtn" style="width: 2050px;height: 590px;float: left;">
                                    %{--<p>A mail will be sent to your domain manager, to reset the password.</p>--}%
                                    <table border="0" style="font-size: small;">
                                        %{--<tr><td>User Name :</td><td><input type="text" id="forgotPasswordUserName" style="width:180px;"/>--}%
                                        %{--</td></tr>--}%
                                        %{--<tr><td></td><td></td></tr>--}%
                                        %{--<tr><td><g:radio name="selectedDomain" value="circle" checked="checked"/> Circle</td><td><g:select--}%
                                        %{--from="${Circle.list().name}" id="circleList" noSelection="['': '- Choose A Circle -']"--}%
                                        %{--style="width:180px;"/></td>--}%
                                        %{--</tr>--}%
                                        %{--<tr><td><g:radio name="selectedDomain" value="division"/> Division</td><td><g:select--}%
                                        %{--from="${Division.list().name}" id="divisionList"--}%
                                        %{--noSelection="['': '- Choose A Division -']" disabled="true" style="width:180px;"/></td></tr>--}%
                                        %{--<tr><td><g:radio name="selectedDomain" value="subDivision"/> SubDivision</td><td><g:select--}%
                                        %{--from="${SubDivision.list().name}" id="subDivisionList"--}%
                                        %{--noSelection="['': '- Choose A Sub-Division -']" disabled="true" style="width:180px;"/></td>--}%
                                        %{--</tr>--}%
                                        %{--<tr><td><g:radio name="selectedDomain" value="irca"/> IRCA</td><td><g:select--}%
                                        %{--from="${Irca.list().name}" id="ircaList"--}%
                                        %{--noSelection="['': '- Choose An IRCA -']" disabled="true" style="width:180px;"/></td></tr>--}%


                        <canvas id="bar" width="780" height="600" style="cursor: crosshair;">"UTSDkdjg</canvas>

                        %{--<tr><td><input type="button" value="Send Mail" onclick="sendMail()" id="sendButton"/></td>--}%
                            %{--<td><input type="button"--}%
                                       %{--value="Cancel"--}%
                                       %{--onclick="hidePopUp()" id="cancelSendButton"/>--}%
                            %{--</td></tr>--}%
                        <tr>
                            <td id="mailStatus" colspan="2" style="text-align:center;">

                            </td>
                        </tr>
                    </table>
                </div>

                <div class="DocumentLeftBdrBtm" style="width: 362px;"><img alt="" src="../images/temp/BdrBtmLeft.jpg">
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    function hidePopUp() {
    $('#forgotPasswordUserName').val('');
    $('#circleList').val('');
    $('#divisionList').val('');
    $('#subDivisionList').val('');
    $('#ircaList').val('');
    $('#pop_up').attr('style', 'display:none');
        $('#pop_up1').attr('style', 'display:none');
    }

    </script>

    </body>
    </html>
