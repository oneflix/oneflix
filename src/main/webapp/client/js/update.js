function show() {

            var value = document.getElementById("div1").style.display;

            if (value == "none") {
                document.getElementById("div1").style.display = "block";
            }
            else
                document.getElementById("div1").style.display = "none";
        }
