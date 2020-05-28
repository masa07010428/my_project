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
var markerData = [
  {
    name: "小田原消防署",
    lat: 35.2790287,
    lng: 139.1888153,
  },
  {
    name: "国府津出張所",
    lat: 35.280905,
    lng: 139.2045593,
  },
];
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
      for (var i = 0; i < markerData.length; i++) {
        markerLatLng = new google.maps.LatLng({
          lat: markerData[i]["lat"],
          lng: markerData[i]["lng"],
        });
        marker[i] = new google.maps.Marker({
          position: markerLatLng,
          map: map,
          icon: "/assets/syouta.png",
        });
        infoWindow[i] = new google.maps.InfoWindow({
          content: markerData[i]["name"],
          pixelOffset: new google.maps.Size(0, 10),
        });
        markerEvent(i);
      }
    } else {
      alert("Mapの読み込みに失敗しました。住所の表記を確認してください");
      return;
    }
  });
}
function markerEvent(i) {
  marker[i].addListener("click", function () {
    infoWindow[i].open(map, marker[i]);
  });
}
