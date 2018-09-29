# Custom renderer for redcarpet
module SatoMarkdown
  class Render < Redcarpet::Render::HTML
    # Embeb base64 image instead of linking
    def image(link, title, alt_text)
    end
  end
end
