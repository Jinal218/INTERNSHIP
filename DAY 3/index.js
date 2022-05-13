// $(document).ready(function (){
//     $("h1").css("color", "red");
// });

$("h1").addClass("title");//for adding one class
$("h1").addClass("title margin");// for adding multiple classes

//removing class
// $("h1").removeClass("margin")

//change text
// $("h1").text("bye");

//changing html content
// $("button").html("<b>hey</b>");

//changing a tag
// $("a").attr("href","https://www.youtube.com");  attr - attribute

//event listeners:
$("h1").click(function(){
    $("h1").css("color", "purple");
});

$("h1").dblclick(function(){
    $("h1").css("color", "pink");
    $("h1").css("font-size", "20px");
});

//selecting all buttons nd manipulating them
$("button").click(function(){
    $("h1").css("color", "orange");
});

//keyboard event listeners
$("input").keypress(function(event){
    $("h2").text($("input").val());
});

//on event
$("h1").on("mouseover", function(){
    $("h1").css("font-size", "20px");
});

$("h1").on("mouseout",function(){
    $("h1").css("font-size", "40px");
});
