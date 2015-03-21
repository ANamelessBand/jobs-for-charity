Sequel.migration do
  change do
    create_table(:charities) do
      primary_key :id, index: true
      String :title, size: 32, null: false
      String :description, null: false
    end
  end
end
