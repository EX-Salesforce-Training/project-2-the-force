<aura:application extends="force:slds">
    
    <aura:handler name="navEvent" event="c:navBarEvent" action="{!c.navigate}"/> 

    <!-- Persistent navbar that handles hidden class -->
    <c:NavbarComponent/>

    <div aura:id="Home">
        <h1>renderIf we had a home page it would go here</h1>
    </div>

    <div aura:id="Account" class="toggle-hide">
        <c:ContactComponent/>
        <c:CoursesEnrolled/>
    </div>

    <div aura:id="Shop" class="toggle-hide">
        <c:StoreMainComponent/>
    </div>

    <div aura:id="Careers" class="toggle-hide">
        Dom's page would be here
    </div>

</aura:application>