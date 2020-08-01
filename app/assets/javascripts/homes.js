// modal部分
$(function () {
  var winScrollTop;
  $(".js-modal-open").each(function () {
    $(this).on("click", function () {
      winScrollTop = $(window).scrollTop();
      var target = $(this).data("target");
      var modal = document.getElementById(target);
      $(modal).fadeIn();
      return false;
    });
  });
  $(".js-modal-close").on("click", function () {
    $(".js-modal").fadeOut();
    $("body,html").stop().animate({ scrollTop: winScrollTop }, 100);
    return false;
  });
});

// slide in
$(function () {
  var slideIn = {
    delay: 500,
    distance: "200px",
    origin: "bottom",
  };
  ScrollReveal().reveal(".scroll-reveal", slideIn);
});

$(function () {
  $(".btn-gnavi").on("click", function () {
    var rightVal = 0;
    if ($(this).hasClass("open")) {
      rightVal = -300;
      $(this).removeClass("open");
    } else {
      $(this).addClass("open");
    }
    $("#global-navi").stop().animate(
      {
        right: rightVal,
      },
      200
    );
  });
});
