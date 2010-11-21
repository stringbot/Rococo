#!/usr/bin/env ruby
require 'rubygems'
require 'rocco'

# Rococo takes a github file's URL and generates a Rocco doc page for the source
# file
module Rococo

  # Retrieve the raw file and stash it in /tmp
  def get_raw_github(url)
    raw_url = url.gsub('/blob/', '/raw/')

    # snarf the filename with a regex
    filename = (raw_url =~ /^.*\/(.*)$/) && $1
    raise "No file found at #{raw_url}" unless filename

    filename = "/tmp/#{filename}"
    system("curl -o #{filename} #{raw_url}") || raise("Failed to fetch #{raw_url}")
    filename
  end

  # Parse it to HTML with Rocco
  def rocco_html(filename)
    rocco = Rocco.new(filename)
    rocco.to_html
  end

  # Publish it
  def write_to_tmp(filename, rocco_html)
    html_file = "#{filename}.html"
    File.open(html_file, 'w') do |f|
      f << rocco_html
    end
    html_file
  end

  # Open it with a browser.
  def open_in_system_browser(html_file)
    # for now this only works on Mac OS X
    system("open #{html_file}")
  end
end

include(Rococo)

github_url  = $ARGV[0] || raise("Please provide a github source file URL")
filename    = get_raw_github(github_url)
html_file   = write_to_tmp(filename,  rocco_html(filename))
open_in_system_browser(html_file)