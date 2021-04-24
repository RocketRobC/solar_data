class Sites::New < BrowserAction
  get "/sites/new" do
    html NewPage, op: SaveSite.new
  end
end
