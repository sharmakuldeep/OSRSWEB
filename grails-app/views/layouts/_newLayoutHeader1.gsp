<header>
    <div style="height: 100px">
        <div class="top-left">
            <img src="${resource(dir: 'images', file: 'statistics-header.png')}" alt="">
        </div>
        <sec:ifLoggedIn>
            <div class="top-right">
                <p class="welcome" align="right">
                    Welcome <span class="welcomename"><sec:username/>|</span
                    <span class="logout"><g:link controller="logout" class="alink">Logout</g:link></span> <br><br>
                    <span>
                        <g:link action="index" controller="userProfile" class="alink" params="[userId:sec.loggedInUserInfo(field:'id')]">Profile</g:link>
                    </span>
                    <span>
                       %{-- <g:if role="ROLE_ADMIN">--}%
                       %{--this is the tag where the admin link has to activate or deactivate--}%
                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                            <g:link controller="admin" class="alink" >Admin</g:link>
                        </sec:ifAnyGranted>
                       %{-- </g:if>--}%
                    </span>
                </p>
            </div>
        </sec:ifLoggedIn>
    </div>

    <div style="height: 36px;color: #ffffff;text-transform: uppercase;font-weight: bold;font-size: 20px" align="center">
        Multi-Tenant Information Management System
    </div>
    <nav id="smoothmenu1" class="ddsmoothmenu">
        <ul>
            <li><g:link controller="home" action="index" class="homeTab">Home</g:link></li>

            <sec:ifAnyGranted roles="ROLE_DATA_ENTRY_OPERATOR">
            <li>
                <g:link action="index" controller="dataCollection" class="dataCollectionTab">Data Collection</g:link>
            </li>
             </sec:ifAnyGranted>

            <sec:ifAnyGranted roles="ROLE_STATE_ADMIN">
                <li>
                    <g:link action="main" controller="dataCorrection" class="dataCorrectionTab">Data Correction</g:link>
                </li>
            </sec:ifAnyGranted>

           <li><a href="#" class="reportTab">Reports</a>
                            <ul>
                                <li><g:link controller="report"
                                            action="report">Report</g:link></li>
                                <li><g:link controller="report"
                                            action="map">Graphical Report</g:link></li>
                                %{--<li><g:link controller="report"--}%
                                            %{--action="stat">Statistical Analysis </g:link></li>--}%
                            </ul>
           </li>

            <li><a href="#" class="reportTab">Data Transfer</a>
                <ul>
                    <li><g:link controller="jasperReport"
                                action="stateReport">State</g:link></li>
                    <li><g:link controller="jasperReport"
                                action="districtReport">District</g:link></li>
                    <li><g:link controller="jasperReport"
                                action="blockReport">Block</g:link></li>
                    %{--<li><g:link controller="report"--}%
                    %{--action="stat">Statistical Analysis </g:link></li>--}%
                </ul>
            </li>

           %{--<li><a href="#" class="reportTab">Analytics</a>
                            <ul>
                                <li><g:link controller="analytics"
                                            action="performanceGraphIndex">Performance Report</g:link></li>
                                <li><g:link controller="analytics"
                                            action="index">Comparative Report</g:link></li>

                            </ul>
           </li>--}%


            <li><a href="#">File Sharing</a>
                <ul>
                    <li><g:link controller="fileAssets"
                                action="create">Upload File</g:link></li>
                    <li><g:link controller="fileAssets"  action="viewUploadedFiles">
                        <a href="#">Show Files</a>
                        <ul>
                            <li><g:link controller="fileAssets"  action="viewPublicFiles">
                                Public</g:link>
                            </li>
                            <li><g:link controller="fileAssets"  action="viewPrivateFiles">
                                Private</g:link></li>
                            <li><g:link controller="fileAssets"  action="viewShareFiles">Share</g:link></li>
                        </ul>
                        </g:link>
                    </li>
                    %{--<li><g:link controller="fileAssets"--}%
                                %{--action="export">Data Export</g:link></li>--}%
                </ul>
            </li>

            <li><a href="#">More</a>
                <ul>
                    <li><g:link controller="jobSchedule"
                                action="schedule">Help</g:link></li>
                    <li><g:link controller="jobSchedule"  action="schedule">
                        <a href="#">Back-Up</a>
                        <ul>
                            <li onclick="alert('Database backup will be taken on daily basis')"><g:link controller="jobSchedule"  action="schedule" params="[value:1]">
                                Daily</g:link>
                            </li>
                            %{--<li><g:link controller="jobSchedule"  action="schedule" params="[value:2]">--}%
                                %{--Weekly</g:link></li>--}%

                        </ul>
                    </g:link>
                    </li>
                    %{--<li><g:link controller="fileAssets"--}%
                    %{--action="export">Data Export</g:link></li>--}%
                </ul>
            </li>
            %{--<g:form name="form" method="POST" style="display:none" controller="statsAnalysis"
                    action="helpMannualDownload">
                <g:submitButton name="submitHelpButton" value="Submit"/>
            </g:form>--}%

        </ul>

    </nav>
    <script type="text/javascript">
        var menu = new menu.dd("menu");
        menu.init("menu", "menuhover");
    </script>

    <script type="text/javascript">
        function download() {
            $('[name="submitHelpButton"]').click();
        }

        function jasperReport() {
            $('.jasperButton').click();
        }

    </script>
</header>

