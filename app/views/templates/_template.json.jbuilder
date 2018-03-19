json.extract! template, :id, :title
json.image_url template.image.service_url
json.url template_url(template, format: :json)
