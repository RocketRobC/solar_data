class AddSiteIdToEnergyRate::V20210331113147 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(EnergyRate) do
      add_belongs_to site : Site, on_delete: :cascade
    end
  end

  def rollback
    alter table_for(EnergyRate) do
      remove_belongs_to :site
    end
  end
end
