$(document).ready(function () {
  // Trusted Brands Slider
  var trustedSlider = new Swiper(".trusted_brands_slider", {
    slidesPerView: 2,
    spaceBetween: 20,
    loop: true,
    autoplay: {
      delay: 2500,
      disableOnInteraction: false,
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    breakpoints: {
      576: {
        slidesPerView: 3,
        spaceBetween: 30,
      },
      768: {
        slidesPerView: 4,
        spaceBetween: 40,
      },
      992: {
        slidesPerView: 4,
        spaceBetween: 50,
      },
      1200: {
        slidesPerView: 5,
        spaceBetween: 60,
      },
    },
  });


  // Toggle Comparison Table
  $("#toggleComparison").click(function () {
    $("#comparisonTable").slideToggle();
    $(this).toggleClass("active");
  });

  // Monthly / Yearly Switch
  $("#pricing-toggle").change(function () {
    if ($(this).is(":checked")) {
      // Yearly
      $("#yearly-label").addClass("active");
      $("#monthly-label").removeClass("active");

      $(".pricing_card").addClass("show-yearly-badge"); 
      $(".period").text("/ month");

    } else {
      // Monthly
      $("#monthly-label").addClass("active");
      $("#yearly-label").removeClass("active");

      $(".pricing_card").removeClass("show-yearly-badge"); 
    }
  });
  // Blogs Slider
  var blogsSlider = new Swiper(".blogs_slider", {
    slidesPerView: 1,
    spaceBetween: 20,
    loop: true,
    autoplay: {
      delay: 3000,
      disableOnInteraction: false,
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    breakpoints: {
      0: {
        slidesPerView: 1.1,
        spaceBetween: 20,
      },
      768: {
        slidesPerView: 2,
        spaceBetween: 30,
      },
      992: {
        slidesPerView: 3,
        spaceBetween: 30,
      },
    },
  });

  // Testimonial Slider
  var testimonialSlider = new Swiper(".testimonial_slider", {
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,
    navigation: {
      nextEl: ".testimonial-next",
      prevEl: ".testimonial-prev",
    },
  });


  // Sticky Header
  $(window).scroll(function () {
    if ($(this).scrollTop() > 50) {
      $(".main_header").addClass("fixed_header");
    } else {
      $(".main_header").removeClass("fixed_header");
    }
  });
});
