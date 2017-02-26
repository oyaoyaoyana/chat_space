function buildMessage(message){
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
    return html
};

$(function(){
  $('#js-message-form').on('submit', function(e){
    e.preventDefault();
    var group_id = $('#group-id').val();
    var $textField = $('#js-form__text-field');
    var message = $textField.val();
    $.ajax({
      url: "/groups/" + group_id + "/messages",
      type: 'POST',
      data: {
        message: {
          body: message
        }
      },
      dataType: 'json',
      timeout: 1000
    })
    .done(function(data){
      message = buildMessage(data);
      $('.chat-messages').append(message)
      $textField.val('');
    })
    .fail(function(){
      alert("error");
    });
    return false;
  });
});
