#!/usr/bin/env ruby

require 'tty-prompt'
require 'shell-spinner'

class NCDocker
	def run
		select_template
		find_project
	end

	def select_template
		templates = {
			'swift-vapor' => 'Swift + Vapor toolbox',
			'swift-vapor-mysql' => 'Swift + Vapor toolbox + MySQL',
			'swift-vapor-redis' => 'Swift + Vapor toolbox + Redis',
			'swift-vapor-mysql-redis' => 'Swift + Vapor toolbox + MySQL + Redis'
		}

		begin
			prompt = TTY::Prompt.new
			projects = prompt.select("Select docker template", templates)
		rescue SystemExit, Interrupt
			exit
	        end
	end

	def find_project
		folders = {}

		Dir.chdir(File.dirname(__FILE__) + '/code')
		Dir.glob('*').select {
			|f| File.directory? f
			folders[f] = f
		}

		begin
			prompt = TTY::Prompt.new
			projects = prompt.select("Select project you want to start", folders)
		rescue SystemExit, Interrupt
			exit
	        end

		build_container
	end

	def build_container
		ShellSpinner 'Building docker container' do
			sleep(5)
		end
	end

	def run_container
		ShellSpinner 'Starting docker container' do
			sleep(5)
		end
	end
end

NCDocker::new::run
