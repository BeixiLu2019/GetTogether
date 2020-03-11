function scrollLastMessageIntoView() {
  console.log("Awesome")
  var messages = document.querySelectorAll('.chat-message');
  var lastMessage = messages[messages.length - 1];

  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  }
}
