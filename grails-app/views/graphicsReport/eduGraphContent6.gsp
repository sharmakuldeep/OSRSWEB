<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 7/5/12
  Time: 1:52 PM
  To change this template use File | Settings | File Templates.
--%>


  <ul>
      <li>
          No. of Enrollment Senior Sec. School
          <ul>
          <li>
              No of Students Enrolled
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','seniorSecSchoolTotal','studentEnrolledBoys','No. of Enrollment Senior Sec. School-No of Students Enrolled (Boys)')">Boys</li>
              <li class="pointer" onclick="displayEduGraph('education','seniorSecSchoolTotal','studentEnrolledGirls','No. of Enrollment Senior Sec. School-No of Students Enrolled (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              No of Students Attending School
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','seniorSecSchoolTotal','studentAttendingBoys','No. of Enrollment Senior Sec. School-No of Students Attending School (Boys)')">Boys</li>
              <li  class="pointer" onclick="displayEduGraph('education','seniorSecSchoolTotal','studentAttendingGirls','No. of Enrollment Senior Sec. School-No of Students Attending School (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              No of New Entrants/Fresh Entry
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','seniorSecSchoolTotal','newEntrantsBoys','No. of Enrollment Senior Sec. School-No of New Entrants/Fresh Entry (Boys)')">Boys</li>
              <li class="pointer" onclick="displayEduGraph('education','seniorSecSchoolTotal','newEntrantsGirls','No. of Enrollment Senior Sec. School-No of New Entrants/Fresh Entry (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              No of Students Discontinued Studies
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','seniorSecSchoolTotal','studentDiscontinuedStudiesBoys','No. of Enrollment Senior Sec. School-No of Students Discontinued Studies (Boys)')">Boys</li>
              <li class="pointer" onclick="displayEduGraph('education','seniorSecSchoolTotal','studentDiscontinuedStudiesGirls','No. of Enrollment Senior Sec. School-No of Students Discontinued Studies (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              Reasons for Discontinuation of studies
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','seniorSecSchoolTotal','reasonOfDiscontinuationEconomic','No. of Enrollment Senior Sec. School-Reasons for Discontinuation of studies (Economic)')">Economic</li>
              <li class="pointer" onclick="displayEduGraph('education','seniorSecSchoolTotal','reasonOfDiscontinuationNonEconomic','No. of Enrollment Senior Sec. School-Reasons for Discontinuation of studies (Non-Economic)')">Non-Economic</li>
              </ul>
          </li>
          </ul>
      </li>
      <li>
          No of Teachers in Pre-Primary School
          <ul>
              <li class="pointer"
                  onclick="displayEduGraph('education', 'seniorSecSchoolTotal', 'noOfTeacherMale', 'No of Teachers in Senior Sec. School (Male)')">Male</li>
              <li class="pointer"
                  onclick="displayEduGraph('education', 'seniorSecSchoolTotal', 'noOfTeacherFemale', 'No of Teachers in Senior Sec. School (Female)')">Female</li>
          </ul>
      </li>
      <li class="pointer" onclick="displayEduGraph('education', 'seniorSecSchoolTotal', 'noChildNeverEnrolled', 'No of Teachers in Senior Sec.. School (Male)')">
          No of Children aged 6-14 yrs,never enrolled in school
      </li>


    </ul>