class MessageWorker
  include Sidekiq::Worker

  def perform(sender_id, recipient_id, body, subject)
    sender = User.find(sender_id)
    recipient = User.find(recipient_id)
    sender.send_message(recipient, body, subject) 
  end
end