class BufferJob < ActiveJob::Base
  queue_as :default

  def perform(content)
    buffer = Buffer::Client.new(ENV['BUFFER_ACCESS_TOKEN'])
    buffer.create_update(content)
  end
end
