document.addEventListener("DOMContentLoaded", function () {
    const canvas = document.getElementById("mycanvas");
    canvas.width = 500;
    canvas.height = 500;

    const ctx = canvas.getContext("2d");
    ctx.fillStyle = "pink";
    ctx.fillRect(0, 0, 500, 500);

    ctx.beginPath();
    ctx.arc(75, 75, 50, 0, 2 * Math.PI,true);
    ctx.strokeStyle = "blue";
    ctx.lineWidth = 4;
    ctx.moveTo(110, 75);
    ctx.arc(75, 75, 35, 0, Math.PI, false);
    
    ctx.moveTo(65, 65);
    ctx.arc(60, 65, 5, 0, Math.PI*2);
    ctx.moveTo(95, 65);
    ctx.arc(90, 65, 5, 0, Math.PI*2);
    ctx.stroke();
});