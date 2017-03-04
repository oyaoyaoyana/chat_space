function biuildUsers(user){
  var html = $(`
      <li class="user_result_list list-${user.id}">
        <span class="user_result_list--left">${user.name}</span>
        <span  class="user_result_list--right">
        <a href="#" class="user_result_list--link" data-user-name="${user.name}" data-user-id="${user.id}">追加</a>
        </span>
      </li>
    `);
  return html
};

function addUserValue(name, id){
  var html = $(`
      <li class="user_add_list add-${id}">
        <span class="user_add_list--left">${name}</span>
        <span  class="user_add_list--right">
        <a href="#" class="user_add_list--link" data-user-name="${name}" data-user-id="${id}">削除</a>
        <input id="group_user_ids" name="group[user_ids][]" type="hidden" value="${id}">
      </li>
    `);
    return html
};

function addUserList(name, id){
  var html = $(`
      <li class="user_result_list list-${id}">
        <span class="user_result_list--left">${name}</span>
        <span  class="user_result_list--right">
        <a href="#" class="user_result_list--link" data-user-name="${name}" data-user-id="${id}">追加</a>
        </span>
      </li>
    `);
    return html
};

$(function(){
  var preFunc = null
  var preInput = ''
  var input = ''
  var ajaxSearch = function() {
    $.ajax({
      url: "search",
      type: "GET",
      data: ("name=" + input),
      dataType: 'json',
      timeout: 1000
    })
    .done(function(data){
      // ユーザーリストの削除
      $('#user_list_ul').children().remove();
      // ユーザーリストの作成
      $.each(data, function(){
        user = biuildUsers(this)
        $('#user_list_ul').append(user);
      });
    })
    .fail(function(data){
      alert('please reload page');
    });
    return false
  };
  $('#user-text-field').on('keyup', function() {
    input = $.trim($(this).val());
    if(preInput !== input){
      clearTimeout(preFunc);
      preFunc = setTimeout(ajaxSearch, 500);
    }
    preInput = input;
  });
});

//ユーザーの削除機能
$(function(){
  $( document ).on( 'click', '.user_add_list--link', function(e) {
    e.preventDefault();
    var user_id = $(this).data('user-id');
    var user_name = $(this).data('user-name');
    // ユーザーの値の削除
    $(`.add-${user_id}`).remove();
    user = addUserList(user_name, user_id);
    //ユーザーのリスト追加
    $('#user_list_ul').append(user);
  });
});
//ユーザーの追加機能
$(function(){
  $( document ).on( 'click', '.user_result_list--link', function(e) {
    e.preventDefault();
    var user_id = $(this).data('user-id');
    var user_name = $(this).data('user-name');
    //ユーザーのリスト削除
    $(`.list-${user_id}`).remove();
    user = addUserValue(user_name, user_id);
    // ユーザーの値の追加
    $('#user_add_list_ul').append(user);
  });
});
