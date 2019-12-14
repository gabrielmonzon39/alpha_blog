module ApplicationHelper
    def gravatar_for user
        gravatar_id = Digest::MD5::hexdigest(user.email)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=100"
        image_tag(gravatar_url, alt:"User Avatar", class: "img-thumbnail")
    end
end
