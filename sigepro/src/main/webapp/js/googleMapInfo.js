var map;
//var map2;
function initialize(callback)
{
	var mapProp = {
	  center:new google.maps.LatLng(-34.921267,-57.954254),
	  zoom:11,
	  mapTypeId:google.maps.MapTypeId.ROADMAP
// 	  mapTypeId:google.maps.MapTypeId.HYBRID
	  };
  
	map=new google.maps.Map(document.getElementById("map_canvas")
	  ,mapProp);

	callBackFunMapG.call();
}//end function

var locationInfoWMessage ="";
var locationMarker;
var infowindow;
function createLocationRequest(addressParam){
	var geocoder = new google.maps.Geocoder();

	var request = {
		 address: addressParam
// 		 latLng: new google.maps.LatLng(-34.921267,-57.954254)
// 		 bounds: "",
// 		 region: ""
		};
	
	if (locationMarker==undefined){ 
		locationMarker= new google.maps.Marker();
		locationMarker.setDraggable(true);
		locationMarker.setAnimation(google.maps.Animation.BOUNCE);
    	google.maps.event.addListener(locationMarker,'click',function() {
    		locationMarker.setAnimation(null);
        });
	}	
	
	if (infowindow==undefined){
 	     infowindow = new google.maps.InfoWindow({
		  content:locationInfoWMessage
		  });
	}
  	
	geocoder.geocode( request, function(results, status) {
	      if (status == google.maps.GeocoderStatus.OK) {
	        map.setCenter(results[0].geometry.location);
			locationMarker.setMap(map);
			locationMarker.setPosition(results[0].geometry.location);
//	        locationMarker = new google.maps.Marker({
//	            map: map,
//	            animation:google.maps.Animation.BOUNCE,
//	            position: results[0].geometry.location,
//	            draggable: true
//	        });
			locationMarker.setAnimation(google.maps.Animation.BOUNCE);
	    	infowindow.open(map,locationMarker);
	        map.setZoom(15);
	      } else {
	    	  alert("No se encontraron ubicaciones con la direcci�n escrita");
	      }
	    });

}

function returnMarkerPosition(){
	if (locationMarker!=undefined)
	return 	 locationMarker.getPosition();
}

var callBackFunMapG;
function loadGMScript(callback) {
      if (typeof(google) == 'undefined') {
       callBackFunMapG = callback;
	  var keyGM= "AIzaSyAB6F84C_7UQqC44x7eCaI9rGkO1lxwEEM";
	  var script = document.createElement("script");
	  script.type = "text/javascript";
	  script.src = "http://maps.googleapis.com/maps/api/js?key="+keyGM+"&sensor=false&callback=initialize";
	  document.body.appendChild(script);
      }
      else{
    	  callback.call();
      }
}