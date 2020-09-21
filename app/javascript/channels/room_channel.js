import consumer from "./consumer"

function subscriptionExists(room) {
  return consumer.subscriptions.subscriptions.some(subscription => {
    let roomInfo = JSON.parse(subscription.identifier)
    return roomInfo.room == room
  })
}

document.addEventListener('turbolinks:load', () => {
  let room = document.querySelector('#room_id')
  if (room && !subscriptionExists(room.dataset.room)) {
    consumer.subscriptions.create({channel: "RoomChannel", room: room.dataset.room}, {
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
  }
})

