class Sites::IndexPage < MainLayout
  needs sites : SiteQuery

  def content
    h1 "Sites"
    table do
      tr do
        th "Site ID"
        th "API Key"
        th "URL"
      end
      sites.each do |site|
        tr do
          td { link(site.site_id, to: Sites::Edit.with(site.id)) }
          td site.api_key
          td site.base_api_url
        end
      end
    end
  end
end
