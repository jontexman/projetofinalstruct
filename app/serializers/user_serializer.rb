class UserSerializer < ActiveModel::Serializer
include Rails.application.routes.url_helpers

  attributes :id, :name, :profile_pic, :email

  def profile_pic
    if object.image.attached?
      rails_blob_path(object.image, only_path: true)
    else
      'image not attached'
    end
  end
end