class CreateFollowships < ActiveRecord::Migration[5.2]
  def change
    create_table :followships do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :followee, foreign_key: true

      t.timestamps
    end
  end
end
