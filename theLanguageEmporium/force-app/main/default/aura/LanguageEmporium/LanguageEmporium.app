<aura:application extends="force:slds">
    <aura:attribute name="Home" type="boolean" default="False" />
    <aura:attribute name="LearnerPortal" type="boolean" default="True"/>
    <aura:attribute name="Shop" type="boolean" default="False"/>
    <aura:attribute name="Careers" type="boolean" default="False"/>

    <c:NavbarComponent/>

    <aura:if isTrue="{!v.Home}">
        <h1>If we had a home page it would go here</h1>
    </aura:if>

    <aura:if isTrue="{!v.LearnerPortal}">
        <c:ContactComponent/>
    </aura:if>

    <aura:if isTrue="{!v.Shop}">
        Abdulloh's Page would be here
    </aura:if>

    <aura:if isTrue="{!v.Careers}">
        Dom's page would be here
    </aura:if>
</aura:application>