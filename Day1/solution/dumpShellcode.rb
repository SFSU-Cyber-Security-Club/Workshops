#!/bin/ruby


input = $stdin.read()
cachedOut = "lol"
bytes = []

begin
        cachedOut = input.split("\n")
rescue
        puts "file should be a objdumper format"
        exit
end


if not cachedOut[1] =~ /file format/
       puts "file should be a objdumper format"
       exit()
end


for x in cachedOut
  if not x.empty? 
        cutX = x[10..-1]
        firstOccurence =  cutX =~ /\t/
        #p cutX

        if firstOccurence != nil
                parsed_bytes = cutX[0..firstOccurence].scan(/[0-9a-f][0-9a-f]/)
                 
                for byte in parsed_bytes
                        bytes.append(byte)
                end
                
                 
        end 
    end
end

shellcode = ''
shellcode_size = bytes.length()

for poop in bytes
        shellcode += '\x' + poop
end

puts '[**] Yay Extraction [**]'
puts shellcode
puts "[**] length is #{shellcode_size}"
