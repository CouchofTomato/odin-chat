import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  let room
  const roomEl = document.getElementById('room_id')
  if (roomEl) {
    room = roomEl.dataset.room
  }

  consumer.subscriptions.create({channel: "RoomChannel", room: room}, {
    connected() {
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = this.createMessage(data)
      const messageBox = document.querySelector('.message-box')
      messageBox.insertAdjacentHTML('beforeend', html)
      messageBox.scrollTop = messageBox.scrollHeight
    },

    createMessage(data) {
      return `
        <div class="message">
          <div class="message-header">
            ${ data.user.username }
          </div>
          <div class="message-body">
            ${ data.message }
          </div>
        </div>
      `
    }
  });
})

