
//성별분포차트
var genderData;

  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
   		var genderJson = $.ajax({
    	url : "/getAnalysisProcAjax.mdo",
    	dataType: "json",
    	async: false
    }).responseText;

   	genderData = new google.visualization.DataTable(genderJson);
   	
    var options = {
      slices: {0: { color: '#9D8189' }, 1:{ color: '#55828B'}},
      align:'center',
      chartArea:{ height:'80%', width:'85%'},
      pieHole: 0.4,
      bars: 'vertical',
             height :500,
             width :'100%',
             bar: {groupWidth: "70%"},
             legend: { position: "top" },
             isStacked: false,
          //    tooltip:{textStyle : {fontSize:12}, showColorCode : true},
      animation: { //차트가 뿌려질때 실행될 애니메이션 효과
              startup: true,
              duration: 1000,
              easing: 'linear' },
      annotations: {
              textStyle: {
              fontSize: 15,
              bold: true,
              italic: true,
              opacity: 0.8
                 }
            }
    };
    var chart = new google.visualization.PieChart(document.getElementById("gender_chart"));
    chart.draw(genderData, options);
    //window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}


  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ["제목", "회", { role: "style" },{role:"annotation"} ],
      ["영화1", 2462, "color:#9D8189;", 2462],
      ["영화2", 2044, "color:#A88B93;",2044],
      ["영화3", 1895, "color:#BA9EA6;",1895],
      ["영화4", 1322, "color:#C4ACB3;",1322],
      ["영화5", 980, "color:#E2D0D7;",980],
    ]);

    var view = new google.visualization.DataView(data);
    var options = {
      title:'누적 조회수 순위',
      align:'center',
      chartArea:{ height:'70%', width:'80%'},
      bars: 'vertical',
             height :500,
             width :'100%',
             bar: {groupWidth: "65%"},
             legend: { position: "none" },
             isStacked: false,
          //    tooltip:{textStyle : {fontSize:12}, showColorCode : true},
      animation: { //차트가 뿌려질때 실행될 애니메이션 효과
              startup: true,
              duration: 1000,
              easing: 'linear' },
      annotations: {
              textStyle: {
              fontSize: 15,
              bold: true,
              italic: true,
              opacity: 0.8
                 }
            }
    };
    var chart = new google.visualization.BarChart(document.getElementById("movie-ranking-cumulates"));
    chart.draw(view, options);
    window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}


  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ["제목", "회", { role: "style" },{role:"annotation"} ],
      ["영화1", 2462, "color:#4A747C;", 2462],
      ["영화2", 2044, "color:#5C848C;",2044],
      ["영화3", 1895, "color:6B939B;",1895],
      ["영화4", 1322, "color:#82A6AD;",1322],
      ["영화5", 980, "color:#9EBBC1;",980],
    ]);

    var view = new google.visualization.DataView(data);
    var options = {
      title:'최근 30일내 인기 영화',
      align:'center',
      chartArea:{ height:'70%', width:'80%'},
      bars: 'vertical',
             height :500,
             width :'100%',
             bar: {groupWidth: "65%"},
             legend: { position: "none" },
             isStacked: false,
          //    tooltip:{textStyle : {fontSize:12}, showColorCode : true},
      animation: { //차트가 뿌려질때 실행될 애니메이션 효과
              startup: true,
              duration: 1000,
              easing: 'linear' },
      annotations: {
              textStyle: {
              fontSize: 15,
              bold: true,
              italic: true,
              opacity: 0.8
                 }
            }
    };
    var chart = new google.visualization.BarChart(document.getElementById("movie-ranking-recently"));
    chart.draw(view, options);
    window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}

  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ["연령대", "명", { role: "style" },{role:"annotation"} ],
        ["10대", 2462, "color:#E1E6EE;", 2462],
        ["20대", 1499, "color:#B5C1D5;",1499],
        ["30대", 1895, "color:#889BB9;",1895],
        ["40대", 1322, "color:#5F779E;",1322],
        ["50대", 980, "color:#405D8D;",980],
        ["60대 이상", 872, "color:#33507F;",872]
    ]);

    var view = new google.visualization.DataView(data);
    var options = {
      align:'center',
      chartArea:{ height:'90%', width:'85%'},
      height :500,
      width :'100%',
      bar: {groupWidth: "65%"},
      legend: { position: "none" },
      isStacked: false,
          //    tooltip:{textStyle : {fontSize:12}, showColorCode : true},
      animation: { //차트가 뿌려질때 실행될 애니메이션 효과
              startup: true,
              duration: 1000,
              easing: 'linear' },
      annotations: {
              textStyle: {
              fontSize: 15,
              bold: true,
              italic: true,
              opacity: 0.8
                 }
            }
    };
    var chart = new google.visualization.ColumnChart(document.getElementById("member-age"));
    chart.draw(view, options);
    window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}


  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ["월", "원" ,{role:"annotation"} ],
        ["1월", 2462, 2462],
        ["2월", 1499,1499],
        ["3월", 1895, 1895],
        ["4월", 1322, 1322],
        ["5월", 980, 980],
        ["6월", 872, 872],
        ["7월", 4569, 4569],
        ["8월", 12285, 12285],
        ["9월", 13362, 13362],
        ["10월", 15523, 15523],
        ["11월", 15569, 15569],
        ["12월", 15883, 15883],
    ]);

    var view = new google.visualization.DataView(data);
    var options = {
      series: {0: { color: '#FF4242' }},
      align:'center',
      chartArea:{ height:'90%', width:'85%'},
      height :500,
      width :'100%',
      bars: 'vertical',
      height :500,
      width :'100%',
      bar: {groupWidth: "70%"},
      legend: { position: "none" },
      isStacked: false,
      animation : {
          startup: true,
          duration: 1000,
          easing: 'in'
          },
      annotations: {
              textStyle: {
              fontSize: 15,
              bold: true,
              italic: true,
              opacity: 0.8
                 }
            }
    };
    var chart = new google.visualization.LineChart(document.getElementById("sales-chart"));
    chart.draw(view, options);
    window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}


  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ["월", "명" ,{role:"annotation"} ],
        ["1월", 2462, 2462],
        ["2월", 1499,1499],
        ["3월", 1895, 1895],
        ["4월", 1322, 1322],
        ["5월", 980, 980],
        ["6월", 872, 872],
        ["7월", 4569, 4569],
        ["8월", 12285, 12285],
        ["9월", 13362, 13362],
        ["10월", 15523, 15523],
        ["11월", 15569, 15569],
        ["12월", 15883, 15883],
    ]);

    var view = new google.visualization.DataView(data);
    var options = {
      series: {0: { color: '#4A7C9F' }},
      align:'center',
      chartArea:{ height:'90%', width:'85%'},
      height :500,
      width :'100%',
      bars: 'vertical',
             height :500,
             width : '100%',
             bar: {groupWidth: "70%"},
             legend: { position: "none" },
             isStacked: false,
          //    tooltip:{textStyle : {fontSize:12}, showColorCode : true},
      animation : {
        startup: true,
        duration: 1000,
        easing: 'in'
        },
      annotations: {
              textStyle: {
              fontSize: 15,
              bold: true,
              italic: true,
              opacity: 0.8
                 }
            }
    };
    var chart = new google.visualization.LineChart(document.getElementById("product-user-chart"));
    chart.draw(view, options);
    window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}