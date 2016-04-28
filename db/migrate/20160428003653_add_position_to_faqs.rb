class AddPositionToFaqs < ActiveRecord::Migration[5.0]
  def change
    add_column :faqs, :position, :integer
  end
end
