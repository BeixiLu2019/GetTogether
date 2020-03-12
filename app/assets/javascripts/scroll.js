function scrollLastMessageIntoView() {
  var messages = document.querySelectorAll('.chat-message');
  var lastMessage = messages[messages.length-1];

  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  }
}

function scrollFirstMessageIntoView() {
  var messages = document.querySelectorAll('.chat-message');
  var firstMessage = messages.first;
  console.log(firstMessage);

  if (firstMessage !== undefined) {
    firstMessage.scrollIntoView();
  }
}
