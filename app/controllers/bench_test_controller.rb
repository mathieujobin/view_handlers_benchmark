class BenchTestController < ApplicationController
	before_action :data_setup

	def erb
		render(locals: @locals)
	end

	def haml
		render(locals: @locals)
	end

	def slim
		render(locals: @locals)
	end

	def builder
		render(locals: @locals)
	end

	def report
		result = Benchmark.ips do |x|
			x.config(:time => 5, :warmup => 2)
			%w[erb haml slim builder].each do |handler|
				x.report(handler) do
					render_to_string(action: handler, locals: @locals)
				end
			end
			x.compare!
		end
		render text: result
	end

	private

	def data_setup
		@locals = {data: [[2]], year: Time.now.year, author: 'Mathieu Jobin'}
	end
end

