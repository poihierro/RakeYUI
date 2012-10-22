	desc "JS/CSS Minifier"
	def minify(files)
		files.each do |file|
			cmd = "java -jar lib/yuicompressor-2.4.7.jar #{file} -o #{file}"
			puts cmd
			ret = system(cmd)
			raise "Minification failed for #{file}" if !ret
		end
	end
	
	desc "minify"
	  task :minify => [:minify_js, :minify_css]

	  desc "minify javascript"
	  task :minify_js do
		minify(FileList['src/scripts/areas/**/*.js'])  #javascript file list 
	end

	desc "minify css"
		task :minify_css do
		minify(FileList['src/themes/v1/css/**/*.css']) #css file list
	end
end