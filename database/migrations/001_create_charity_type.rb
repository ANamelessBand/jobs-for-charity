Sequel.migration do
  change do
    create_table(:charity_types) do
      primary_key :id, index: true
      String :name, size: 100, null: false, unique: true
      String :description, null:false
    end
  end
end
