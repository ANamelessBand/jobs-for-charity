Sequel.migration do
  change do
    create_table(:charities_charity_types) do
      primary_key :id
      foreign_key :charity_id, :charities
      foreign_key :charity_type_id, :charity_types
      unique [:charity_id, :charity_type_id]
    end
  end
end
