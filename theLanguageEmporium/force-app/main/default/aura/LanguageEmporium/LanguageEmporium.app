<aura:application extends="force:slds">
    <aura:attribute name="Home" type="boolean" default="True" />
    <aura:attribute name="LearnerPortal" type="boolean" default="False"/>
    <aura:attribute name="Shop" type="boolean" default="False"/>
    <aura:attribute name="Careers" type="boolean" default="False"/>

    <aura:handler name="navEvent" event="c:navBarEvent" action="{!c.navigate}"/> 

    <c:NavbarComponent/>

    <aura:renderIf isTrue="{!v.Home}">
        <h1>renderIf we had a home page it would go here</h1>
    </aura:renderIf>

    <aura:renderIf isTrue="{!v.LearnerPortal}">
        <c:ContactComponent/>
    </aura:renderIf>

    <aura:renderIf isTrue="{!v.Shop}">
        <c:StoreMainComponent/>
    </aura:renderIf>

    <aura:renderIf isTrue="{!v.Careers}">
        Dom's page would be here
    </aura:renderIf>
</aura:application>