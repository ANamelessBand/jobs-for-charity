Sequel.migration do
  change do
    create_table(:tasks) do
      primary_key :id, index: true
      foreign_key :user_id, :users
      String :title, size: 32, null: false
      String :description, null: false
      String :location, size: 32, null: false
      Integer :state, null: false, default: 0
      Decimal :reward, null: false, precision: 2
    end
  end
end
