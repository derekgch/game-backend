require_relative '../words.rb'

class Word < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites

  def self.seed
    puts "ww"
    allwords.each do |key, value|
      Word.find_or_create_by(word: key, def: value);
    end
  end

  def self.addLength
    Word.all.each do |element|
      element.length = element.word.length
      element.save
    end
  end

  def self.random(short = true)
    if(short)
      result = self.short
    else
      result = self.long
    end
    result[rand(result.length)]
  end

  def self.random_hard
    result = self.hard
    result[rand(result.length)]
  end

  def self.short
    Word.all.select do |element|
      element.length < 6 && element.length > 2
    end
  end

  def self.long
    Word.all.select do |element|
      element.length > 5 && element.length < 11
    end
  end


  def self.hard
    Word.all.select do |element|
      element.length > 10
    end
  end

end
