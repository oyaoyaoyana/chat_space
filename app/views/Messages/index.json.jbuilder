json.(@messages) do |message|
  json.name   message.user.name
  json.time   message.show_time
  json.body   message.body
  json.image  message.image.url
  json.id     message.id
end
