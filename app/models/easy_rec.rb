require 'rubygems'
require 'httparty'

class EasyRec
	include HTTParty
	format :xml
	
	base_uri  'http://demo.easyrec.org:8080'
	default_params :apikey => 'e1a327b126216a34ad8ea9bdddce6672', :tenantid => 'EASYREC_DEMO'
	
	#Actions
	
	def self.view(item, user, session_id)
		options = {:itemid => item.id, :userid => user.id, :sessionid => session_id, :itemdescription => item.description, :itemurl => item.url, :itemimageurl => item.image_url}
		get('/api/1.0/view', :query => options)
	end
	
	def self.buy(item, user, session_id)
		options = {:itemid => item.id, :userid => user.id, :sessionid => session_id, :itemdescription => item.description, :itemurl => item.url, :itemimageurl => item.image_url}
		get('/api/1.0/buy', :query => options)
	end
	
	def self.rate(item, user, session_id, rating_val)
		options = {:itemid => item.id, :userid => user.id, :sessionid => session_id, :itemdescription => item.description, :itemurl => item.url, :itemimageurl => item.image_url, :ratingvalue => rating_val}
		get('/api/1.0/rate', :query => options)
	end
	
	#User Recommmendations
	
	def self.others_viewed(item, user, max_results='1')
		options = {:itemid => item.id, :userid => user.id, :numberOfResults => max_results}
		get('/api/1.0/otherusersalsoviewed', :query => options)
	end
	
	def self.others_bought(item, user, max_results='1')
		options = {:itemid => item.id, :userid => user.id, :numberOfResults => max_results}
		get('/api/1.0/otherusersalsobought', :query => options)	
	end
	
	def self.others_liked(item, user, max_results='1')
		options = {:itemid => item.id, :userid => user.id, :numberOfResults => max_results}
		get('/api/1.0/itemsratedgoodbyotherusers', :query => options)	
	end
	
	def self.user_recommendations(user, max_results='1')
		options = {:userid => user.id, :numberOfResults => max_results}
		get('/api/1.0/recommendationsforuser', :query => options)
	end
	
	def self.related_items(item, max_results='1')
		options = {:itemid => item.id, :numberOfResults => max_results}
		get('/api/1.0/relateditems', :query => options)
	end
	
	#Global Recommendations
	
	def self.most_viewed(max_results='1', timeRange='ALL')
		options = {:itemid => item.id, :numberOfResults => max_results}
		get('/api/1.0/mostvieweditems', :query => options)
	end
	
	def self.most_bought(max_results='1', timeRange='ALL')
		options = {:itemid => item.id, :numberOfResults => max_results}
		get('/api/1.0/mostboughtitems', :query => options)
	end
	
	def self.most_rated(max_results='1', timeRange='ALL')
		options = {:itemid => item.id, :numberOfResults => max_results}
		get('/api/1.0/mostrateditems', :query => options)
	end
	
	def self.best_rated(max_results='1', timeRange='ALL')
		options = {:itemid => item.id, :numberOfResults => max_results}
		get('/api/1.0/bestvieweditems', :query => options)
	end
	
	def self.worst_rated(max_results='1', timeRange='ALL')
		options = {:itemid => item.id, :numberOfResults => max_results}
		get('/api/1.0/worstvieweditems', :query => options)
	end
	
	#Admin
	
	def self.get_token(username, password)
		options = {:operatorId => username, :password => password}
		get('/operator/signin', :query => options).token
end
