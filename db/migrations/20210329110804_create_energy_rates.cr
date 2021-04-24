class CreateEnergyRates::V20210329110804 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(EnergyRate) do
      primary_key id : Int64
      add_timestamps
      add export_cents : Int32
      add import_cents : Int32
      add from_time : Time
      add to_time : Time
    end
  end

  def rollback
    drop table_for(EnergyRate)
  end
end
