<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마커 클러스터러 + 이벤트 사용하기</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69e72c4f38323190dd307b5c1e8339df&libraries=clusterer"></script>
<script src="resources/jquery-3.3.1.min.js"></script>

<style>
.map_wrap, .map_wrap * {
   margin: 0;
   padding: 0;
   font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
   font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
   color: #000;
   text-decoration: none;
}

.map_wrap {
   position: relative;
   width: 100%;
   height: 500px;
}

#menu_wrap {
   position: absolute;
   top: 0;
   left: 0;
   bottom: 0;
   width: 400px;
   margin: 10px 0 30px 10px;
   padding: 5px;
   overflow-y: auto;
   background: rgba(255, 255, 255, 0.7);
   z-index: 1;
   font-size: 12px;
   border-radius: 10px;
}

.bg_white {
   background: #fff;
}

#menu_wrap hr {
   display: block;
   height: 1px;
   border: 0;
   border-top: 2px solid #5F5F5F;
   margin: 3px 0;
}

#menu_wrap .option {
   text-align: center;
}

#menu_wrap .option p {
   margin: 10px 0;
}

#menu_wrap .option button {
   margin-left: 5px;
}

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

#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<script>
	//마커들을 배열로 
	var overLaymarkers = [];
	//멥 좌표 배열로 선언
	var positions = [];
	
	
	$(function() {
		var bounds;
		var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
			center : new daum.maps.LatLng(37.56537, 126.9774), // 지도의 중심좌표 
			level : 8
		// 지도의 확대 레벨 
		});

		// 마커 클러스터러를 생성합니다 
		var clusterer = new daum.maps.MarkerClusterer({
			map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
			averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
			minLevel : 6
		// 클러스터 할 최소 지도 레벨 
		});

		var imageSrc1 = 'resources/images/socar_18dp x2.png', // 마커이미지의 주소입니다  
		imageSrc2 = 'resources/images/eleccar_18dp x2.png', 
		imageSize = new daum.maps.Size(32, 35), // 마커이미지의 크기입니다		
		imageOver = new daum.maps.Size(36, 40), imageOption1 = {offset : new daum.maps.Point(16, 35)}, 
		imageOption2 = {offset : new daum.maps.Point(18, 40)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		var markerImage1 = new daum.maps.MarkerImage(imageSrc1, imageSize, imageOption1);
		var markerImage2 = new daum.maps.MarkerImage(imageSrc2, imageOver, imageOption2);

		
		
		$('#search').on('click', removeMarker);
		
		doSearch();
function doSearch(){
	        bounds= new daum.maps.LatLngBounds();
			var keyword1 = $('#keyword').val();
			var keyword2 = $('#search_gu').val();
			if (typeof keyword2 == 'undefined'){
				keyword2="";
			}
			if (typeof keyword1 == 'undefined'){
				keyword1="";
			}
			var sendData = {
					"keyword1" : keyword1
					, "keyword2" : keyword2
			};
			//ajax로 map 정보 받음
			$.ajax({
					url : 'sss',
					type : 'post',
					data  : JSON.stringify(sendData),
					dataType  : 'json',
					contentType : 'application/json; carset=UTF-8',
					success : function(data) {
						
						$(data.spotList).map(function(i, position) { 
							positions.push(new daum.maps.LatLng(position.LAT, position.LON));
							

				            bounds.extend(new daum.maps.LatLng(position.LAT, position.LON));
							addMarkers(positions[i], i, position);
						});
						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
						// 마커이미지 설정 
						function addMarkers(position, i, content) {
							var markers = new daum.maps.Marker({
								map : map,
								position : position,
								image : markerImage1
							});
							
							
							
							
							
							overLaymarkers.push(markers);
							var parStoreCd = content.PAR_STORE_CD;
							var title = content.ASS_SPONAM;
							var addr = content.ADDR_ORG;
							var carType = "가솔린차";

							var infowindow1 = new daum.maps.InfoWindow(
									{
										position : position,
										content : '<div style="width:250px;border-radius:15px;height:230px;"><table width="260" height="275" cellpadding="0" cellspacing="0"><tr><td><iframe src="reserve?parStoreCd='
												+ parStoreCd
												+ '" frameborder="0" width="250" height="275" scrolling="yes"></iframe></td></tr></table></div>',
										removable : true

									// 인포윈도우에 표시할 내용
									});

							var infowindow2 = new daum.maps.InfoWindow({
								content : content.ASS_SPONAM
							// 인포윈도우에 표시할 내용
							});

							var homePage = "https://www.socar.kr/reserve";
							if (position.GB == "TO") {
								carType = "혼합차량";

							} else if (position.GB == "EV") {
								carType = "전기차";
							}
							// 마커에 표시할 인포윈도우를 생성합니다 
							daum.maps.event.addListener(markers,
									'mouseover', makeOverListener(map,
											markers, infowindow2));
							daum.maps.event.addListener(markers, 'mouseout',
									makeOutListener(markers, infowindow2));
							daum.maps.event.addListener(markers, 'click',
									makeOpenListener(map, markers,
											infowindow1));
						}
						// 클러스터러에 마커들을 추가합니다
						clusterer.addMarkers(overLaymarkers);
						setBounds();
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("Status: " + textStatus);
						alert("Error: " + errorThrown);
					}
				});
			
			}
		

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
				marker.setImage(markerImage2);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(marker, infowindow) {
			return function() {
				infowindow.close();
				marker.setImage(markerImage1);
			};
		}

		//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		function makeOpenListener(map, marker, infowindow) {
			return function() {
				//overlay[i].setMap(map, marker);
				infowindow.open(map, marker);
			};
		}
		
		
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			clusterer.removeMarkers(overLaymarkers);
			for (var i = 0; i < overLaymarkers.length; i++) {
				overLaymarkers[i].setMap(null);
			}
			positions = new Array;
			overLaymarkers = new Array;
			
			doSearch();
		}
		
		function setBounds() {
		    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
		    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		    map.setBounds(bounds);
		}

	});
	
	
</script>


</head>
<body>

<div class="map_wrap">
    <div id="map" style="width:100%;height:700px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <table>
              <tr>
                 <td>구      군 :</td>
                 <td>
                    <select name="search_gu" id="search_gu" onChange="javascript:doSearch();" class="select_style custom" style="width:210px; height:35px;">
                                       
                                       <option value="" selected="selected">&nbsp;&nbsp;  - 전체 -  </option>
                                          
                                       <option value="강남구">&nbsp;&nbsp;강남구</option>
                                    
                                       <option value="강동구">&nbsp;&nbsp;강동구</option>
                                    
                                       <option value="강북구">&nbsp;&nbsp;강북구</option>
                                    
                                       <option value="강서구">&nbsp;&nbsp;강서구</option>
                                    
                                       <option value="관악구">&nbsp;&nbsp;관악구</option>
                                    
                                       <option value="광진구">&nbsp;&nbsp;광진구</option>
                                    
                                       <option value="구로구">&nbsp;&nbsp;구로구</option>
                                    
                                       <option value="금천구">&nbsp;&nbsp;금천구</option>
                                    
                                       <option value="노원구">&nbsp;&nbsp;노원구</option>
                                    
                                       <option value="도봉구">&nbsp;&nbsp;도봉구</option>
                                    
                                       <option value="동대문구">&nbsp;&nbsp;동대문구</option>
                                    
                                       <option value="동작구">&nbsp;&nbsp;동작구</option>
                                    
                                       <option value="마포구">&nbsp;&nbsp;마포구</option>
                                    
                                       <option value="서대문구">&nbsp;&nbsp;서대문구</option>
                                    
                                       <option value="서초구">&nbsp;&nbsp;서초구</option>
                                    
                                       <option value="성동구">&nbsp;&nbsp;성동구</option>
                                    
                                       <option value="성북구">&nbsp;&nbsp;성북구</option>
                                    
                                       <option value="송파구">&nbsp;&nbsp;송파구</option>
                                    
                                       <option value="양천구">&nbsp;&nbsp;양천구</option>
                                    
                                       <option value="영등포구">&nbsp;&nbsp;영등포구</option>
                                    
                                       <option value="용산구">&nbsp;&nbsp;용산구</option>
                                    
                                       <option value="은평구">&nbsp;&nbsp;은평구</option>
                                    
                                       <option value="종로구">&nbsp;&nbsp;종로구</option>
                                    
                                       <option value="중구">&nbsp;&nbsp;중구</option>
                                    
                                       <option value="중랑구">&nbsp;&nbsp;중랑구</option>
                                    
                                 </select>
                </td>
             </tr>
             <tr>
                <td>거점명 :</td>
                <td> <input type="text" id="keyword" size="15" /> </td>
                <td> <input  id="search"  type="button" value="검색하기" /></td>
             </tr>
            </table>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
</body>
</html>