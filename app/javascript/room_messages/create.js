document.addEventListener('turbolinks:load', () => {
  let form = document.getElementById('message-form')
  if(form) {
    form.addEventListener('ajax:success', (event) => {
      document.querySelector('.input').value = '';
    })
  }
})
