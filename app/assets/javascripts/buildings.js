// 階情報入力部分の削除ボタンを隠す（form１つの場合）
$(document).on("turbolinks:load", function () {
  if ($(".nested-fields").length == 1) {
    $(".remove_fields").hide();
  }
});

// 3項選択時、form変更
function formChange() {
  const category = document.getElementById("building_entirety_usege_id").value;
  document.getElementById(
    "usageInfo"
  ).innerHTML = `<p>※あなたが選択した用途は、『${category}』に該当します。収容人員算定の際に必要です。</p>`;
  if (category === "7" || category === "8") {
    document.getElementById("fireUse").style.display = "inline";
  } else {
    document.getElementById("fireUse").style.display = "none";
  }
}
window.onload = formChange;

// Google map
function initMap() {
  var target = document.getElementById("gmap");
  var address = document.getElementById("address").textContent;
  var building_name = document.getElementById("name").textContent;
  var geocoder = new google.maps.Geocoder();
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
    var centerMarker = new google.maps.Marker({
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
    var centerInfowindow = new google.maps.InfoWindow({
      content: `名称：${building_name}<br>
      住所：${address}`,
    });
    centerMarker.addListener("mouseover", function () {
      centerInfowindow.open(map, centerMarker);
    });
    centerMarker.addListener("mouseout", function () {
      centerInfowindow.close(map, centerMarker);
    });

    var service = new google.maps.places.PlacesService(map);
    service.nearbySearch(
      {
        location: results[0].geometry.location,
        radius: 2000,
        keyword: "syoubousyo",
      },
      function (results, status) {
        if (status === google.maps.places.PlacesServiceStatus.OK) {
          for (var i = 0; i < results.length; i++) {
            request = {
              placeId: results[i].place_id,
              fields: [
                "name",
                "vicinity",
                "formatted_phone_number",
                "geometry",
                "website",
              ],
            };
            service.getDetails(request, function (place) {
              console.log(place);
              var placeMarker = new google.maps.Marker({
                map: map,
                position: place.geometry.location,
                icon: "/assets/syouta.png",
              });
              var placeInfowindow = new google.maps.InfoWindow({
                content: `名称：${place.name}<br>
                住所：${place.vicinity}<br>
                Tel：${place.formatted_phone_number}<br>
                Web：<a href= "${place.website}" target= "_blank">Link</a>`,
              });
              markerEvent(map, placeMarker, placeInfowindow);
            });
          }
        } else {
          alert("周辺情報の読み込みに失敗しました。");
          return;
        }
        var currentInfoWindow;
        function markerEvent(map, placeMarker, placeInfowindow) {
          placeMarker.addListener("click", function () {
            if (currentInfoWindow) {
              currentInfoWindow.close();
            }
            placeInfowindow.open(map, placeMarker);
            currentInfoWindow = placeInfowindow;
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
