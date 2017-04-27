#requirements
require 'bio'
require 'dna'
require 'pry'
#
# module SavorySequenceOMeter
#   class Savoriness

#hashmap aka python dictionary
hash_map = {"!"=>0,
 "\""=>1,"#"=>2,"$"=>3,"%"=>4,"&"=>5,"'"=>6,"("=>7,")"=>8,"*"=>9,"+"=>10,","=>11,
 "-"=>12,"."=>13,"/"=>14,"0"=>15,"1"=>16,"2"=>17,"3"=>18,"4"=>19,"5"=>20,"6"=>21,
 "7"=>22,"8"=>23,"9"=>24,":"=>25,";"=>26, "<"=>27,"="=>28,">"=>29,"?"=>30,"@"=>31,
 "A"=>32,"B"=>33,"C"=>34,"D"=>35,"E"=>36,"F"=>37,"G"=>38,"H"=>39,"I"=>40,"J"=>41,
 "K"=>42,"L"=>43,"M"=>44,"N"=>45,"O"=>46,"P"=>47,"Q"=>48,"R"=>49,"S"=>50,"T"=>51,
 "U"=>52,"V"=>53,"W"=>54,"X"=>55,"Y"=>56,"Z"=>57,"["=>58,"\\"=>59,"]"=>60,"^"=>61,
 "_"=>62,"`"=>63,"a"=>64,"b"=>65,"c"=>66,"d"=>67,"e"=>68,"f"=>69,"g"=>70,"h"=>71,
 "i"=>72,"j"=>73,"k"=>74,"l"=>75,"m"=>76,"n"=>77,"o"=>78,"p"=>79,"q"=>80,"r"=>81,
 "s"=>82,"t"=>83,"u"=>84, "v"=>85,"w"=>86,"x"=>87,"y"=>88,"z"=>89,"{"=>90,"|"=>91,
 "}"=>92,"~"=>93}

puts 'File Directory?'
sp1 = gets.chomp
sp1.to_str
# sp1 = '/Users/sarahvch/Downloads/SP1.fq'

#open file parse using DNA
File.open(sp1) do |handle|
  records = Dna.new handle

  #creates empty arrays needed later
  qual_array = Array.new
  avg_array = Array.new

  #splits quatily score into an array
  records.each do |record|
      array = record.quality.split("")
      record_score = 0
      total_nucleotides = 0

      #iterates over teh array and assigns a number value
      #adds up array
    array.each do |letter|
      total_nucleotides = array.count
      record_score += hash_map[letter]
    end
      quaility_percent = 0
      quaility_percent = ((record_score.to_f/(total_nucleotides.to_f*93))*100).round
      # quaility_percent = (record_score/(total_nucleotides*93))*100
      puts "Snippet: #{record.name} \nScore: #{record_score} \nPercent of Total Quality: #{quaility_percent}\nQuality: #{record.quality}\ntotal bases: #{total_nucleotides}\n\n"
      qual_array.push(record_score)
      avg_array.push(quaility_percent)
    end

    #calculates total reads
    #calculates average quality score
    calculations = Dna.new handle
    record_total = calculations.count
    puts "total reads: #{record_total}"
    total = qual_array.inject(0){|sum,x| sum + x}
    avg_total = avg_array.inject(0){|sum,x| sum + x}
    avg = (avg_total / record_total)
    puts "avg percent: #{avg}"
  end
