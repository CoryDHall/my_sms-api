message ||= @message
json.extract! message, :id, :phone, :body, :status, :sent_at, :error_message
