<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 7/3/12
  Time: 2:56 PM
  To change this template use File | Settings | File Templates.
--%>

  <ul>
      <li>
          No. of Enrollment Pre Primary
          <ul>
          <li>
              No of Students Enrolled
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','prePrimaryTotal','studentEnrolledBoys','No. of Enrollment Pre Primary-No of Students Enrolled (Boys)')">Boys</li>
              <li class="pointer" onclick="displayEduGraph('education','prePrimaryTotal','studentEnrolledGirls','No. of Enrollment Pre Primary-No of Students Enrolled (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              No of Students Attending School
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','prePrimaryTotal','studentAttendingBoys','No. of Enrollment Pre Primary-No of Students Attending School (Boys)')">Boys</li>
              <li  class="pointer" onclick="displayEduGraph('education','prePrimaryTotal','studentAttendingGirls','No. of Enrollment Pre Primary-No of Students Attending School (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              No of New Entrants/Fresh Entry
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','prePrimaryTotal','newEntrantsBoys','No. of Enrollment Pre Primary-No of New Entrants/Fresh Entry (Boys)')">Boys</li>
              <li class="pointer" onclick="displayEduGraph('education','prePrimaryTotal','newEntrantsGirls','No. of Enrollment Pre Primary-No of New Entrants/Fresh Entry (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              No of Students Discontinued Studies
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','prePrimaryTotal','studentDiscontinuedStudiesBoys','No. of Enrollment Pre Primary-No of Students Discontinued Studies (Boys)')">Boys</li>
              <li class="pointer" onclick="displayEduGraph('education','prePrimaryTotal','studentDiscontinuedStudiesGirls','No. of Enrollment Pre Primary-No of Students Discontinued Studies (Girls)')">Girls</li>
              </ul>
          </li>
          <li>
              Reasons for Discontinuation of studies
              <ul>
              <li class="pointer" onclick="displayEduGraph('education','prePrimaryTotal','reasonOfDiscontinuationEconomic','No. of Enrollment Pre Primary-Reasons for Discontinuation of studies (Economic)')">Economic</li>
              <li class="pointer" onclick="displayEduGraph('education','prePrimaryTotal','reasonOfDiscontinuationNonEconomic','No. of Enrollment Pre Primary-Reasons for Discontinuation of studies (Non-Economic)')">Non-Economic</li>
              </ul>
          </li>
          </ul>
      </li>
      <li>
          No of Teachers in Pre-Primary School
          <ul>
              <li class="pointer"
                  onclick="displayEduGraph('education', 'prePrimaryTotal', 'noOfTeacherMale', 'No of Teachers in Pre-Primary School (Male)')">Male</li>
              <li class="pointer"
                  onclick="displayEduGraph('education', 'prePrimaryTotal', 'noOfTeacherFemale', 'No of Teachers in Pre-Primary School (Female)')">Female</li>
          </ul>
      </li>


    </ul>