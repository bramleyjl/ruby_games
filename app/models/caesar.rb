class Caesar < ApplicationRecord

  def cipher(message, key)
    key = key.to_i % 26
    self.key = key
    self.message = message
    p self.key, self.message
    code = String.new
    message.split("").each do |character|
      if character.match(/[A-Z]/)
        if character.ord + key > 90
          changed = (character.ord  - 26) + key
          code << changed.chr
        elsif character.ord + key < 65
          changed = (character.ord + 26) + key
          code << changed.chr
        else
          changed = character.ord + key
          code << changed.chr
        end
      elsif character.match(/[a-z]/)
        if character.ord + key > 122
          changed = (character.ord - 26) + key
          code << changed.chr
        elsif character.ord + key < 97
          changed = (character.ord + 26) + key
          code << changed.chr
        else
          changed = character.ord + key
          code << changed.chr
        end
      else
        code << character  
      end
    end
      self.code = code
  end

end