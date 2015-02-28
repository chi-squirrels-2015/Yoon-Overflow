require 'rails_helper'

describe Comment do
  let(:author)  { User.create( name: "Fake", email: "fake@fake.net", password: "password" ) }
  let(:comment) { Comment.new( content: "This is some content", commentable_type: "Question",
                               commentable_id: 1, author: author) }

  context 'valid paramaters are given' do
    it 'should have content' do
      expect(comment.content).to_not be_nil
      expect(comment.content).to eq("This is some content")
    end

    it 'should have a commentable_type' do
      expect(comment.commentable_type).to_not be_nil
      expect(comment.commentable_type).to eq("Question")
    end

    it 'should have a commentable_id' do
      expect(comment.commentable_id).to_not be_nil
      expect(comment.commentable_id).to eq(1)
    end

    it 'should have an author' do
      expect(comment.author).to_not be_nil
      expect(comment.author).to eq(author)
    end

    it 'should save when valid paramaters are given' do
      expect{ comment.save }.to change { Comment.count }
    end
  end

  context 'invalid paramaters are given' do
    it 'should return an error when author is empty' do
      comment.author = nil
      comment.save
      expect(comment.errors[:author]).to_not be_empty
    end

    it 'should return an error when no content is given' do
      comment.content = ""
      comment.save
      expect(comment.errors[:content]).to_not be_empty
    end

    context 'not saving when any invalid paramaters are given' do
      it "should not save when content is invalid" do
        comment.content = ""
        expect{ comment.save }.to_not change { Comment.count }
      end

      it "should not save when author is invalid" do
        comment.author = nil
        expect{ comment.save }.to_not change { Comment.count }
      end
    end
  end
end
