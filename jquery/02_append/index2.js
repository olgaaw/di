$(document).ready(function () {
    $(document).on("click", "#btn-add-paragraph", function () {
      $("#content").append("<p>Lorem ipsum</p>");
    });

    $(document).on("click", "#btn-delete-paragraph", function () {
        $("p").remove("p:last-child");
      });

  });