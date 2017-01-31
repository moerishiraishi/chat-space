$(document).on('turbolinks:load', function() {

  var indexUrl = window.location.href + ".json";

  function buildHTML(data) {
    if (data.image) {
      var image = '<img src=' + data.image + '>'
    } else {
      var image = ""
    }
    var html =  '<li class="chat-message">' +
                  '<div class="chat-message__header clearfix">' +
                    '<p class="chat-message_name">' + data.name + '</p>' +
                    '<p class="chat-message_time">' + data.created_at + '</p>' +
                  '</div>' +
                  '<p class="chat-message_body">' + data.body + '</p>' + image +
                '</li>';
    return html;
  };

  function moveToBottom() {
    $('.chat-body').delay(100).animate({
      scrollTop: $('.chat-messages').height() + $('.chat-message').height()
    })
  };

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
      $('#message_body').val("");
      moveToBottom();
    })
    .fail(function() {
      alert('error');
    })
    .always(function() {
      return false
    });
  });

// //現在のURLに該当したら自動更新
  if (window.location.href.match(/messages/)) {
    setInterval(function() {
      $.ajax({
        type: 'GET',
        url: indexUrl,
        dataType: 'json'
    })
    .done(function(data) {
      var number = data.length;
      var insertHtml =""
      for (var i = 0; i < number; i++) {
        insertHtml += buildHTML(data[i]);
      };
      $('.chat-messages').html(insertHtml);
      moveToBottom();
    })
    .fail(function() {
      alert('error');
    });
  },5000);
  };
});
