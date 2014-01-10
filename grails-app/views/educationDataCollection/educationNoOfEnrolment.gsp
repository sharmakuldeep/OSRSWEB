<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta content="main" name="layout">
      <style type="text/css">

        .field{
            float: right;
            width: 57%;
            height: 20px;
        }
    </style>
  </head>
  <body>

  <div id="content">
      <div align="center">
           <h1> Department of Economics & Statistics </h1>
       </div>  <br>
      <g:render template="/layouts/dataInfo" /><br>
      <h2>Education Form : No Of Enrolment (${type} ${no+1})</h2>

      <div style="padding: 20px;border: 2px solid black">
      <g:form controller="educationDataCollection" action="educationNoOfEnrolmentSave">
         <g:if test="${noOfEnrolment}">
              <g:hiddenField name="educationId" value="${education?.id}"/>
              <g:hiddenField name="id" value="${noOfEnrolment?.id[no]}"/>
              <g:hiddenField name="institutionType" value="${type}"/>

              <div >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Name of Institution</span>
                <div class="field"> <input  placeholder="Enter Name" type="text" name="name" value="${noOfEnrolment?.name[no]}" style="width: 28%" />
              </div>
             </div>
              <div >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled (Boys)</span>
               <div class="field">  <input  placeholder="Enter Number" type="text" name="studentEnrolledBoys" value="${noOfEnrolment?.studentEnrolledBoys[no]}" style="width: 28%;" onkeypress="validateIsNumber(event)"  />
              </div>
             </div>
              <div>
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled (Girls)</span>
              <div class="field">   <input  placeholder="Enter Number" type="text" name="studentEnrolledGirls" value="${noOfEnrolment?.studentEnrolledGirls[no]}" style="width: 28%;" onkeypress="validateIsNumber(event)"  />
              </div>
             </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Attending School (Boys)</span>
               <div class="field">    <input  placeholder="Enter Number" type="text" name="studentAttendingBoys" value="${noOfEnrolment?.studentAttendingBoys[no]}" style="width: 28%;" onkeypress="validateIsNumber(event)"  />
              </div>
             </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Attending School (Girls)</span>
            <div class="field">       <input  placeholder="Enter Number" type="text" name="studentAttendingGirls" value="${noOfEnrolment?.studentAttendingGirls[no]}" style="width: 28%;" onkeypress="validateIsNumber(event)"  />
              </div>
              </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of new entrants/fresh entry (Boys)</span>
             <div class="field">      <input  placeholder="Enter Number" type="text" name="newEntrantsBoys" value="${noOfEnrolment?.newEntrantsBoys[no]}" style="width: 28%;" onkeypress="validateIsNumber(event)"  />
              </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of new entrants/fresh entry (Girls)</span>
                <div class="field">   <input  placeholder="Enter Number" type="text" name="newEntrantsGirls" value="${noOfEnrolment?.newEntrantsGirls[no]}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
             </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student discontinued Studies (Boys)</span>
               <div class="field">    <input  placeholder="Enter Number" type="text" name="studentDiscontinuedStudiesBoys" value="${noOfEnrolment?.studentDiscontinuedStudiesBoys[no]}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
             </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student discontinued Studies (Girls)</span>
                <div class="field">   <input  placeholder="Enter Number" type="text" name="studentDiscontinuedStudiesGirls" value="${noOfEnrolment?.studentDiscontinuedStudiesGirls[no]}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
             </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Reason for discontinuation of studies Economic </span>
              <div class="field">     <input  placeholder="Enter Number" type="text" name="reasonOfDiscontinuationEconomic" value="${noOfEnrolment?.reasonOfDiscontinuationEconomic[no]}" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
             </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Reason for discontinuation of studies Non-Economic</span>
              <div class="field">     <input  placeholder="Enter Number" type="text" name="reasonOfDiscontinuationNonEconomic" value="${noOfEnrolment?.reasonOfDiscontinuationNonEconomic[no]}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
             </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Teacher ${type} (Male)</span>
                <div class="field">   <input  placeholder="Enter Number" type="text" name="noOfTeacherMale" value="${noOfEnrolment?.noOfTeacherMale[no]}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
             </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Teacher ${type} (Female)</span>
                 <div class="field">  <input  placeholder="Enter Number" type="text" name="noOfTeacherFemale" value="${noOfEnrolment?.noOfTeacherFemale[no]}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
             </div>

              <g:if test="${type=='High School'}">
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Child aged 6-14yrs, never enrolled in School </span>
                   <div class="field"><input  placeholder="Enter Number" type="text" name="noChildNeverEnrolled" value="${noOfEnrolment?.noChildNeverEnrolled[no]}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
                  </div>
              </g:if>
             </g:if>
          <g:else>
              <g:hiddenField name="educationId" value="${education?.id}"/>
              <g:hiddenField name="id" value="${noOfEnrolment?.id}"/>
              <g:hiddenField name="institutionType" value="${type}"/>

              <div >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Name of Institution</span>
              <div class="field">   <input  placeholder="Enter Name" type="text" name="name" value="" style="width: 28%" />
              </div>
              </div>
              <div >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled (Boys)</span>
              <div class="field">   <input  placeholder="Enter Number" type="text" name="studentEnrolledBoys" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
              </div>
              <div>
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled (Girls)</span>
               <div class="field">  <input  placeholder="Enter Number" type="text" name="studentEnrolledGirls" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
              </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Attending School (Boys)</span>
                 <div class="field">  <input  placeholder="Enter Number" type="text" name="studentAttendingBoys" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
              </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Attending School (Girls)</span>
               <div class="field">    <input  placeholder="Enter Number" type="text" name="studentAttendingGirls" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
              </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of new entrants/fresh entry (Boys)</span>
            <div class="field">      <input  placeholder="Enter Number" type="text" name="newEntrantsBoys" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
              </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of new entrants/fresh entry (Girls)</span>
               <div class="field">    <input  placeholder="Enter Number" type="text" name="newEntrantsGirls" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
              </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student discontinued Studies (Boys)</span>
                  <div class="field"> <input  placeholder="Enter Number" type="text" name="studentDiscontinuedStudiesBoys" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
              </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student discontinued Studies (Girls)</span>
                  <div class="field"> <input  placeholder="Enter Number" type="text" name="studentDiscontinuedStudiesGirls" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
              </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Reason for discontinuation of studies Economic </span>
               <div class="field">    <input  placeholder="Enter Number" type="text" name="reasonOfDiscontinuationEconomic" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
              </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Reason for discontinuation of studies Non-Economic</span>
                  <div class="field"> <input  placeholder="Enter Number" type="text" name="reasonOfDiscontinuationNonEconomic" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
              </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Teacher ${type} (Male)</span>
                <div class="field">   <input  placeholder="Enter Number" type="text" name="noOfTeacherMale" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
              </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Teacher ${type} (Female)</span>
                  <div class="field"> <input  placeholder="Enter Number" type="text" name="noOfTeacherFemale" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
              </div>
              <g:if test="${type=='High School'}">
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Child aged 6-14yrs, never enrolled in School </span>
                 <div class="field">  <input  placeholder="Enter Number" type="text" name="noChildNeverEnrolled" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
                  </div>
              </g:if>

          </g:else>
          <div>
                  <input class="buttonClass" name="Submit input" type="submit" value="Save"/>
                  <g:link controller="educationDataCollection" action="main">
                      <input class="buttonClass" type="button" value="Back">
                  </g:link>
              </div>
      </g:form>
      </div>

  </div>
  </body>
</html>