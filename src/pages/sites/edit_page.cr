require "./site_form.cr"

class Sites::EditPage < MainLayout
  include Sites::SiteForm

  needs op : SaveSite
  needs site : Site

  def content
    h1 "Edit Site"
    form(Sites::Update.with(site_id: site.id))
  end

  private def form(action)
    form_for(action) do
      para do
        label_for(op.site_id)
        text_input(op.site_id, value: site.site_id)
        error_for(op.site_id)
      end

      para do
        label_for(op.api_key)
        text_input(op.api_key, value: site.api_key)
        error_for(op.api_key)
      end

      para do
        label_for(op.base_api_url)
        text_input(op.base_api_url, value: site.base_api_url)
        error_for(op.base_api_url)
      end
      submit("Save", class: "btn")
    end
  end

  private def error_for(field)
    mount Shared::FieldErrors, field
  end
end
