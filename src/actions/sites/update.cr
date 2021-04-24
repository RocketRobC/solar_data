class Sites::Update < BrowserAction
  put "/sites/:site_id" do
    SaveSite.update(site, params) do |op, updated_site|
      if op.saved?
        redirect to: Sites::Index
      else
        html EditPage, op: op, site: site
      end
    end
  end

  private def site
    SiteQuery.find(site_id)
  end
end
