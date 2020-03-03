google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['장르', '편'],
                ['액션', 11],
                ['코미디', 22],
                ['로맨스', 33],
                ['애니메이션', 11],
                ['음악', 44],
                ['범죄', 11],
            ]);
            

            var view = new google.visualization.DataView(data);
            var options = {
                slices: { 0: { color: '#9D8189' }, 1: { color: '#55828B' } },
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
            };
            var chart = new google.visualization.PieChart(document.getElementById("genre_chart"));
            chart.draw(view, options);
            window.addEventListener('resize', function () { chart.draw(data, options); }, false);
        }