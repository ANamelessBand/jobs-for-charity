Sequel.migration do
  change do
    create_table(:tasks) do
      primary_key :id, index: true
      String :title, size: 32, null: false
      String :description, null: false
      String :location, size: 32, null: false
      Integer :state, null: false, default: 0
      Decimal :award, null: false, precision: 2
    end
  end
end
