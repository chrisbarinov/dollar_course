import consumer from "./consumer"

consumer.subscriptions.create({ channel: "RefreshDollarCourseChannel"}, {
  received(data) {
    this.insertLine(data.body)
  },

  insertLine(data) {
    document.querySelector("#dollar_course").innerText = data
  }
})
