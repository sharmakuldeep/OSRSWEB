/**
 * Created by IntelliJ IDEA.
 * User: Aman
 * Date: 6/19/12
 * Time: 3:17 PM
 * To change this template use File | Settings | File Templates.
 */
var displayGraphType = '';

function displayPopUp(graphType) {
    displayGraphType = graphType;

    var url = contextPath + '/graphicsReport/graphContent1';
    jQuery.ajax({
                    type: "post",
                    url: url,
                    success: function (data, text) {
                        jQuery("#graphicsDisplay").html(data);
                        document.getElementById('Overlay').style.display = 'block';
                    },
                    statusCode: {
                        401: function() {
                            window.location.href = '/osrs/';
                        }
                    }
                });

    document.getElementById('Overlay').style.display = 'block';

}
function displayPopUp1(graphType) {
    displayGraphType = graphType;

    var url = contextPath + '/graphicsReport/graphContent2';
    jQuery.ajax({
                    type: "post",
                    url: url,
                    success: function (data, text) {
                        jQuery("#graphicsDisplay").html(data);
                        document.getElementById('Overlay').style.display = 'block';
                    },
                    statusCode: {
                        401: function() {
                            window.location.href = '/osrs/';
                        }
                    }
                });

    document.getElementById('Overlay').style.display = 'block';

}

function hidePopUp() {
    document.getElementById('Overlay').style.display = 'none';
}


////////////////////////////////////Health data graph///////////////////////////////////////////

function displayHealthPopUp(graphType, graphNo) {
    alert("????"+graphNo)
    displayGraphType = graphType;
    jQuery('#graphHeader').html('');
     debugger;
      var url = contextPath + '/graphicsReport/healthGraphContent'+graphNo;
        jQuery.ajax({
                    type: "post",
                    url: url,
                    success: function (data, text) {
                        jQuery("#graphicsDisplay").html(data);
                        document.getElementById('Overlay').style.display = 'block';
                    },
                    statusCode: {
                        401: function() {
                            window.location.href = '/osrs/';
                        }
                    }
                });

}

function displayHealthGraph(cat, dataType1, dataType2, head) {
    jQuery("#graphicsDisplay").html('<canvas id="graph" width="500" height="200">[No canvas support]</canvas>')
    if (displayGraphType == 'pie') {
        displayHealthPieGraph(cat, dataType1, dataType2, head)
    } else if (displayGraphType == 'bar') {
        displayHealthBarGraph(cat, dataType1, dataType2, head)
    }
}

function displayHealthPieGraph(cat, dataType1, dataType2, head) {
    jQuery('#overLayHeader').html('Pie Graph');
    jQuery('#graphHeader').html(head);
    var gData = [];
    var xAxisList = [];
    for (var i = 0; i < graphData.size(); i++) {
        if (dataType1 == '') {
            if((graphData[i][dataType2])!=null)
            gData.push(graphData[i][dataType2]);
            else gData.push(0);
        } else {
            if((graphData[i][dataType1])!=null){
              if((graphData[i][dataType1][dataType2])!=null){
                gData.push(graphData[i][dataType1][dataType2]);
              }else
                 gData.push(0);
            }else
            gData.push(0);
        }

        if (graphLevel == 'State') {
            xAxisList.push(graphData[i].village.block.district.name);
        } else if (graphLevel == 'District') {
            xAxisList.push(graphData[i].village.block.name);
        } else if (graphLevel == 'Block') {
            xAxisList.push(graphData[i].village.name);
        }
    }
    // The data to be shown on the Pie chart

    // Create the Pie chart. The arguments are the canvas ID and the data to be shown.
    var pie = new RGraph.Pie('graph', gData);

    // Configure the chart to look as you want.
    pie.Set('chart.labels', xAxisList);
    pie.Set('chart.linewidth', 5);
    pie.Set('chart.stroke', 'white');

    // Call the .Draw() chart to draw the Pie chart.
    pie.Draw();
}
function displayHealthBarGraph(cat, dataType1, dataType2, head) {
    jQuery('#overLayHeader').html('Bar Graph');
    jQuery('#graphHeader').html(head);
    var barGraphData = [];
    var xAxisList = [];
    for (var i = 0; i < graphData.size(); i++) {
        if (dataType1 == '') {
            if((graphData[i][dataType2])!=null)
            barGraphData.push(graphData[i][dataType2]);
            else barGraphData.push(0);
        } else {
            if (dataType1 == '') {
            barGraphData.push(graphData[i][dataType2]);
        } else {
            if((graphData[i][dataType1])!=null){
              if((graphData[i][dataType1][dataType2])!=null){
                barGraphData.push(graphData[i][dataType1][dataType2]);
              }else
                 barGraphData.push(0);
            }else
            barGraphData.push(0);
        }
        }
        if (graphLevel == 'State') {
            xAxisList.push(graphData[i].village.block.district.name);
        } else if (graphLevel == 'District') {
            xAxisList.push(graphData[i].village.block.name);
        } else if (graphLevel == 'Block') {
            xAxisList.push(graphData[i].village.name);
        }
    }
    // Create the br chart. The arguments are the ID of the canvas tag and the data
    var bar = new RGraph.Bar('graph', barGraphData);
    // Now configure the chart to appear as wanted by using the .Set() method.
    // All available properties are listed below.
    bar.Set('chart.labels', xAxisList);
    bar.Set('chart.gutter.left', 50);
    bar.Set('chart.background.barcolor1', 'white');
    bar.Set('chart.background.barcolor2', 'white');
    bar.Set('chart.background.grid', true);
    bar.Set('chart.variant', '3d');
    bar.Set('chart.colors', ['blue']);
    // Now call the .Draw() method to draw the chart
    bar.Draw();
}
///////////////Isf Report////////////////////////////////////

function displayIsfPopUp(graphType, graphNo) {
    displayGraphType = graphType;
    jQuery('#graphHeader').html('');
    var url;
        url = contextPath + '/graphicsReport/isfGraphContent'+graphNo;
        jQuery.ajax({
                    type: "post",
                    url: url,
                    success: function (data, text) {
                        jQuery("#graphicsDisplay").html(data);
                        document.getElementById('Overlay').style.display = 'block';
                    },
                    statusCode: {
                        401: function() {
                            window.location.href = '/osrs/';
                        }
                    }
                });

}

function displayGraph(cat, data, head) {
    jQuery("#graphicsDisplay").html('<canvas id="graph" width="500" height="200">[No canvas support]</canvas>')
    if (displayGraphType == 'pie') {
        displayPieGraph(cat, data, head)
    } else if (displayGraphType == 'bar') {
        displayBarGraph(cat, data, head)
    }

}
function displayPieGraph(cat, data, head) {
    jQuery('#overLayHeader').html('Pie Graph');
    jQuery('#graphHeader').html(head);
    var gData = [];
    var xAxisList = [];

    jQuery.each(graphData, function() {
        if ((this[cat + data]) != null)
            gData.push(this[cat + data]);
        else gData.push(0);
        if (graphLevel == 'State') {
            xAxisList.push(this.village.block.district.name);
        } else if (graphLevel == 'District') {
            xAxisList.push(this.village.block.name);
        } else if (graphLevel == 'Block') {
            xAxisList.push(this.village.name);
        }
    });
    // The data to be shown on the Pie chart

    // Create the Pie chart. The arguments are the canvas ID and the data to be shown.
    var pie = new RGraph.Pie('graph', gData);
    // Configure the chart to look as you want.
    pie.Set('chart.labels', xAxisList);
    pie.Set('chart.linewidth', 5);
    pie.Set('chart.stroke', 'white');
    // Call the .Draw() chart to draw the Pie chart.
    pie.Draw();
}

function displayBarGraph(cat, data, head) {
    jQuery('#overLayHeader').html('Bar Graph');
    jQuery('#graphHeader').html(head);
    var barGraphData = [];
    var xAxisList = [];
    jQuery.each(graphData, function() {
        if ((this[cat + data]) != null)
            barGraphData.push(this[cat + data]);
        else barGraphData.push(0);
        if (graphLevel == 'State') {
            xAxisList.push(this.village.block.district.name);
        } else if (graphLevel == 'District') {
            xAxisList.push(this.village.block.name);
        } else if (graphLevel == 'Block') {
            xAxisList.push(this.village.name);
        }
    });


    // Create the br chart. The arguments are the ID of the canvas tag and the data
    var bar = new RGraph.Bar('graph', barGraphData);
    // Now configure the chart to appear as wanted by using the .Set() method.
    // All available properties are listed below.
    bar.Set('chart.labels', xAxisList);
    bar.Set('chart.gutter.left', 50);
    bar.Set('chart.background.barcolor1', 'white');
    bar.Set('chart.background.barcolor2', 'white');
    bar.Set('chart.background.grid', true);
    bar.Set('chart.variant', '3d');
    bar.Set('chart.colors', ['blue']);
    // Now call the .Draw() method to draw the chart
    bar.Draw();
}
/////////////////Education////////////////////////

function displayEduPopUp(graphType, graphNo) {


    displayGraphType = graphType;
    jQuery('#graphHeader').html('');
    var url;
        url = contextPath + '/graphicsReport/eduGraphContent'+graphNo;
        jQuery.ajax({
                    type: "post",
                    url: url,
                    success: function (data, text) {
                        jQuery("#graphicsDisplay").html(data);
                        document.getElementById('Overlay').style.display = 'block';
                    },
                    statusCode: {
                        401: function() {
                            window.location.href = '/osrs/';
                        }
                    }
                });
}

function displayEduGraph(cat, dataType1, dataType2, head) {
    jQuery("#graphicsDisplay").html('<canvas id="graph" width="500" height="200">[No canvas support]</canvas>')
    if (displayGraphType == 'pie') {
        displayEduPieGraph(cat, dataType1, dataType2, head)
    } else if (displayGraphType == 'bar') {
        displayEduBarGraph(cat, dataType1, dataType2, head)
    }

}
function displayEduPieGraph(cat, dataType1, dataType2, head) {
    jQuery('#overLayHeader').html('Pie Graph');
    jQuery('#graphHeader').html(head);
    var gData = [];
    var xAxisList = [];

    for (var i = 0; i < graphData.size(); i++) {
        if (dataType1 == '') {
            if ((graphData[i][dataType2]) != null)
                gData.push(graphData[i][dataType2]);
            else gData.push(0);
        } else {
            if ((graphData[i][dataType1]) != null)
                if ((graphData[i][dataType1][dataType2]) != null)
                    gData.push(graphData[i][dataType1][dataType2]);
                else  gData.push(0);
            else  gData.push(0);
        }
        if (graphLevel == 'State') {
            xAxisList.push(graphData[i].village.block.district.name);
        } else if (graphLevel == 'District') {
            xAxisList.push(graphData[i].village.block.name);
        } else if (graphLevel == 'Block') {
            xAxisList.push(graphData[i].village.name);
        }
    }
    // The data to be shown on the Pie chart

    // Create the Pie chart. The arguments are the canvas ID and the data to be shown.
    var pie = new RGraph.Pie('graph', gData);

    // Configure the chart to look as you want.
    pie.Set('chart.labels', xAxisList);
    pie.Set('chart.linewidth', 5);
    pie.Set('chart.stroke', 'white');

    // Call the .Draw() chart to draw the Pie chart.
    pie.Draw();
}
function displayEduBarGraph(cat, dataType1, dataType2, head) {
    jQuery('#overLayHeader').html('Bar Graph');
    jQuery('#graphHeader').html(head);
    var barGraphData = [];
    var xAxisList = [];
    for (var i = 0; i < graphData.size(); i++) {
        if (dataType1 == '') {
            if ((graphData[i][dataType2]) != null)
                barGraphData.push(graphData[i][dataType2]);
            else barGraphData.push(0);
        } else {
            if ((graphData[i][dataType1]) != null)
                if ((graphData[i][dataType1][dataType2]) != null)
                    barGraphData.push(graphData[i][dataType1][dataType2]);
                else  barGraphData.push(0);
            else  barGraphData.push(0);
        }
        if (graphLevel == 'State') {
            xAxisList.push(graphData[i].village.block.district.name);
        } else if (graphLevel == 'District') {
            xAxisList.push(graphData[i].village.block.name);
        } else if (graphLevel == 'Block') {
            xAxisList.push(graphData[i].village.name);
        }
    }
    // Create the br chart. The arguments are the ID of the canvas tag and the data
    var bar = new RGraph.Bar('graph', barGraphData);
    // Now configure the chart to appear as wanted by using the .Set() method.
    // All available properties are listed below.
    bar.Set('chart.labels', xAxisList);
    bar.Set('chart.gutter.left', 50);
    bar.Set('chart.background.barcolor1', 'white');
    bar.Set('chart.background.barcolor2', 'white');
    bar.Set('chart.background.grid', true);
    bar.Set('chart.variant', '3d');
    bar.Set('chart.colors', ['blue']);
    // Now call the .Draw() method to draw the chart
    bar.Draw();
}