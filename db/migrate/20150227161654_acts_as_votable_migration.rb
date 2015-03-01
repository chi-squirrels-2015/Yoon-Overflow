class ActsAsVotableMigration < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|

      t.references :votable, :polymorphic => true
      t.references :voter, :polymorphic => true

      t.timestamps
    end
  end 

end
