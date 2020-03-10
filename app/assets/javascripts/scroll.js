function scrollLastMessageIntoView() {
  console.log("Awesome")
  const messages = document.querySelectorAll('.chat-message');
  const lastMessage = messages[messages.length - 1];

  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  }
}
