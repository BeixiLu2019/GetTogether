

function scrollLastMessageIntoView() {
  console.log('what')
  var messages = document.querySelectorAll('.chat-message');
  console.log(messages);
  var lastMessage = messages[messages.length-1];

  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  }
}

function scrollFirstMessageIntoView() {
  var messages = document.querySelectorAll('.chat-message');
  var firstMessage = messages[0];

  if (firstMessage !== undefined) {
    firstMessage.scrollIntoView(true);
  }
}

function scrolling() {
  var messages = document.querySelectorAll('.chat-message');
  if (messages.length > 2) {
    scrollLastMessageIntoView();
  } else {
    scrollFirstMessageIntoView();
  }
}
