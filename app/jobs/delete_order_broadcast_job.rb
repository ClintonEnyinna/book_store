class DeleteOrderBroadcastJob < ApplicationJob
  queue_as :default

  def perform(order)
    ActionCable.server.broadcast 'book', {
      message: render_book(order)
    }
  end

  def render_book(order)
    OrdersController.render(
      partial: 'book',
      locals: {
        book: order.book,
        current_user: order.buyer
      }
    )
  end
end
