class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :profile_pic, :email
end
