$(function(){
  function buildHTML(todo){
    var html = $('<li class="chat-message">').append(todo.body);
    return html ;
  };
  $('#js-form').on('submit', function(e){
    e.preventDefault();
    var $form = $(this);
    var $textField = $('#js-form__text-field');
    var $button = $('#message-btn');

    $.ajax({
      url: $form.attr('action'),
      type: 'POST',
      data: $form.serialize(),
      timeout: 1000
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat-messages').append(html);
      $textField.val('');
    })
    .fail(function(){
      alert("error");
    });
    return false
  });
});
