class BenchTestController < ApplicationController
	before_action :data_setup

	def erb
	end

	def haml
	end

	def slim
	end

	def builder
	end

	private

	def data_setup
		render(locals: {data: [[2]], year: Time.now.year, author: 'Mathieu Jobin'})
	end
end

