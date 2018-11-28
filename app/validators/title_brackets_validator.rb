class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << 'Brackets are not balanced!'  unless balanced_brackets?(record.title)
    record.errors[:base] << 'Brackets cannot be empty!'   unless !empty_brackets?(record.title)
  end

  def balanced_brackets?(str)
    stack   = []
    lookup  = { '(' => ')', '[' => ']', '{' => '}' }
    left    = lookup.keys
    right   = lookup.values

    str.each_char do |char|
      if left.include?(char)
        stack << char
      elsif right.include?(char)
        return false if stack.empty? || (lookup[stack.pop] != char)
      end
    end
    stack.empty?
  end

  def empty_brackets?(str)
    empty_brackets = %w[ () [] {} ]
    empty_brackets.any? { |x| str.include?(x) }
  end
end
