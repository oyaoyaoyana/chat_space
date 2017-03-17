function buildMessage(message){
  if (message.image != null){
    var html = $(`
      <li class="chat-message">
        <div class="chat-message__header clearfix">
          <p class="chat-message__name">
            ${message.name}
          </p>
          <p class="chat-message__time">
            ${message.time}
          </p>
          <br>
          <p class="chat-message__body">
             ${message.body}
          </p>
          <div class="chat-message__img">
            <img src="${message.image}" alt="${message.image}">
          </div>
        </div>
      </li>
      `);
  } else{
    var html = $(`
      <li class="chat-message">
        <div class="chat-message__header clearfix">
          <p class="chat-message__name">
            ${message.name}
          </p>
          <p class="chat-message__time">
            ${message.time}
          </p>
          <br>
          <p class="chat-message__body">
             ${message.body}
          </p>
        </div>
      </li>
      `);
  }
    return html
};

$(function(){
  $('#js-message-form').on('submit', function(e){
    e.preventDefault();
    var $textField = $('#js-form__text-field');
    var form_action = $(this).attr('action')
    var $fileField = $('#file-input');
    $.ajax({
      url: form_action,
      type: 'POST',
      data: new FormData($(this).get(0)),
      dataType: 'json',
      timeout: 10000,
      processData: false,
      contentType: false
    })
    .done(function(data){
      message = buildMessage(data);
      $('.chat-messages').append(message)
      $textField.val('');
      $fileField.val('');
    })
    .fail(function(jqXHR, textStatus, errorThrown) {
      alert("please reload!!!")
    })
    return false;
  });
});
