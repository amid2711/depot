function pokaz(descr){
  var vid = document.getElementById(descr).style;
  if (vid.display == "none") {
    vid.display = "block";
  }
  else {
    vid.display = "none";
  }
}