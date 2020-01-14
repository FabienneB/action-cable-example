// When subscriptions.create function is invoked, it will invoke 
// the MessagesChannel#subscribed method

App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    $('#messages').removeClass('hidden');
    return $('#messages').append(this.renderMessage(data));
  },
  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
});

