# Encrypted Pioneers
# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

ROT13_TABLE = 

def decrypt_letter_rot13(letter)
  case letter
  when 'a'..'m', 'A'..'M' then (letter.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (letter.ord - 13).chr
  else                         letter
  end
end

def decrypt_text_rot13(secret)
  secret.each_char.reduce('') do |result, letter|
    result + decrypt_letter_rot13(letter)
  end
end

names = 
["Nqn Ybirynpr",
 "Tenpr Ubccre",
 "Nqryr Tbyqfgvar",
 "Nyna Ghevat",
 "Puneyrf Onoontr",
 "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
 "Wbua Ngnanfbss",
 "Ybvf Unvog",
 "Pynhqr Funaaba",
 "Fgrir Wbof",
 "Ovyy Tngrf",
 "Gvz Orearef-Yrr",
 "Fgrir Jbmavnx",
 "Xbaenq Mhfr",
 "Fve Nagbal Ubner",
 "Zneiva Zvafxl",
 "Lhxvuveb Zngfhzbgb",
 "Unllvz Fybavzfxv",
 "Tregehqr Oynapu"]

names.each do |name|
  puts decrypt_text_rot13(name)
end

=begin

Ada Lovelace
Grace Hopper
Adele Goldstine
Alan Turing
Charles Babbage
Abdullah Muhammad bin Musa al-Khwarizmi
John Atanasoff
Lois Haibt
Claude Shannon
Steve Jobs
Bill Gates
Tim Berners-Lee
Steve Wozniak
Konrad Zuse
Sir Antony Hoare
Marvin Minsky
Yukihiro Matsumoto
Hayyim Slonimski
Gertrude Blanch

=end
