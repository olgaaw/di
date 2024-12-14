$(document).ready(function () {
    $(document).on("click", ".bi-brightness-high-fill", function () {
        $(".texto").addClass("modo-noche");
        $("*").css("background-color", "black");
        $(".bi-brightness-high-fill").addClass(".bi bi-moon-stars");
        $(".bi-brightness-high-fill").removeClass(".bi bi-brightness-high-fill");
        
      });

      $(document).on("click", ".bi bi-moon-stars", function () {
        $(".texto").addClass("modo-dia");
        $("*").css("background-color", "white");
        $(".bi bi-moon-stars").addClass(".bi bi-brightness-high-fill")
        $(".bi bi-moon-stars").removeClass(".bi bi-moon-stars")
        
      });


      


});