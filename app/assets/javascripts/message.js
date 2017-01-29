$(document).on('turbolinks:load', function() {
  function buildHTML(data) {
    var message = '<p class="chat-message_body">' + data.body + '</p>';
    var image = '<img src=' + data.image + '>';
    var name = '<p class="chat-message_name">' + data.name + '</p>';
    var timestamps = '<p class="chat-message_time">' + data.created_at + '</p>';
    var header = $('<div class="chat-message__header clearfix">').append(name).append(timestamps);
    var html = $('<li class="chat-message">').append(header).append(message).append(image);
    return html;
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    $.ajax({
      type: 'POST',
      url: $("#new_message").attr("action"),
      data: new FormData($("#new_message")[0]),
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data.message);
      $('.chat-messages').append(html);
    })
    .fail(function() {
      alert('error');
    });
  });
});
