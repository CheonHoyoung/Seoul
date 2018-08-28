<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>여러개 마커에 이벤트 등록하기1</title>
<style type="text/css">
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}


#mapwrap{position:relative;overflow:hidden;}
.category, .category *{margin:0;padding:0;color:#000;}   
.category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
.category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;} 
.category .ico_coffee {background-position:-10px 0;}  
.category .ico_store {background-position:-10px -36px;}   
.category .ico_carpark {background-position:-10px -72px;} 
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=de1ab844d09df5b60401c95e4c9561e4&libraries=clusterer"></script>
<script type="text/javascript" src="resources/jquery-3.3.1.min.js"></script>
<script>
var positions;
$(function(){
	$('#sss').on('click', function(){
		   
		   $.ajax({        
		            url: 'sss',
		            type: 'get',
		            dataType: 'json',
		            success: function(data){
		               /* console.log(data); */
		                var myItem = data.spotList;
		                var output = '';
		               
		                for(var i=0; i<myItem.length; i++){
		                    /* console.log(myItem.length); */
		                    output += '<h4>'+ '장소 : ' +myItem[i].LAT+'</h4>';
		                    output += '<h4>'+ '장소 : ' +myItem[i].LON+'</h4>';
		                    output += '<hr />';
		                    carparkPositions.push(new daum.maps.LatLng(myItem[i].LAT, myItem[i].LON));
		                   /*  document.div.innerHTML += output; */
		                   createCarparkMarkers();
		                }
		                 $('#content').html(output);
		                 
		            },
		          error: function(XMLHttpRequest, textStatus, errorThrown) { 
		              alert("Status: " + textStatus); alert("Error: " + errorThrown); 
		          } 
		   });
		})
	
	
	// 마커 클러스터러를 생성합니다 
    var clusterer = new daum.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10 // 클러스터 할 최소 지도 레벨 
    });
 

var positions = [  // 마커의 위치
        new daum.maps.LatLng(33.44975, 126.56967),
        new daum.maps.LatLng(33.450579, 126.56956),
        new daum.maps.LatLng(33.4506468, 126.5707)
    ],
    selectedMarker = null; // 클릭한 마커를 담을 변수


// MakrerImage 객체를 생성하여 반환하는 함수입니다
function createMarkerImage(markerSize, offset, spriteOrigin) {
    var markerImage = new daum.maps.MarkerImage(
        SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
        markerSize, // 마커의 크기
        {
            offset: offset, // 마커 이미지에서의 기준 좌표
            spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
            spriteSize: spriteImageSize // 스프라이트 이미지의 크기
        }
    );
    
    return markerImage;
}
})

</script>

</head>
<body>
	<div id="mapwrap"> 
    <!-- 지도가 표시될 div -->
    <div id="map" style="width:100%;height:350px;"></div>
    <!-- 지도 위에 표시될 마커 카테고리 -->
    <div class="category">
        <ul>
            <li id="coffeeMenu" onclick="changeMarker('coffee')">
                <span class="ico_comm ico_coffee"></span>
                커피숍
            </li>
            <li id="storeMenu" onclick="changeMarker('store')">
                <span class="ico_comm ico_store"></span>
                편의점
            </li>
            <li id="carparkMenu" onclick="changeMarker('carpark')">
                <span class="ico_comm ico_carpark"></span>
                주차장
            </li>
        </ul>
    </div>
</div>

	<script>
	// 주차장 마커가 표시될 좌표 배열입니다
	var carparkPositions = new Array();
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		positions = [ {
			content : '<div>카카오</div>',
			latlng : new daum.maps.LatLng(33.451705, 126.570677)
		}, {
			content : '<div>생태연못</div>',
			latlng : new daum.maps.LatLng(33.451936, 126.569477)
		}, {
			content : '<div>텃밭</div>',
			latlng : new daum.maps.LatLng(33.451879, 126.569940)
		}, {
			content : '<div>근린공원</div>',
			latlng : new daum.maps.LatLng(33.452393, 126.570738)
		}, {
			content : '<div>1</div>',
			latlng : new daum.maps.LatLng(33.450725, 126.571677)
		}, {
			content : '<div>2</div>',
			latlng : new daum.maps.LatLng(33.451936, 126.569877)
		}, {
			content : '<div>3</div>',
			latlng : new daum.maps.LatLng(33.452849, 126.560940)
		}, {
			content : '<div>4</div>',
			latlng : new daum.maps.LatLng(33.451303, 126.570738)
		}, {	
			content : '<div>5</div>',
			latlng : new daum.maps.LatLng(33.455745, 126.570677)
		}, {
			content : '<div>6</div>',
			latlng : new daum.maps.LatLng(33.451986, 126.569477)
		}, {
			content : '<div>7</div>',
			latlng : new daum.maps.LatLng(33.451979, 126.569040)
		}, {
			content : '<div>8</div>',
			latlng : new daum.maps.LatLng(33.451193, 126.570438)
		} 
		];
		var overlay= new Array();
		for (var i = 0; i < positions.length; i++) {

			var content = '<div class="wrap">'
					+ '    <div class="info">'
					+ '        <div class="title">'
					+ '            카카오 스페이스닷원'
					+ '            <div class="close" onclick="closeOverlay('+i+')" title="닫기"></div>'
					+ '        </div>'
					+ '        <div class="body">'
					+ '            <div class="img">'
					+ '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">'
					+ '           </div>'
					+ '            <div class="desc">'
					+ '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>'
					+ '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>'
					+ '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>'
					+ '            </div>' + '        </div>' + '    </div>'
					+ '</div>';
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng
			// 마커의 위치
			});

			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new daum.maps.InfoWindow({
				content : positions[i].content
			// 인포윈도우에 표시할 내용
			});

			overlay.push(new daum.maps.CustomOverlay({
				content : content,
				map : map,
				position : positions[i].latlng
			}))
			overlay[i].setMap(null);
			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map,
					marker, infowindow));
			daum.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));
			daum.maps.event.addListener(marker, 'click', makeOpenListener(map,
					marker, overlay, i));
		}

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}

		//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		function makeOpenListener(map, marker, overlay, i) {
			return function() {
				overlay[i].setMap(map, marker);
			};
		}
		
		function closeOverlay(i) {
			overlay[i].setMap(null);
		}
		
		// 커피숍 마커가 표시될 좌표 배열입니다
		var coffeePositions = [ 
		    new daum.maps.LatLng(37.499590490909185, 127.0263723554437),
		    new daum.maps.LatLng(37.499427948430814, 127.02794423197847),
		    new daum.maps.LatLng(37.498553760499505, 127.02882598822454),
		    new daum.maps.LatLng(37.497625593121384, 127.02935713582038),
		    new daum.maps.LatLng(37.49646391248451, 127.02675574250912),
		    new daum.maps.LatLng(37.49629291770947, 127.02587362608637),
		    new daum.maps.LatLng(37.49754540521486, 127.02546694890695)                
		];

		// 편의점 마커가 표시될 좌표 배열입니다
		var storePositions = [
		    new daum.maps.LatLng(37.497535461505684, 127.02948149502778),
		    new daum.maps.LatLng(37.49671536281186, 127.03020491448352),
		    new daum.maps.LatLng(37.496201943633714, 127.02959405469642),
		    new daum.maps.LatLng(37.49640072567703, 127.02726459882308),
		    new daum.maps.LatLng(37.49640098874988, 127.02609983175294),
		    new daum.maps.LatLng(37.49932849491523, 127.02935780247945),
		    new daum.maps.LatLng(37.49996818951873, 127.02943721562295)
		];

		 

		var markerImageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
		    coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
		    storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
		    carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다
		var bounds;
		    
		createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
		createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
		createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

		changeMarker('coffee'); // 지도에 커피숍 마커가 보이도록 설정합니다    


		// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
		function createMarkerImage(src, size, options) {
		    var markerImage = new daum.maps.MarkerImage(src, size, options);
		    return markerImage;            
		}

		// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
		function createMarker(position, image) {
		    var marker = new daum.maps.Marker({
		        position: position,
		        image: image
		    });
		    
		    return marker;  
		    clusterer.addMarkers(markers);
		}   
		   
		// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
		function createCoffeeMarkers() {
		    
		    for (var i = 0; i < coffeePositions.length; i++) {  
		        
		        var imageSize = new daum.maps.Size(22, 26),
		            imageOptions = {  
		                spriteOrigin: new daum.maps.Point(10, 0),    
		                spriteSize: new daum.maps.Size(36, 98)  
		            };     
		        
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(coffeePositions[i], markerImage);  
		        
		        // 생성된 마커를 커피숍 마커 배열에 추가합니다
		        coffeeMarkers.push(marker);
		    }     
		}

		// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setCoffeeMarkers(map) {        
		    for (var i = 0; i < coffeeMarkers.length; i++) {  
		        coffeeMarkers[i].setMap(map);
		    }        
		}

		// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
		function createStoreMarkers() {
		    for (var i = 0; i < storePositions.length; i++) {
		        
		        var imageSize = new daum.maps.Size(22, 26),
		            imageOptions = {   
		                spriteOrigin: new daum.maps.Point(10, 36),    
		                spriteSize: new daum.maps.Size(36, 98)  
		            };       
		     
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(storePositions[i], markerImage);  

		        // 생성된 마커를 편의점 마커 배열에 추가합니다
		        storeMarkers.push(marker);    
		    }        
		}

		// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setStoreMarkers(map) {        
		    for (var i = 0; i < storeMarkers.length; i++) {  
		        storeMarkers[i].setMap(map);
		    }        
		}

		// 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
		function createCarparkMarkers() {
		    for (var i = 0; i < carparkPositions.length; i++) {
		        
		        var imageSize = new daum.maps.Size(22, 26),
		            imageOptions = {   
		                spriteOrigin: new daum.maps.Point(10, 72),    
		                spriteSize: new daum.maps.Size(36, 98)  
		            };       
		     
		        // 마커이미지와 마커를 생성합니다
		        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
		            marker = createMarker(carparkPositions[i], markerImage);  

		        // 생성된 마커를 주차장 마커 배열에 추가합니다
		        carparkMarkers.push(marker); 
		    }                
		}

		// 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setCarparkMarkers(map) {        
		    for (var i = 0; i < carparkMarkers.length; i++) {  
		        carparkMarkers[i].setMap(map);
		    }        
		}

		// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
		function changeMarker(type){
			bounds = new daum.maps.LatLngBounds();
		    var coffeeMenu = document.getElementById('coffeeMenu');
		    var storeMenu = document.getElementById('storeMenu');
		    var carparkMenu = document.getElementById('carparkMenu');
		    
		    // 커피숍 카테고리가 클릭됐을 때
		    if (type === 'coffee') {
		    
		        // 커피숍 카테고리를 선택된 스타일로 변경하고
		        coffeeMenu.className = 'menu_selected';
		        
		        // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
		        storeMenu.className = '';
		        carparkMenu.className = '';
		        
		        // 커피숍 마커들만 지도에 표시하도록 설정합니다
		        setCoffeeMarkers(map);
		        setStoreMarkers(null);
		        setCarparkMarkers(null);
				for (var i = 0; i < coffeePositions.length; i++) {
				    // LatLngBounds 객체에 좌표를 추가합니다
				    bounds.extend(coffeePositions[i]);
				}
		        
		    } else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때
		    
		        // 편의점 카테고리를 선택된 스타일로 변경하고
		        coffeeMenu.className = '';
		        storeMenu.className = 'menu_selected';
		        carparkMenu.className = '';
		        
		        // 편의점 마커들만 지도에 표시하도록 설정합니다
		        setCoffeeMarkers(null);
		        setStoreMarkers(map);
		        setCarparkMarkers(null);
		        
				for (var i = 0; i < storePositions.length; i++) {
				    // LatLngBounds 객체에 좌표를 추가합니다
				    bounds.extend(storePositions[i]);
				}

		        
		    } else if (type === 'carpark') { // 주차장 카테고리가 클릭됐을 때
		     
		        // 주차장 카테고리를 선택된 스타일로 변경하고
		        coffeeMenu.className = '';
		        storeMenu.className = '';
		        carparkMenu.className = 'menu_selected';
		        
		        // 주차장 마커들만 지도에 표시하도록 설정합니다
		        setCoffeeMarkers(null);
		        setStoreMarkers(null);
		        setCarparkMarkers(map);  
		        
				for (var i = 0; i < carparkPositions.length; i++) {
				    // LatLngBounds 객체에 좌표를 추가합니다
				    bounds.extend(carparkPositions[i]);
				}

		    }
		    setBounds();
		} 
		
		
		
		
		function setBounds() {
		    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
		    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		    map.setBounds(bounds);
		}
	</script>
	
	
	<input id="sss" type="button" value="ㅇㅇㅇ">
	<div id="content"></div>
</body>
</html>