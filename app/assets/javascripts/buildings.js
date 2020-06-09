// 階情報入力部分の削除ボタンを隠す（form１つの場合）
$(document).on("turbolinks:load", function () {
  if ($(".nested-fields").length == 1) {
    $(".remove_fields").hide();
  }
});

// Google map
function initMap() {
  var target = document.getElementById("gmap");
  var address = document.getElementById("address").textContent;
  var building_name = document.getElementById("name").textContent;
  var geocoder = new google.maps.Geocoder();
  var marker;
  var infoWindow;
  var service;
  geocoder.geocode({ address: address }, function (results, status) {
    if (status !== "OK") {
      alert("Mapの読み込みに失敗しました。住所の表記を確認してください");
      return;
    }
    if (results[0]) {
      map = new google.maps.Map(target, {
        center: results[0].geometry.location,
        zoom: 14,
        clickableIcons: false,
      });
    } else {
      alert("No results found");
      return;
    }
    marker = new google.maps.Marker({
      position: map.getCenter(),
      map: map,
      animation: google.maps.Animation.DROP,
      label: {
        text: "Here!",
        color: "blue",
        fontSize: "18px",
        fontWeight: "bold",
      },
    });
    infoWindow = new google.maps.InfoWindow({
      content: "<li>" + building_name + "</li>" + "<li>" + address + "</li>",
    });
    marker.addListener("mouseover", function () {
      infoWindow.open(map, marker);
    });
    marker.addListener("mouseout", function () {
      infoWindow.close(map, marker);
    });
    service = new google.maps.places.PlacesService(map);
    service.nearbySearch(
      {
        location: results[0].geometry.location,
        radius: 2000,
        keyword: "syoubousyo",
      },
      function (results, status) {
        if (status === google.maps.places.PlacesServiceStatus.OK) {
          for (var i = 0; i < results.length; i++) {
            marker[i] = new google.maps.Marker({
              map: map,
              position: results[i].geometry.location,
              icon: "/assets/syouta.png",
            });
            infoWindow[i] = new google.maps.InfoWindow({
              content:
                "<li>" +
                results[i].name +
                "</li>" +
                "<li>" +
                results[i].vicinity +
                "</li>",
            });
            markerEvent(i);
          }
        } else {
          alert("Mapの読み込みに失敗しました。住所の表記を確認してください");
          return;
        }
        function markerEvent(i) {
          marker[i].addListener("click", function () {
            infoWindow[i].open(map, marker[i]);
          });
        }
      }
    );
  });
}

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
