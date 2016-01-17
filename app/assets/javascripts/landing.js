var numImages = 3;
var x = 0;
setInterval(function() {
  if (x == numImages){x = 0;}
  document.getElementById('background').src="/assets/home-image-" + x + ".jpg";
  x+=1;
}, 4000);
