//구글차트
var data;
var mostWatched;
var sentence = document.getElementById('sentence');
var countWatch = document.getElementById('countWatch');
var val = $("#countWatch").text();
var nick;

		google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);
                function drawChart() {
                  var jsonData = $.ajax({
                        url: "/mypageHomeProcAjax.do",
                        dataType: "json",
                        async: false
                        }).responseText;
                    
                    // Create our data table out of JSON data loaded from server.
                    data = new google.visualization.DataTable(jsonData);
//                	var view = new google.visualization.DataView(data);  
            //많이 본 장르 얻기        
            mostWatched = data.getValue(0,0);
        	sentence.append(mostWatched);
        	sentence.append("를 좋아하는 ");
        	
        	if( val <= 3 ){
        		nick = "영알못!";
        	}else if(val > 3 && val <= 5){
        		nick = "영화초보!";
        	}else if(val > 5 && val <= 10){
                nick = "영화고수!";
            }else if(val > 10 && val <= 20){
            	nick = "영화매니아!";
            }else if(val > 20 ){
            	nick = "영화광!";
            }
                
        	sentence.append(nick);

            var options = {
                slices: { 0: { color: '#9D8189' }, 1: { color: '#55828B' } },
                responsive: true,
                align: 'center',
                legendTextStyle: { color: '#080808'},
                chartArea: { height: '83%', width: '95%' },
                pieHole: 0.3,
                bars: 'vertical',
                height: 390,
                width: '130%',
                bar: { groupWidth: "70%" },
                legend: { position: "bottom", color: "#080808" },
                isStacked: false,
                curveType: 'function',
                backgroundColor: '#fff;',

                //    tooltip:{textStyle : {fontSize:12}, showColorCode : true},
                animation: { //차트가 뿌려질때 실행될 애니메이션 효과
                    startup: true,
                    duration: 1000,
                    easing: 'linear'
                },
                annotations: {
                    textStyle: {
                        fontSize: 15,
                        bold: true,
                        italic: true,
                        opacity: 0.8,
                        color: '#080808;'
                    	}
                	}
            	}; //옵션
         // Create DataTable and add the array to it.
            
            var chart = new google.visualization.PieChart(document.getElementById("genre_chart"));
            chart.draw(data, options);
//            window.addEventListener('resize', function () { chart.draw(data, options); }, false);
 
 //           }   //END  success: function (result) {
//        });     //END  $.ajax({
    };          //END  function drawChart()
//    function settingSentence(){
//
//    	
//    }


//슬라이더
	    const calcSlideCount = function() {
	        var slideCount = 2;
	        var windowWidth = $(window).width();
	        if (windowWidth < 620) {
	            slideCount = 1;
	        } 
	        return slideCount;
	    }
    
        const createReviewSwiper = function(slideCount) {
            var reviewSwiper = new Swiper('#review-slider-container', {
                slidesPerView: slideCount,
                spaceBetween: 15,
                slidesPerGroup: slideCount,
            
                loopFillGroupWithBlank: true,
            
                navigation: {
                    nextEl: '#review-button-next',
                    prevEl: '#review-button-prev'
                },
            
                speed: 1000,
            });
        };

		$(document).ready(function() {
		    createReviewSwiper(calcSlideCount());
		});
		 $(window).resize(function() {
		    createReviewSwiper(calcSlideCount());
		 });
