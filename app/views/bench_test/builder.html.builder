xml.html do
	xml.head do
		xml.title t('main.title')
	end
	xml.body do
		xml.h1 t('main.title')
		10.times do
			xml.p do
				data.each do |x|
					xml.pre do
						xml << JSON.pretty_generate(x)
					end
				end
			end
		end
		xml.div(id:="footer") do
			xml << "Copyright © #{year} #{author}"
		end
	end
end

