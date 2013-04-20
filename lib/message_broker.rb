require "torquebox-messaging"

class MessageBroker
  def initialize
    @topic = TorqueBox::Messaging::Topic.start("/topics/global_messages")
  end

  def send_to_all(message)
    @topic.publish(message, encoding: :text)
  end

  def receive(&blk)
    loop do
      @topic.receive(durable: false, &blk)
    end
  end
end
