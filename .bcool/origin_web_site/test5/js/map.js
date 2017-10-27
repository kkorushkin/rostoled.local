var map;
function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 11,
        center: { lat: 50.465034, lng: 30.549090 },
        zoomControl: true,
        scrollwheel: false,
        mapTypeControlOptions: {
            mapTypeIds: [google.maps.MapTypeId.ROADMAP]
        }
    });

    var iconBase = 'img/';

    var church = new google.maps.Marker({
        position: {lat: 50.5216626, lng: 30.6150729},
        map: map,
        icon: iconBase + 'logo-map.png'
    });
	
	var center = new google.maps.Marker({
        position: {lat: 50.414116, lng:  30.521584},
        map: map,
        icon: iconBase + 'logo-map.png'
    });


	var infowindow = new google.maps.InfoWindow({
        content: 'prostoled.com.ua'
    });
    infowindow.open(map, center);
    center.addListener('click', function() {
        infowindow.open(map, center);
    });
}