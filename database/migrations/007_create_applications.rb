Sequel.migration do
  change do
    create_table(:applications) do
      primary_key :id, index: true
      foreign_key :task_id, :tasks
      foreign_key :user_id, :users
      foreign_key :charity_id, :charities
      Decimal :share, precision: 2, null: false
      Integer :status, null: false, default: 0
      String :motivation, null: false
      Integer :rating, null: false, default: 0
    end
  end
end
