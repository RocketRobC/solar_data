class Sites::Index < BrowserAction
  get "/sites" do
    html IndexPage, sites: SiteQuery.new
  end
end
