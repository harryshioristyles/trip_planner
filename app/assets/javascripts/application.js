// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery-ui
//= require tag-it
//= require bootstrap-sprockets
//= require cocoon
//= require_tree .

$(document).on('turbolinks:load', function() {
  var tag_list, tag_string, error, i, len, results, tag;
  $('#trip-tags').tagit({
    fieldName: 'tag_list',
    singleField: true
  });
  $('#trip-tags').tagit();
  tag_string = $("#tag_hidden").val();
  try {
    tag_list = tag_string.split(',');
    results = [];
    for (i = 0, len = tag_list.length; i < len; i++) {
      tag = tag_list[i];
      results.push($('#trip-tags').tagit('createTag', tag));
    }
    return results;
  } catch (error1) {
    error = error1;
  }
});
