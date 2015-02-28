class CreateVotes < ActiveRecord::Migration
  def votes
   create_table :votes do |t|
      t.references :votable, polymorphic: true, index: true
      
      t.timestamps
    end
  end
end
