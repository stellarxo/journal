class AddFieldsToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :steps, :integer
    add_column :entries, :nutrition, :text
    add_column :entries, :exercise, :text
    add_column :entries, :water, :float
    add_column :entries, :average_mood, :integer
    add_column :entries, :energy_level, :integer
    add_column :entries, :sleep, :float
    add_column :entries, :meditation, :float
  end
end
