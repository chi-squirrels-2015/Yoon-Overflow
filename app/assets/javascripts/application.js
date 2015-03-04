// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $(document).on('submit', ".new_answer", function(event) {
    event.preventDefault();
    $.ajax({
      url: this.action,
      method: this.method,
      data: $(this).serialize(),
      success: function(response){
        $("#answers-display-table").prepend(response);
        $(".new_answer").remove();
      }
    })
  })

  $(".question-upvote").on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();
    var voteInstance = this;
    // console.log(voteInstance);

    $.ajax({
      url: this.href,
      method: "PUT",
      data: $(this).serialize(),
      success: function(response) {
        console.log($(voteInstance).closest("span"))
        // $(voteInstance).find("span").context.nextElementSibling.html(response["votes"]);

        // $(voteInstance).find("span").html(response["votes"]);
        // $(".question-vote").html(response["votes"]);
        // console.log(response["votes"]);
        // how to reference the specific thing we clicked on inside of the success function
        // get to the span right after it and change it
      }
    })
  })
})