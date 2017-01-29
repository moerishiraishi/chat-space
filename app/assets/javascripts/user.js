$(function() {

  //インクリメンタルサーチで検索したユーザーの表示機能
  function BuildHTML(user) {
      var html = '<div class="chat-group-user clearfix chat-group-user-add">' +
                   '<p class="chat-group-user__name">' + user.name + '</p>' +
                   '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="' + user.id + '" data-user-name="' + user.name + '">追加' +
                   '</a>' +
                 '</div>';
      return html;
  }

  //追加するユーザーの候補の表示機能
  function AddUserHTML(id, name) {
    var html = '<div class="chat-group-user clearfix" id="chat-group-user-' + id + '">' +
                 '<input type="hidden" name="group[user_ids][]" value="' + id + '">' +
                 '<p class="chat-group-user__name">' + name + '</p>' +
                 '<a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove" data-user-id="' + id + '">削除' +
                 '</a>' +
                '</div>';
    return html;
  }

  //インクリメンタルサーチ実行機能
  function ajaxSearch(text) {
    $.ajax({
      type: "GET",
      url: "/users/search",
      data: {
        user: {
          text: $('#user-search-field').val()
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var insertHtml = ""
      $.each(data, function(i, user) {
        insertHtml += BuildHTML(user);
      });
      $('#user-search-result').html(insertHtml);
    })
    .fail(function() {
      alert('error');
    });
  };

  //インクリメンタルサーチ実行
  $('#user-search-field').on('keyup', function() {
    ajaxSearch();
  });

  //インクリメンタルサーチで検索したユーザーの表示
  $(document).on('click', '.chat-group-user__btn--add', function(){
    var id = $(this).data('user-id');
    var name = $(this).data('user-name');
    $(this).parent().remove();
    var insertHtml = AddUserHTML(id, name)
    $('#chat-group-users').append(insertHtml);
  });

    //追加するユーザーの候補の表示
   $(document).on('click', '.chat-group-user__btn--remove', function(){
    $(this).parent().remove();
   });
});


