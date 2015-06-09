require_relative '../spec_helper'

describe "create table with correct schema" do
  it "has a Students table" do
    expect(ActiveRecord::Base.connection.table_exists?(:students)).to be_truthy
  end

  it "has the right columns and types" do
    expected_column_types_and_columns = {
      :integer  => ["id"],
      :string   => ["first_name", "last_name", "phone"],
      :date     => ["birthday"],
      :datetime => ["created_at", "updated_at"]
    }

    ActiveRecord::Base.connection.columns(:students).each do |col|
      expect(expected[col.type]).to include(col.name)
    end
  end
end
