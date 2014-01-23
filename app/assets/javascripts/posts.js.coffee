# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#post_tag_names').inputosaurus
    width : '250px'

  $('.show-comments').on 'click', (e) ->
    comments_container = $(this).siblings('.comments-container')
    spinner = $(this).siblings('.spinner')

    e.preventDefault()
    spinner.show()
    $(this).hide()

    $.get $(this).data('url'), (comments) ->
      comments.forEach (comment) ->
        newComment = Mustache.render $('#comment-template').html(), comment
        $(newComment).appendTo(comments_container)
      comments_container.slideDown()
      spinner.hide()
    