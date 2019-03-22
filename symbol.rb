#!/usr/bin/ruby

tokens = [' ']
ids = []
key_words = ['int', 'string', 'char', 'float', 'double']
operators = ['+', '-', '*', '/', '=', '<', '>']
simbols = [ '(', ')', '{', '}', '[', ']', ',']

#int a , b = 10 ;
#float c = A ;
#double facto ( int b );

line_num = 0
text = File.open('text.txt').read
text.gsub!(/\r\n?/, "\n")
text.each_line do |line|
  print "#{line_num += 1} #{line}\n"
  tokens = tokens + (line.split(" "))
end

tokens.each_with_index do |t, pos|
  key_words.each do |k|
    if t == k 
      ids  << (tokens[pos + 1])
      if (tokens[pos + 2] == ',')
        puts(tokens[pos + 1] + " " + tokens[pos] + " " + " NULL")
        tokens.insert(pos + 3, tokens[pos])
      elsif tokens[pos + 2] == '('
        fin = tokens.index(')')
        para = tokens[pos + 3 , fin]
        kc = 0
        pt = []
        key_words.each do |key|
          kc = kc + para.count(key)
          i = 0
          while (i < para.count(key)) do
            pt << key
            i = i + 1
          end
        end
        puts(tokens[pos + 1] + " \t" + tokens[pos] + " \t" + kc.to_s + "\t" + pt.to_s)
      elsif tokens[pos - 1] == '('
        next
      else 
        print(tokens[pos + 1] + " " + tokens[pos] + " \t" + tokens[pos + 3] + "\n")
      end
    end
  end
end
