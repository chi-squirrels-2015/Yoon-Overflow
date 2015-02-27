require 'rails_helper'

describe Question do
  let(:question) { Question.new(title: "this is a title", content: "this is the content") }

  describe "#recent" do
    it 'scopes to the five most recent questions' do
      10.times do
        new_question = Question.new(title: "title", content: "this is a question")
        new_question.save
      end

      expect(Question.recent.length).to eq(5)
    end
  end

  describe 'validations' do
    it 'should return an error for a lack of title' do
      question.title = ''
      question.save
      expect(question.errors[:title]).to_not be_empty
    end

    it 'should return an error for a lack of content' do
      question.content = ""
      question.save
      expect(question.errors[:content]).to_not be_empty
    end

    it 'should accept any given input as a title' do
      question.title = 'this is the given input'
      question.save
      expect(question.errors[:title]).to be_empty
    end

    it 'should accept any given input as the content' do
      question.content = 'this is the given input'
      question.save
      expect(question.errors[:content]).to be_empty
    end
  end
end
