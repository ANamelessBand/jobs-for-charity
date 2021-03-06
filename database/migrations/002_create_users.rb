Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id, index: true
      String :username, size: 32, unique: true, null: false
      String :email, null: false, unique: true
      String :password, null: false
    end
  end
end
