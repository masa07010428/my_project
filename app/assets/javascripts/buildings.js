// 階情報入力部分の削除ボタンを隠す（form１つの場合）
$(document).on("turbolinks:load", function () {
  if ($(".nested-fields").length == 1) {
    $(".remove_fields").hide();
  }
});

// Google map
var map;
var marker = [];
var infoWindow = [];
function initMap() {
  var target = document.getElementById("gmap");
  var address = document.getElementById("address").textContent;
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode({ address: address }, function (results, status) {
    if (status === "OK" && results[0]) {
      map = new google.maps.Map(target, {
        center: results[0].geometry.location,
        zoom: 14,
      });
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
        content: address,
        pixelOffset: new google.maps.Size(0, 5),
      });
      marker.addListener("click", function () {
        infoWindow.open(map, marker);
      });
      service = new google.maps.places.PlacesService(map);
      service.nearbySearch(
        {
          location: results[0].geometry.location,
          radius: 2000,
          name: "消防署",
        },
        function (results) {
          for (var i = 0; i < results.length; i++) {
            new google.maps.Marker({
              map: map,
              position: results[i].geometry.location,
              title: results[i].name,
              icon: "/assets/syouta.png",
            });
          }
        }
      );
    } else {
      alert("Mapの読み込みに失敗しました。住所の表記を確認してください");
      return;
    }
  });
}
