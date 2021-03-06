abstract class BaseModel < Avram::Model
  def self.database : Avram::Database.class
    AppDatabase
  end

  macro default_columns
    primary_key id : Int64
    timestamps
  end
end
