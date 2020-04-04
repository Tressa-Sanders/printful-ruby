module PrintfulAPI

	class File < APIResource
		include PrintfulAPI::APIOperations::List
		include PrintfulAPI::APIOperations::Get

		api_attributes :id, :type, :hash, :url, :filename, :mime_type, :size, :width, :height, :dpi, :status, :created, :thumbnail_url, :preview_url, :visible


		belongs_to :store_product, class: 'PrintfulAPI::StoreProduct', :inverse_of => :files

		def self.resource_path
		 '/store/products'
		end

	end

end
