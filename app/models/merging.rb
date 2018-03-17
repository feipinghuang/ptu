class Merging < ApplicationRecord
  belongs_to :template
  belongs_to :actor
  has_one_attached :image

  after_create :face_merge

  def face_merge
    mf = Facepp.new.mergeface(
           template_file: template.image_file, template_rectangle: template.rectangle,
           merge_file: actor.image_file,
           merge_rectangle: actor.rectangle)
    self.image.attach(io: StringIO.new(Base64.decode64(mf['result'])), filename: "#{Time.now.to_i}.jpg", content_type: 'image/jpg')
  end
end
