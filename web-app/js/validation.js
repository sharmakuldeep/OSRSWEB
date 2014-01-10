/**
 * Created by IntelliJ IDEA.
 * User: damyant
 * Date: 9/19/13
 * Time: 10:57 AM
 * To change this template use File | Settings | File Templates.
 */


    jQuery(document).ready(function($) {


       jQuery('#userName').focusout(function(){

          if($('#userName').val().trim()!="")
          {
          $.ajax({
            type:'post',
	    url:g.createLink({controller: 'admin', action: 'findUser'}),
	     dataType: 'json',
	     data: "userName="+$('#userName').val(),
	   success: function(data) {

           if(data.status=="true"){
                $('#userMsg').html('UserName already exists')
                $('#userName').val('')
                $('#userMsg').show()
           }
           else{
              $('#userMsg').html('')
           }
	  },
	error: function(request, status, error) {
	},
	complete: function() {
	}
});
 }
  })

   jQuery('#homePhone').on('keypress', function(evt) {
           var charCode = (evt.which) ? evt.which : event.keyCode;
           return !(charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57));
           });

    jQuery('#mobilePhone').on('keypress', function(evt) {
           var charCode = (evt.which) ? evt.which : event.keyCode;
           return !(charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57));
           });

      jQuery('#workPhone').on('keypress', function(evt) {
           var charCode = (evt.which) ? evt.which : event.keyCode;
           return !(charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57));
           });
      jQuery('#postalCode').on('keypress', function(evt) {
           var charCode = (evt.which) ? evt.which : event.keyCode;
           return !(charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57));
           });
    jQuery('#createUser').click(function(){
        if( $('#userName').val().trim()==""){

             $('#userMsg').html('Please Enter UserName')
            $('#userMsg').show()
            return false;
        }else{
          $('#userMsg').hide()
        }

        if( $('#password').val().trim()==""){
            $('#pwdMsg').show()
            return false;
        }else{
          $('#pwdMsg').hide()
           // document.forms["saveUser"].submit();
        }

         var email = $('#email').val();
         var reg = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/;

          if($.trim(email)==""){
             $('#userEmail').html('Please enter emailId')
              $('#userEmail').show()
             return false;
          } else if(!reg.test(email)){
              $('#userEmail').html('Please enter valid emailId')
              $('#userEmail').show()
             return false;
          }else{
            $('#userEmail').hide()
            document.forms["saveUser"].submit();
          }


     })
        //////////////////////////////////////////////////////////////////////////////////////////////////
       jQuery('#saveBtn').click(function(){


        if( $('#firstName').val().trim()==""){
            //  alert("Enter firstName")
            // $('#firstMsg').html('Please Enter firstName')
            $('#firstMsg').show()
            return false;
        }else{
          $('#firstMsg').hide()
        }


          /* if( $('#homePhone').val().trim()==""){
            *//* alert("Enter home number")
             $('#homeMsg').html('Please Enter home mobile number')
             $('#homeMsg').show()
            return false;*//*
           }else {
               var myLength = $("#homePhone").val().length
               if(myLength!=10){
                $('#homeMsg').html('Please enter 10 digit mobile number')
                $('#homeMsg').show()
                   return false;
               }else{
                $('#homeMsg').hide()
               }

           }*/

         if( $('#mobilePhone').val().trim()==""){
            // alert("Enter mobile number")
             $('#mobileMsg').html('Please Enter mobile number')
             $('#mobileMsg').show()
            return false;
        }else{
             var mobileLength = $("#mobilePhone").val().length
               if(mobileLength!=10){
               $('#mobileMsg').html('Please enter 10 digit mobile number')
               $('#mobileMsg').show()
                   return false;
               }else{
                      $('#mobileMsg').hide()
               }
             document.forms["update"].submit();
        }

           /*if( $('#workPhone').val().trim()==""){
               *//*alert("workphone")
              $('#workMsg').html('Please enter mobile number')
              $('#workMsg').show()
            return false;*//*
        }else{
               var workLength = $("#workPhone").val().length
               if(workLength!=10){
                alert("Enter 10 digit work mobile number")
                   return false;
               }else{

               }
          $('#workMsg').hide()
           }
*/



            if( $('#postalCode').val().trim()==""){
               /*alert("postalCode")
             $('#postalMsg').html('Please enter mobile number')
             $('#postalMsg').show()
            return false;*/
        }else{
                var postalLength = $("#postalCode").val().length
                if(postalLength!=6){
                 /* $('#postalMsg').html('Enter 6 digit postal code')
                  $('#postalMsg').show()*/

                   //return false;
               }else{
                    // $('#postalMsg').hide()
               }

        }


     })



    jQuery('#delBtn').click(function(){

     var status= confirm("Are you sure want delete the file? ")
     if(status)
          document.forms["delete"].submit();
    })


    //by ajay

      $('#sendButton').attr('disabled', false);
     $('#cancelSendButton').attr('disabled', false);

    jQuery('#sendButton').click(function(){


        var username = $('#forgotPasswordUserName').val().trim();
        if(username!=""){
        $.ajax({
            type:'POST',
           url: g.createLink({controller: 'login', action: 'forgotPassword'}),

            data:{userName:username},

            success:function (response) {
//                    alert(response);
                if(response=="Mail Sent"){

                }
                else{
                    alert(response)
                    $('#forgotPasswordUserName').val('');
                }
//                    $('#sendButton').attr('disabled', false);
//                    $('#cancelSendButton').attr('disabled', false);
//                    $('#overlay').show()
//                    $('#mailStatus').html('');


            }
            ,error:function () {
                return true;
            }
        });
        }
        else{
            alert("Please enter username first.")
        }
    });

    /* validation for update user profile */




});


jQuery(document).ajaxStart(function($) {
    $('#sendButton').attr('disabled', true);
    $('#cancelSendButton').attr('disabled', true);
    $('#overlay').show()
});


  jQuery(document).ajaxStart(function($) {

        $('#overlay').hide()
        $('#sendButton').attr('disabled', false);
        $('#cancelSendButton').attr('disabled', false);
        $('#forgotPasswordUserName').val('');
        $('#pop_up').attr('style', 'display:none');

    });


function hidePopUp1(){
    $('#forgotPasswordUserName').val('');
    $('#pop_up').attr('style', 'display:none');
}
function hideButtons(){

for( var i=1;i<=16;i++) {
    jQuery('#button'+i).hide();
    jQuery('#prevButton'+i).hide();
}

}




