module Public::UsersHelper
  def profile_image_for(user, size: 50)
    image_url = user.profile_image.attached? ? url_for(user.profile_image) : asset_path("default-image.jpg")
    image_tag(image_url, class: "rounded-circle", style: "width: #{size}px; height: #{size}px; object-fit: cover;")
  end
end
