class Sites::Edit < BrowserAction
  get "/sites/:site_id/edit" do
    html EditPage, op: SaveSite.new, site: site
  end

  private def site
    SiteQuery.find(site_id)
  end
end
