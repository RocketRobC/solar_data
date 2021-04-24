require "./site_form.cr"

class Sites::NewPage < MainLayout
  needs op : SaveSite

  def content
    h1 "Create a new site"
    form
  end

  private def form
    form_for(Sites::Create) do
      para do
        label_for(op.site_id)
        text_input(op.site_id)
        error_for(op.site_id)
      end

      para do
        label_for(op.api_key)
        text_input(op.api_key)
        error_for(op.api_key)
      end

      para do
        label_for(op.base_api_url)
        text_input(op.base_api_url)
        error_for(op.base_api_url)
      end
      submit("Save", class: "btn")
    end
  end

  private def error_for(field)
    mount Shared::FieldErrors, field
  end
end
