class WebhookNotifier
  def initialize(article)
    @article = article
    @endpoints = Rails.application.config.webhooks[:endpoints]
    @secret_token = Rails.application.config.webhooks[:secret_token]
  end

  def notify
    @endpoints.each do |endpoint|
      response = HTTParty.post(endpoint, headers: headers, body: payload)
      Rails.logger.info "Notified #{endpoint}: #{response.body}"
    end
  end

  private

  def headers
    {
      'Content-Type' => 'application/json',
      'Authorization' => "Bearer #{@secret_token}"
    }
  end

  def payload
    {
      post: {
        id: @article.id,
        title: @article.title,
        content: @article.content,
        updated_at: @article.updated_at
      }
    }.to_json
  end
end
