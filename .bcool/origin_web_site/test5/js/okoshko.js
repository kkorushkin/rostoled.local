$(document).ready(function(){

var i = 0;
function yved(){
i=1;
$('.yved:nth-child('+i+')').slideDown("slow").delay(15000).slideUp("slow");
}
setTimeout(function(){
setInterval(
function(){
i=i+1;
if(i>8) i=1;
$('.yved:nth-child('+i+')').slideDown("slow").delay(10000).slideUp("slow");//В этой строчке в мс 500 - время анимации появления, 5000 - время задержки, 500 - время затухания уведомления соответсвенно
},30000);
yved();
},10000);
});