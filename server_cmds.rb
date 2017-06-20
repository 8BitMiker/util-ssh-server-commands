#!/usr/bin/ruby

class CMDS

	def initialize(file)
		
		@db = []
		n = nil
		
		if (File.exists?(file))

			File.open(file).each_line do |line|
			
				line.chomp!
				
				next if line =~ /^$|^\#\ /
				break if line =~ /\#SKIP/
				
				if line =~ /\[([^\[\]]+)\]:(.*)/
				
					n == nil ? n = 0 : n += 1
					@db[n] = []
					@db[n] << $2
					
					
				else
					
					@db[n] << line
				
				end
				
			
			end
			
			
		
		else
		
			abort "File Not Correct";
		
		end
			
	end # init
	
	def go
	
		@db.each do |array|
		
			(1..(array.length-1)).each do |i|
				
				puts %Q{ ssh #{array[0]} '#{ array[i] }'}
				# %x{ ssh #{array[0]} '#{ array[i] }' }
				system %Q{ ssh #{array[0]} '#{ array[i] }'}
			
			end
		
		end
		
		
	
	end

end

o = CMDS.new(ARGV[0].chomp)
o.go

__END__
[01VM]:mik3r\@vmicroscopy.dentistry.utoronto.ca
sudo apt-get update; sudo apt-get upgrade -y
# sudo shutdown -r now

#SKIP
