import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log("You have been connected to the RoomChannels socket")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("You have been disconnected from the RoomChannels socket. Goodbye!")
  },

  received(data) {
    const message = data["body"]
    const room_id = message.room_id
    if(this.roomOpen(room_id)) {
      const html = this.createMessageHTML(message)
      const messageBox = document.querySelector('.message-box')
      messageBox.insertAdjacentHTML('beforeend', html)
      messageBox.scrollTop = messageBox.scrollHeight
    } else {
      const roomLink = document.querySelector(`#room${room_id}`)
      roomLink.firstElementChild.classList.remove('invisible')
    }
  },

  roomOpen(room_id) {
    const path = window.location.pathname
    return path === `/rooms/${room_id}`
  },

  createMessageHTML(data) {
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
