json.extract! resource, :id
json.name resource.name
json.url image_url(resource.thumb('600x600#').url)
