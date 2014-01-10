/**
 * Created by IntelliJ IDEA.
 * User: Aman
 * Date: 6/11/12
 * Time: 1:17 PM
 * To change this template use File | Settings | File Templates.
 */


var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

function disableBlock() {
    var url = contextPath + '/dataCollection/disableBlock';
    myAjax = new Ajax.Updater('blocks', url, {
                method : "post",
                onComplete:disablePanchayat,
                evalScripts : true
            });
}
function disablePanchayat() {

    var url = contextPath + '/dataCollection/disablePanchayat';
    myAjax = new Ajax.Updater('panchayat', url, {
                method : "post",
                  onComplete:disableVillage,
                evalScripts : true
            });
}
function disableVillage() {
    var url = contextPath + '/dataCollection/disableVillage';
    myAjax = new Ajax.Updater('villages', url, {
                method : "post",
                evalScripts : true
            });
}

function updateDist(data) {

    var url = contextPath + '/dataCollection/updateDist?stateCode=' + data.value;
    myAjax = new Ajax.Updater('district', url, {
                method : "post",
                onComplete:disableBlock,
                evalScripts : true
            });
}
function updateBlock(data) {

    var url = contextPath + '/dataCollection/updateBlock?distCode=' + data.value;
    myAjax = new Ajax.Updater('blocks', url, {
                method : "post",
                onComplete:disablePanchayat,
                evalScripts : true
            });
}
  function updatePanchayat(data) {

    var url = contextPath + '/dataCollection/updatePanchayat?blockCode=' + data.value;

    myAjax = new Ajax.Updater('panchayat', url, {
                method : "post",
               onComplete:disableVillage,
                evalScripts : true
            });
}


function abc(){
    alert("test")
}


function updateVillage(data) {

    var url = contextPath + '/dataCollection/updateVillage?panchayatCode=' + data.value;
    myAjax = new Ajax.Updater('villages', url, {
                method : "post",
                evalScripts : true
            });
}

function updateMonth(data) {

    var cYear = (new Date()).getYear() + 1900;
    var cMonth = (new Date()).getMonth() + 1;
    var content = '';

    if (cYear == data) {
        for (var i = 0; i < cMonth; i++) {
            content += '<option value="' + (i + 1) + '">' + months[i] + '</option>'
        }
    } else {
        for (var i = 0; i < 12; i++) {
            content += '<option value="' + (i + 1) + '">' + months[i] + '</option>'
        }
    }
    jQuery("#month").html(content);
}

function updateVillageCode(data) {
     var url = contextPath + '/dataCorrection/villageDescription?villageCode=' + data;
    myAjax = new Ajax.Updater('villageDes', url, {
                method : "post",
                evalScripts : true
            });
    var element = document.getElementById('villageCode');
    if (element) {
        element.value = data;
    }
   //jQuery("#villageDes").html("village")
}

function findVillage() {

            var url = contextPath + '/dataCorrection/findVillage?village=' + document.getElementById('village2').value;
            myAjax = new Ajax.Updater('resultVillage', url, {
                        method : "post",
                        evalScripts : true
                    });
        }


function validateForm(thisForm){
//             alert("validating"+thisForm['villageCode']);
    var category=thisForm.category.value;
    var village=document.getElementById('villageCode').value;
    if(category=='' || category==null){
        alert("Select One From Category");
        return false;
    } else if(village=='' || village==null) {
        alert("Please Find Village First");
        return false;
    } else{
        return true;
    }
}

function validateFormDc(thisForm){
    var village=document.getElementById('villageCode').value;
//    var village=thisForm.villageCode.value;
//    alert("villl"+village);
     if(!village){
      alert("Please Find Village First");
        return false;
    }else if(village==''|| village==null) {
        alert("Please Find Village First");
        return false;
    }
     else{
        return true;
    }
}

function validateFormReport(thisForm){
    var state=document.forms["myform"]["stateCode"].value;
    if(state==null || state==""){
        alert("Please Select State") ;
        return false;
    }  else{
        return true;
    }
}

function validateFormDistrictReport(thisForm){
    var district=document.forms["myform"]['district'].value;
    var state=document.forms["myform"]["stateCode"].value;

     console.log("district "+district)

    if(state=='null'|| state==''){
        alert("Please Select State") ;
        return false;
    }
    else if(district=='null'){
        alert("Please Select District");
        return false;
    }
 return true;
}


function validateFormBlockReport(thisForm){
    var district=document.forms["myform"]['district'].value;
    var block= document.forms["myform"]['block'].value;
    var state=document.forms["myform"]["state"].value;
    if(state=='null'|| state==''){
        alert("Please Select State") ;
        return false;
    }
    else if(district=='null'){
        alert("Please Select District");
        return false;
    }
   else if(block=='null'|| block==''){
        alert("Please Select block") ;
        return false;
    }
        return true;

  }