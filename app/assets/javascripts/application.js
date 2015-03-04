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
  $(document).on('submit', '.new_answer', function(event) {
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

  $(document).on('#ask-question', function(event) {
    event.preventDefault();
    console.log("Submission was received");
  })

  $(".question-vote").on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();
    $.ajax({
      url: this.href,
      method: "PUT",
      data: $(this).serialize(),
      success: function(response) {
        $("#voted-question-" + response["question"]).text(response["votes"]);
      }
    })
  })

  $(".answer-vote").on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();
    $.ajax({
      url: this.href,
      method: "PUT",
      data: $(this).serialize(),
      success: function(response) {
        $("#voted-answer-" + response["answer"]).text(response["votes"]);
      }
    })
  })
})