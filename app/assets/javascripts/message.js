$(document).on('turbolinks:load', function() {
  function buildHTML(data) {
    var message = $('<p class="chat-message_body">').append(data.body);
    var name = $('<p class="chat-message_name">').append(data.name);
    var timestamps = $('<p class="chat-message_time">').append(data.created_at);
    var header = $('<div class="chat-message__header clearfix">').append(name).append(timestamps);
    var html = $('<li class="chat-message">').append(header).append(message);
    return html;
  }

  $('#new_message').on('click', function(e) {
    e.preventDefault();
    var textField = $('#message_body');
    $.ajax({
      type: 'POST',
      url: $("#new_message").attr("action"),
      data: {
        message: {
          body: textField.val()
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data.message);
      $('.chat-messages').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
