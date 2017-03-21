function buildMessage(message){
  if (message.image == null){
    var html = $(`
      <li class="chat-message" data-id="${message.id}">
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
  } else{
    var html = $(`
    <li class="chat-message" data-id="${message.id}">
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
  }
    return html
};

function scrollBottom(){
  $('.chat-body').animate({
    scrollTop: $('.chat-messages').height()
  });
}

$(function(){
  $('#js-message-form').on('submit', function(e){
    e.preventDefault();
    var $textField = $('#js-form__text-field');
    var form_url = $(this).attr('action')
    var $fileField = $('#file-input');
    $.ajax({
      url: form_url,
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


$(function(){
  if (location.pathname.match('messages') == "messages"){
    scrollBottom();
    setInterval( function() {
      var last_message_id = $('.chat-messages li:last-child').data('id');
      console.log(last_message_id)
      $.ajax({
        url: '',
        type: 'GET',
        data: {
          last_message_id: last_message_id,
        },
        dataType: 'json',
        timeout: 1000
      })
      .done(function(data){
        console.log(data);
        $.each(data, function(){
        message = buildMessage(this)
        $('.chat-messages').append(message)
        })
       })
      .fail(function(jqXHR, textStatus, errorThrown) {
      })
    }, 10000 );
  };
});
