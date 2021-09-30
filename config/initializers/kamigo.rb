class Echo
  attr_accessor :request
  attr_accessor :form_authenticity_token

  def process(event)
    {
      type: "text",
      text: event.message.tr("嗎", "").tr("？", "！")
    }
  end
end

Kamigo.setup do |config|
  # When user input doesn't match the route, Kamigo will pass the reuqest to default_path with default_http_method.
  # config.default_path = "test"
  # config.default_http_method = "POST"

  # When Kamigo don't know what message to reply, then Kamigo reply the line_default_message.
  # When line_default_message is nil, then Kamigo don't reply message.
  # config.line_default_message = nil

  config.line_event_processors << Echo.new
end