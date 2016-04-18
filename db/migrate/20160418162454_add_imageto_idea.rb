class AddImagetoIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :image, :text
  end
end
