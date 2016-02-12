require_relative './utils/helper_sitemap'
require_relative './utils/helper_download'

class Download
  def initialize(*args)
    @urls = HelperSitemap.get_urls(*args)
  end

  def run
    # Download all files on disk
    HelperDownload.download(@urls)
  end
end
# Takes a list of sitemaps as input and will download all the files in ti
# require_relative './utils/master_downloader.rb'
# 
# # Accepts sitemap(s) as input, will download webpages for each element in the
# # sitemap, extract data, and create a json file on disk
# class Downloader
#   include MasterDownloader
# 
#   def initialize(*args)
#     @sitemaps = filepath_from_args args
#     @prefix = 'http://www.smashingmagazine.com/'
#   end
# 
#   # This must be 
#   def get_pages(sitemap)
#     doc = Nokogiri::XML(File.open(sitemap))
#     pages = doc.css('url').map do |element|
#       url = element.css('loc').text
# 
#       # Some items do not have date, we skip them
#       string_date = element.css('lastmod').text
#       next unless string_date.length > 0
# 
#       {
#         url: url,
#         priority: element.css('priority').text.to_f
#       }
#     end
#     pages.compact.uniq { |page| page[:url] }.sort_by { |page| page[:url] }
#   end
# 
#   def escape_tags(html)
#     html.gsub('<', '&lt;').gsub('>', '&gt;')
#   end
# 
#   def get_object_id(doc)
#     url = doc.css('meta[property="og:url"]').attribute('content').text
#     url.gsub(@prefix, '').gsub('/', '_')
#   end
# 
#   def get_title(doc)
#     title = doc.css('meta[property="og:title"]').attribute('content').text
#     title.gsub(' – Smashing Magazine', '')
#     escape_tags(title)
#   end
# 
#   def get_type(doc)
#     doc.css('meta[property="og:type"]').attribute('content').text
#   end
# 
#   def get_description(doc)
#     description = doc.css('meta[property="og:description"]')
#       .attribute('content').text
#     escape_tags(description)
#   end
# 
#   def get_description_short(doc)
#     description = get_description(doc)
#     ActionView::Base.new.truncate(description, length: 200)
#   end
# 
#   def get_tags(doc)
#     doc.css('meta[property="article:tag"]').map do |meta|
#       meta.attribute('content').text
#     end
#   end
# 
#   def get_section(doc)
#     doc.css('meta[property="article:section"]').attribute('content').text
#   end
# 
#   def get_image(doc)
#     doc.css('meta[name="twitter:image"]').attribute('content').text
#   end
# 
#   def get_author(doc)
#     doc.css('meta[name="twitter:creator"]').attribute('content').text
#   end
# 
#   def get_published_date(doc)
#     string_date = doc.css('meta[property="article:published_time"]')
#       .attribute('content').text
#     DateTime.parse(string_date).to_time.to_i
#   end
# 
#   def get_modified_date(doc)
#     element = doc.css('meta[property="article:modified_time"]')
#     return get_published_date(doc) unless element.length > 0
#     string_date = element.attribute('content').text
#     DateTime.parse(string_date).to_time.to_i
#   end
# 
#   def get_comment_count(doc)
#     element = doc.css('li.comments[property=discussionUrl]')
#     return nil unless element.length > 0
#     element.text.gsub(' Comments', '').strip.to_i
#   end
# 
#   def extract_more_data(data)
#     raw = get_raw_content(data[:url])
# 
#     doc = Nokogiri::HTML(raw)
#     data = {
#       objectID: get_object_id(doc),
#       url: data[:url],
#       priority: data[:priority],
#       title: get_title(doc),
#       type: get_type(doc),
#       description: get_description(doc),
#       description_short: get_description_short(doc),
#       tags: get_tags(doc),
#       section: get_section(doc),
#       image: get_image(doc),
#       published_date: get_published_date(doc),
#       modified_date: get_modified_date(doc),
#       author: get_author(doc),
#       comment_count: get_comment_count(doc)
#     }
# 
#     data
#   end
# 
#   def output_name(data)
#     'articles/' + data[:objectID]
#   end
# end
