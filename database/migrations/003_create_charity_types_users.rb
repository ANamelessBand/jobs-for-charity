Sequel.migration do
  change do
    create_table(:charity_types_users) do
      primary_key :id
      foreign_key :user_id, :users
      foreign_key :charity_type_id, :charity_types
      unique [:user_id, :charity_type_id]
    end
  end
end