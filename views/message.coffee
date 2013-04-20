$ ->
  $("#message-form").on "submit", (e) ->
    e.preventDefault()

    $this = $(this)
    $.ajax
      url: $this.prop("action")
      method: $this.prop("method")
      data: $this.serialize()
      success: ->
        console.log("success!")
      error: ->
        console.log("error!")

  messageStream = new EventSource("/stream")
  messageStream.addEventListener "message", (e) ->
    $("<li>").
      text(e.data).
      appendTo("#messages")
