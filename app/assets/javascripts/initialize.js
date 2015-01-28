var current_fs, next_fs, previous_fs;
var left, opacity, scale;
var animating;

$( document ).ready(function() {
  $(document).foundation();

  $('#pick_number1').autotab({ target: '#pick_number2', format: 'numeric' });
  $('#pick_number2').autotab({ target: '#pick_number3', format: 'numeric'});
  $('#pick_number3').autotab({ target: '#pick_number4', format: 'numeric'});
  $('#pick_number4').autotab({ target: '#pick_number5', format: 'numeric'});
  $('#pick_number5').autotab({ target: '#pick_number6', format: 'numeric'});

  $(".next").click(function(event){
    console.log("next click", event)

    current_fs = $(this).parent();
    next_fs = $(this).parent().next();
    previous_fs = $(this);

    $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");


    current_fs.hide();
    next_fs.show();

    next_fs.css({'left': left, 'opacity': opacity});
    animating = false;
  });

  $(".previous").click(function(event){
      console.log("prev click", event.target)

        $current_fs = $(this).parent();
        $previous_fs = $current_fs.prev();
        console.log("current_fs", $current_fs);
        console.log("previous_fs", $previous_fs);

        $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

        $current_fs.hide();
        $previous_fs.show();

        previous_fs.css({'opacity': opacity});
        animating = false;
  });
});


