#!/usr/bin/env ruby

require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'chunky_png'
require 'yaml'
require 'erb'

config = YAML.load_file('config.yml')

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

include Capybara::DSL

def capture_screenshot(url, resolution, output_path)
  width, height = resolution.split('x').map(&:to_i)
  page.driver.browser.manage.window.resize_to(width, height)
  visit(url)
  save_screenshot(output_path)
end

def compare_images(img1_path, img2_path, diff_output_path, threshold)
  img1 = ChunkyPNG::Image.from_file(img1_path)
  img2 = ChunkyPNG::Image.from_file(img2_path)

  raise 'Images are not the same size!' unless img1.dimension == img2.dimension

  diff = ChunkyPNG::Image.new(img1.width, img1.height, ChunkyPNG::Color::TRANSPARENT)
  diff_count = 0

  img1.height.times do |y|
    img1.width.times do |x|
      if img1[x, y] != img2[x, y]
        diff[x, y] = ChunkyPNG::Color.rgb(255, 0, 0)
        diff_count += 1
      end
    end
  end

  diff.save(diff_output_path)
  diff_percentage = (diff_count.to_f / (img1.pixels.length)) * 100

  puts "Comparison complete: #{diff_count} pixels differ (#{diff_percentage.round(2)}%)."
  exit(1) if diff_percentage > threshold
end

def generate_report(diffs)
  template = File.read('templates/report_template.html.erb')
  renderer = ERB.new(template)
  File.open('report.html', 'w') { |file| file.write(renderer.result(binding)) }
end

def formatted_path(base, resolution, url)
  "#{base}/#{resolution}_#{url.gsub(%r{https?://}, '').gsub('/', '_')}.png"
end

if ARGV.length != 2
  puts "Usage: vulture <url1> <url2>"
  exit(1)
end

url1, url2 = ARGV

diffs = config['resolutions'].map do |resolution|
  baseline_path = formatted_path('screenshots/baseline', resolution, url1)
  latest_path = formatted_path('screenshots/latest', resolution, url2)
  diff_path = formatted_path('screenshots/diff', resolution, "#{url1}_diff")

  capture_screenshot(url1, resolution, baseline_path)
  capture_screenshot(url2, resolution, latest_path)

  compare_images(baseline_path, latest_path, diff_path, config['threshold'])
  { url: url1, resolution: resolution, diff_path: diff_path }
end

generate_report(diffs)
