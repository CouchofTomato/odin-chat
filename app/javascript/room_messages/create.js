document.addEventListener('DOMContentLoaded', () => {
  let form = document.getElementById('message-form')
  if(form) {
    form.addEventListener('ajax:success', (event) => {
      document.querySelector('.input').value = '';
    })
  }
})
