<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/22/12
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>
<div>
    <ul>
        <li style="float: left;width: 45%">
            Community Health Centres
            <ul>
                <li class="pointer" onclick="displayHealthGraph('health', 'commHealthCenter', 'noOfDoctors', 'Doctors (No.)');">Doctors (No.)</li>
                <li class="pointer" onclick="displayHealthGraph('health', 'commHealthCenter', 'noOfNurses', 'Nurses (No.)');">Nurses (No.)</li>
                <li class="pointer" onclick="displayHealthGraph('health', 'commHealthCenter', 'noOfBeds', 'Beds (No.)');">Beds (No.)</li>
                <li class="pointer" onclick="displayHealthGraph('health', 'commHealthCenter', 'noOfMaleCasesTreated', 'Cases Treated-Male (No.)');">Cases Treated-Male (No.)</li>
                <li class="pointer" onclick="displayHealthGraph('health', 'commHealthCenter', 'noOfFemaleCasesTreated', 'Cases Treated-Female (No.)');">Cases Treated-Female (No.)</li>
            </ul>
        </li>
        <li style="float: right;width: 45%">
            Family Welfare Centres
            <ul>
                <li class="pointer" onclick="displayHealthGraph('health', 'familyWelCenter', 'noOfDoctors', 'Doctors (No.)');">Doctors (No.)</li>
                <li class="pointer" onclick="displayHealthGraph('health', 'familyWelCenter', 'noOfNurses', 'Nurses (No.)');">Nurses (No.)</li>
                <li class="pointer" onclick="displayHealthGraph('health', 'familyWelCenter', 'noOfBeds', 'Beds (No.)');">Beds (No.)</li>
                <li class="pointer" onclick="displayHealthGraph('health', 'familyWelCenter', 'noOfMaleCasesTreated', 'Cases Treated-Male (No.)');">Cases Treated-Male (No.)</li>
                <li class="pointer" onclick="displayHealthGraph('health', 'familyWelCenter', 'noOfFemaleCasesTreated', 'Cases Treated-Female (No.)');">Cases Treated-Female (No.)</li>
            </ul>
        </li>
        <li style="float: left;width: 45%">
            Ayurvedic Centres
            <ul>
                <li class="pointer" onclick="displayHealthGraph('health', 'ayurCenter', 'noOfDoctors', 'Doctors (No.)');">Doctors (No.)</li>
                <li class="pointer" onclick="displayHealthGraph('health', 'ayurCenter', 'noOfMaleCasesTreated', 'Cases Treated-Male (No.)');">Cases Treated-Male (No.)</li>
                <li class="pointer" onclick="displayHealthGraph('health', 'ayurCenter', 'noOfFemaleCasesTreated', 'Cases Treated-Female (No.)');">Cases Treated-Female (No.)</li>
            </ul>
        </li>
        <li style="float: right;width: 45%">
            Homeopathic Cells
            <ul>
                <li class="pointer" onclick="displayHealthGraph('health', 'homeoCells', 'noOfDoctors', 'Doctors (No.)');">Doctors (No.)</li>
                <li class="pointer" onclick="displayHealthGraph('health', 'homeoCells', 'noOfMaleCasesTreated', 'Cases Treated-Male (No.)');">Cases Treated-Male (No.)</li>
                <li class="pointer" onclick="displayHealthGraph('health', 'homeoCells', 'noOfFemaleCasesTreated', 'Cases Treated-Female (No.)');">Cases Treated-Female (No.)</li>
            </ul>
        </li>
        <li style="float: left;width: 45%">
            Other Centers
            <ul>
                <li class="pointer" onclick="displayHealthGraph('health', '', 'health39', 'Other Center-Beds for Women (No.)');">Beds for Women (No.)</li>
                <li class="pointer" onclick="displayHealthGraph('health', '', 'health40', 'Other Center-ASHA Workers (No.)');">ASHA Workers (No.)</li>
            </ul>
        </li>
    </ul>
</div>






