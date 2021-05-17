<aura:application extends="force:slds">
    <c:ContactComponent></c:ContactComponent>
    
    <aura:attribute name="Enrolled" type="boolean" default="true"/>
    <aura:if isTrue="{!v.Enrolled}">
   <c:CoursesEnrolled></c:CoursesEnrolled>
    </aura:if>
  <!--   <c:RecommendedCourses></c:RecommendedCourses> -->
</aura:application>