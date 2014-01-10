<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 7/5/12
  Time: 1:51 PM
  To change this template use File | Settings | File Templates.
--%>


  <ul>
      <li>
          No. of Enrollment Primary
          <ul>
          <li>
              No of Students Enrolled
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','primaryTotal','studentEnrolledBoys','No. of Enrollment Primary-No of Students Enrolled (Boys)')">Boys</li>
              <li class="pointer" onclick="displayEduGraph('education','primaryTotal','studentEnrolledGirls','No. of Enrollment Primary-No of Students Enrolled (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              No of Students Attending School
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','primaryTotal','studentAttendingBoys','No. of Enrollment Primary-No of Students Attending School (Boys)')">Boys</li>
              <li  class="pointer" onclick="displayEduGraph('education','primaryTotal','studentAttendingGirls','No. of Enrollment Primary-No of Students Attending School (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              No of New Entrants/Fresh Entry
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','primaryTotal','newEntrantsBoys','No. of Enrollment Primary-No of New Entrants/Fresh Entry (Boys)')">Boys</li>
              <li class="pointer" onclick="displayEduGraph('education','primaryTotal','newEntrantsGirls','No. of Enrollment Primary-No of New Entrants/Fresh Entry (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              No of Students Discontinued Studies
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','primaryTotal','studentDiscontinuedStudiesBoys','No. of Enrollment Primary-No of Students Discontinued Studies (Boys)')">Boys</li>
              <li class="pointer" onclick="displayEduGraph('education','primaryTotal','studentDiscontinuedStudiesGirls','No. of Enrollment Primary-No of Students Discontinued Studies (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              Reasons for Discontinuation of studies
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','primaryTotal','reasonOfDiscontinuationEconomic','No. of Enrollment Primary-Reasons for Discontinuation of studies (Economic)')">Economic</li>
              <li class="pointer" onclick="displayEduGraph('education','primaryTotal','reasonOfDiscontinuationNonEconomic','No. of Enrollment Primary-Reasons for Discontinuation of studies (Non-Economic)')">Non-Economic</li>
              </ul>
          </li>
          </ul>
      </li>
      <li>
          No of Teachers in Pre-Primary School
          <ul>
              <li class="pointer"
                  onclick="displayEduGraph('education', 'primaryTotal', 'noOfTeacherMale', 'No of Teachers in Primary School (Male)')">Male</li>
              <li class="pointer"
                  onclick="displayEduGraph('education', 'primaryTotal', 'noOfTeacherFemale', 'No of Teachers in Primary School (Female)')">Female</li>
          </ul>
      </li>


    </ul>