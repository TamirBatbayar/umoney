module ApplicationHelper

	def all_pages
  		@pages = PageContent.all
  		return @pages
	end

	def get_slides
		slides = Slide.all
		return slides
	end

	def get_lessons(page_content_id)
		lessons = Lesson.where(:page_content_id => page_content_id)
		return lessons
	end

	def get_mac_address(ip_address)
		`ping -c 1 #{request.ip}`
		sleep(10) # For dramatic effect
		arptable = `arp -a`
		entries = arptable.split("\n")
		# ipmap = {}
		# entries.each do |e|
		#   ent = e.split(" ")
		#   ipmap["#{ent[1].gsub(/\(|\)/, "")}"] = ent[3]
		# end
		# puts imap["#{request.ip}"]

		return entries
	end
end
