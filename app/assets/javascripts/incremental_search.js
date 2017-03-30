function biuildUsers(user){
  var html = $(`
      <li class="user_add_list add-${user.id}">
        <span class="user_add_list--left">${user.name}</span>
        <span  class="user_add_list--right">
        <a href="#" class="user_add_list--link" data-user-name="${user.name}" data-user-id="${user.id}">追加</a>
        </span>
      </li>
    `);
  return html
};

function addUserValue(name, id){
  var html = $(`
      <li class="user_remove_list remove-${id}">
        <span class="user_remove_list--left">${name}</span>
        <span  class="user_remove_list--right">
        <a href="#" class="user_remove_list--link" data-user-name="${name}" data-user-id="${id}">削除</a>
        <input id="group_user_ids" name="group[user_ids][]" type="hidden" value="${id}">
      </li>
    `);
    return html
};

function removeUserValue(name, id){
  var html = $(`
      <li class="user_add_list add-${id}">
        <span class="user_add_list--left">${name}</span>
        <span  class="user_add_list--right">
        <a href="#" class="user_add_list--link" data-user-name="${name}" data-user-id="${id}">追加</a>
        </span>
      </li>
    `);
    return html
};

function adjustUser(e, user_info){
  e.preventDefault();
  var user_id = user_info.data('user-id');
  var user_name = user_info.data('user-name');
  var $good_class = user_info.attr("class")
  if ($good_class == "user_add_list--link"){
      $(`.add-${user_id}`).remove();
      user = addUserValue(user_name, user_id);
      $('#user_remove_ul').append(user);
  } else {
      $(`.remove-${user_id}`).remove();
      user = removeUserValue(user_name, user_id);
      $('#user_add_ul').append(user);
  }
};

$(function(){
  var preFunc = null
  var preInput = ''
  var input = ''

  //インクリメンタルサーチ開始
  $('#user-text-field').on('keyup', function() {
    input = $.trim($(this).val());
    if(preInput !== input){
      clearTimeout(preFunc);
      preFunc = setTimeout(function(){
        $.ajax({
          url: "search",
          type: "GET",
          data: ("name=" + input),
          dataType: 'json',
          timeout: 1000
        })
        .done(function(data){
          $('#user_add_ul').children().remove();
          $.each(data, function(){
            user = biuildUsers(this)
            $('#user_add_ul').append(user);
          });
        })
        .fail(function(data){
          alert('please reload page');
        });
        return false
    }, 500);
    preInput = input;
    }
  });
  //ユーザーの削除機能
  $( document ).on( 'click', '.user_remove_list--link', function(e) {
    adjustUser(e,$(this))
  });
  //ユーザーの追加機能
  $( document ).on( 'click', '.user_add_list--link', function(e) {
    adjustUser(e,$(this))
  });
});
