#!/usr/bin/env ruby
# encoding: utf-8
# author: Matthew Dromazos

require 'thor'
require_relative 'version'
require_relative 'pdf2inspec'
require_relative 'write_to_inspec'

class MyCLI < Thor
  desc 'exec', 'pdf2inspec translates a PDF Security Control Speficication to Inspec Security Profile'
  option :pdf, required: true, aliases: '-p'
  option :excl, required: true, aliases: '-x'
  option :name, required: true, aliases: '-n'
  option :debug, required: false, aliases: '-d', :type => :boolean

  def exec
    pdf2inspec = Pdf2Inspec.new(options[:pdf], options[:excl], options[:name], options[:debug])
  end

  desc 'generate_map', 'Generates mapping template from CSV to Inspec Controls'
  def generate_map
    template = %q(
    # Setting csv_header to true will skip the csv file header
    skip_csv_header: true
    width   : 80


    control.id: 0
    control.title: 15
    control.desc: 16
    control.tags:
            severity: 1
            rid: 8
            stig_id: 3
            cci: 2
            check: 12
            fix: 10
    )
    myfile = File.new('mapping.yml', 'w')
    myfile.puts template
    myfile.close
  end

  map %w{--help -h} => :help
  desc 'help', 'Help for using pdf2inspec'
  def help
    puts "\tpdf2inspec translates a PDF Secuirty Profile to Inspec controls\n\n"
    puts "\t-f --pdf : Path and file of the PDF you would like to process"
    puts "\t-n --name : The name for your new InSpec profile"
    puts "\t-x --excl : The CIS to NIST mapping Excel file"
    puts "\t-d --debug : (boolean) Turns on / off debug data for parsing"
    puts "\nexample: ./pdf2inspec exec --pdf secureConfigruation.pdf --excl myControlMap.xls --name my_inspec_profile\n\n"
    puts "\nexample: ./pdf2inspec exec -f secureConfigruation.pdf -x myControlMap.xls -n my_inspec_profile\n\n --debug"
  end

  map %w{--version -v} => :print_version
  desc '--version, -v', "print's csv2inspec version"
  def print_version
    puts Pdf2inspec::VERSION
  end
end

MyCLI.start(ARGV)
