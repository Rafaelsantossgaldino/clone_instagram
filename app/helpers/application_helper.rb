module ApplicationHelper
  def embedded_svg(path)
    File.open("app/assets/images/#{path}", "rb") { |file| raw(file.read) }
  end

  def user_avatar(user)
    avatar = user.avatar.variant(combine_options: {resize_to_fill: '100x100^', extent: '100x100'}) if user.avatar.attached?
    avatar = "default-avatar.jpg"
    image_tag avatar, class: "photo"
  end
end
