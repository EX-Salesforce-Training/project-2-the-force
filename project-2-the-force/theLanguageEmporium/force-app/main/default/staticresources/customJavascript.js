window.onload = function(){

   const navButton = document.querySelector('#navButton');
   const sideBar = document.querySelector('#sideBar');

   navButton.addEventListener('click', function(e){
        sideBar.classList.toggle('show');
   })
    
}