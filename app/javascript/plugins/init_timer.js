
const initTimer = () => {
  const demo = document.querySelectorAll(".demo")
  if (demo) {
    demo.forEach((demoNode) => {
      var countDownDate = new Date(demoNode.innerHTML).getTime();

    // Update the count down every 1 second
    var x = setInterval(function() {

      // Get today's date and time
      var now = new Date().getTime();

      // Find the distance between now and the count down date
      var distance = countDownDate - now;

      // Time calculations for days, hours, minutes and seconds
      var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);

      // Display the result in the element with id="demo"
      if (days > 0 ) {
        demoNode.innerHTML = "Starts in: " + days +"d " + hours + "h "
        + minutes + "m " + seconds + "s ";
      } else {
        demoNode.innerHTML = "Starts in: " + hours + "h "
        + minutes + "m " + seconds + "s ";
      }


      // If the count down is finished, write some text
      if (distance < 0) {
        clearInterval(x);
        demoNode.innerHTML = "EVENT IS IN THE PAST";
      }
    }, 1000);
  });
  };
};

export { initTimer };


