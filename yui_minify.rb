	desc "JS/CSS Minifier"
	def minify(files)
		files.each do |file|
			cmd = "java -jar lib/yuicompressor-2.4.7.jar #{file} -o #{file}" #assuming you have the yuicompressor on your /lib folder
			puts cmd
			ret = system(cmd)
			raise "Minification failed for #{file}" if !ret
		end
	end
	
	desc "minify"
	  task :minify => [:minify_js, :minify_css]

	  desc "minify javascript"
	  task :minify_js do
		minify(FileList['src/scripts/**/*.js'])  #javascript file list 
	end

	desc "minify css"
		task :minify_css do
		minify(FileList['src/css/**/*.css']) #css file list
	end
end