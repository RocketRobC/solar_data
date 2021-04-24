class Sites::Create < BrowserAction
  post "/sites" do
    SaveSite.create(params) do |op, site|
      if site
        redirect to: Sites::Index
      else
        html NewPage, op: op
      end
    end
  end
end
