require "tf_idf_rb/version"
require "natto"
require "mecab"

module TfIdfRb
  natto = Natto::MeCab.new
  def Docment
    # TF
    texts = gets.to_i
    num = 0
    tf = {}
    texts.each do |text|
      tf[text[0]] = {}
      word_count = 0
      natto.parse(text[0]) do |n|
        if n.feature.split(',')[0] == '名詞'
          num += 1
          if tf[text[0]][n.surface].nil?
            tf[text[0]][n.surface] = 1
          else
            tf[text[0]][n.surface] += 1
          end
        end
        #word_count += 1
      end
      tf[text[0]].each do |word|
        tf[text[0]][word[0]] = word[1].to_f / num.to_f
        # puts "#{num} #{word[1]} #{word[0]}"
      end
    end
  end
end
