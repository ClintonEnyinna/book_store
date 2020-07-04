App.book = App.cable.subscriptions.create('BookChannel', {
  connected: function () {
    console.log('connected to book channel');
  },
  disconnected: function () {},
  received: function (data) {
    if (data['message'].method === 'create') {
      const element = $(`.book-${data['message'].id}`)[0];
      if (element) element.remove();
    } else {
      let books = $('#books');
      books.append(data['message']);
    }
  },
});
