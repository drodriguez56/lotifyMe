var current_fs, next_fs, previous_fs;
var left, opacity, scale;
var animating;

$( document ).ready(function() {
  $(document).foundation()

  $('#pick_number1').autotab({ target: '#pick_number2', format: 'numeric' });
  $('#pick_number2').autotab({ target: '#pick_number3', format: 'numeric'});
  $('#pick_number3').autotab({ target: '#pick_number4', format: 'numeric'});
  $('#pick_number4').autotab({ target: '#pick_number5', format: 'numeric'});
  $('#pick_number5').autotab({ target: '#pick_number6', format: 'numeric'});
});


  $(".next").click(function(){

    current_fs = $(this).parent();
    next_fs = $(this).parent().next();
    previous_fs = $(this);

    $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");


  next_fs.show();

  current_fs.replaceWith(next_fs);
  next_fs.css({'left': left, 'opacity': opacity});
  current_fs.hide();
  animating = false;

  $(".previous").click(function(){
    if(animating) return false;
    animating = true;

    current_fs = $(this).parent();
    previous_fs = $(this).parent().prev();



    $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

  previous_fs.show();
    // "slow", function(){
    // complete: function(){
    // current_fs.hide();
    // animating = false;
    // },
    //   }
    });
  });
});

$(".submit").click(function(){
  return false;
})

