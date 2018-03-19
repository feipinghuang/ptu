class Facepp
  include HTTParty
  base_uri 'https://api-cn.faceplusplus.com'
  default_params Rails.application.credentials.facepp

  def detect(image_file)
    options = { body: { image_file: image_file } }
    self.class.post('/facepp/v3/detect', options)
  end

  def detect_face_rectangle(image_file)
    result = detect(image_file)
    fr = result["faces"].first["face_rectangle"]
    "#{fr['top']},#{fr['left']},#{fr['width']},#{fr['height']}"
  end

  def mergeface(template_file:, template_rectangle:, merge_file:, merge_rectangle:)
    options = {
      body: {
        template_file: File.open(template_file),
        template_rectangle: template_rectangle,
        merge_file: File.open(merge_file),
        merge_rectangle: merge_rectangle
      }
    }
    self.class.post('/imagepp/v1/mergeface', options)
  end
end
