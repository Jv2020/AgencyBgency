function onload(event) {

	var myDataService =  {
		 rate:function(rating) {
				return {then:function (callback) {
					setTimeout(function () {
						callback((Math.random() * 5)); 
					}, 1000); 
				}
			}
		}
	}

	var starRatingStep = raterJs( {
		starSize:32, 
		step:0.5, 
		element:document.querySelector("#rater-step"),
		rateCallback:function rateCallback(rating, done) {
			this.setRating(rating); 
			done(); 
		}
	});


}

window.addEventListener("load", onload, false); 