function biuildUsers(user){
  var html = $(`
      <li class="user_result_list">
        <span class="user_result_list--left">${user.name}</span>
        <span id="user-add-btn" class="user_result_list--right">
          <a href ="">追加
            <input id="group_user_ids" name="group[user_ids]" type="hidden" value="${user.id}">
          </a>
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
