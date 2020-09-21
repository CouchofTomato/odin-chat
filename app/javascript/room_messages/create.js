let form = document.getElementById('message-form')
const messageBox = document.querySelector('.message-box')
messageBox.scrollTop = messageBox.scrollHeight
form.addEventListener('ajax:success', (event) => {
  document.querySelector('.input').value = '';
})
