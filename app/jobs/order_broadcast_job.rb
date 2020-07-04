class OrderBroadcastJob < ApplicationJob
  queue_as :default

  def perform(book_id)
    ActionCable.server.broadcast 'book', {
      message: { id: book_id, method: 'create' }
    }
  end
end
