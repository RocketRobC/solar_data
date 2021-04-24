class CreateSites::V20210331105446 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Site) do
      primary_key id : Int64
      add_timestamps
      add site_id : String
      add api_key : String
      add base_api_url : String
    end
  end

  def rollback
    drop table_for(Site)
  end
end
