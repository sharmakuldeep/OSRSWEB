<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 7/5/12
  Time: 1:52 PM
  To change this template use File | Settings | File Templates.
--%>


  <ul>
      <li>
          No. of Enrollment High School
          <ul>
          <li>
              No of Students Enrolled
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','highSchoolTotal','studentEnrolledBoys','No. of Enrollment High School-No of Students Enrolled (Boys)')">Boys</li>
              <li class="pointer" onclick="displayEduGraph('education','highSchoolTotal','studentEnrolledGirls','No. of Enrollment High School-No of Students Enrolled (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              No of Students Attending School
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','highSchoolTotal','studentAttendingBoys','No. of Enrollment High School-No of Students Attending School (Boys)')">Boys</li>
              <li  class="pointer" onclick="displayEduGraph('education','highSchoolTotal','studentAttendingGirls','No. of Enrollment High School-No of Students Attending School (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              No of New Entrants/Fresh Entry
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','highSchoolTotal','newEntrantsBoys','No. of Enrollment High School-No of New Entrants/Fresh Entry (Boys)')">Boys</li>
              <li class="pointer" onclick="displayEduGraph('education','highSchoolTotal','newEntrantsGirls','No. of Enrollment High School-No of New Entrants/Fresh Entry (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              No of Students Discontinued Studies
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','highSchoolTotal','studentDiscontinuedStudiesBoys','No. of Enrollment High School-No of Students Discontinued Studies (Boys)')">Boys</li>
              <li class="pointer" onclick="displayEduGraph('education','highSchoolTotal','studentDiscontinuedStudiesGirls','No. of Enrollment High School-No of Students Discontinued Studies (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              Reasons for Discontinuation of studies
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','highSchoolTotal','reasonOfDiscontinuationEconomic','No. of Enrollment High School-Reasons for Discontinuation of studies (Economic)')">Economic</li>
              <li class="pointer" onclick="displayEduGraph('education','highSchoolTotal','reasonOfDiscontinuationNonEconomic','No. of Enrollment High School-Reasons for Discontinuation of studies (Non-Economic)')">Non-Economic</li>
              </ul>
          </li>
          </ul>
      </li>
      <li>
          No of Teachers in Pre-Primary School
          <ul>
              <li class="pointer"
                  onclick="displayEduGraph('education', 'highSchoolTotal', 'noOfTeacherMale', 'No of Teachers in High School (Male)')">Male</li>
              <li class="pointer"
                  onclick="displayEduGraph('education', 'highSchoolTotal', 'noOfTeacherFemale', 'No of Teachers in High School (Female)')">Female</li>
          </ul>
      </li>
      <li class="pointer" onclick="displayEduGraph('education', 'highSchoolTotal', 'noChildNeverEnrolled', 'No of Teachers in High. School (Male)')">
          No of Children aged 6-14 yrs,never enrolled in school
      </li>


    </ul>