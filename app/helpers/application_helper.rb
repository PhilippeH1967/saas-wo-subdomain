module ApplicationHelper

  def avatar_url(user)
    #gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    #"https://www.gravatarcom/avatar/#{gravatar_id}.jpg?d=identical&s=150"
    user.avatar.url
  end
end
