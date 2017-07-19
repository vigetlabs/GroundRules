json.array! collection do |photo|
  json.extract! photo, :id
  json.name photo.name
  json.url image_url(photo.thumb('300x300#').url)
end
