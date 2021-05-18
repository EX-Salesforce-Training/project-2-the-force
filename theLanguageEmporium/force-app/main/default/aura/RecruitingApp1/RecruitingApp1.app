<aura:application extends="force:slds">
    <div class="slds-grid slds-gutters">
        <div class="slds-col slds-size_2-of-12">
            <span>
                <aura:if isTrue="true">
                    <c:RecruitingAppNavbar/>
                </aura:if>
            </span>
        </div>
        <div class="slds-col slds-size_6-of-12">
            <span>
                <aura:if isTrue="true">
                    <c:RecruitingAppPositions/>
                </aura:if>
            </span>
        </div>
    </div>
    <div class="slds-col slds-size_6-of-12">
        <span>
            <aura:if isTrue="true">
                <c:RecruitingAppCandidateInput/>
            </aura:if>
        </span>
    </div>
        <div class="slds-col slds-size_6-of-12">
        <span>
            <aura:if isTrue="true">
                <c:RecruitingAppEducationInput/>
            </aura:if>
        </span>
    </div>
        <div class="slds-col slds-size_6-of-12">
        <span>
            <aura:if isTrue="true">
                <c:RecruitingAppExperienceInput/>
            </aura:if>
        </span>
    </div>
    <div class="slds-grid_align-spread">
        <div class="slds-col slds-size_4-of-12">
            <span>            
                <aura:if isTrue="true">
                    <c:RecruitingAppAdditionalQuestions/>
                </aura:if>
            </span>
        </div>
        <div class="slds-col slds-size_4-of-12">
            <span>            
                <aura:if isTrue="true">
                    <c:RecruitingAppDemographic/>
                </aura:if>
            </span>
        </div>
    </div>
</aura:application>