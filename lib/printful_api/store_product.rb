module PrintfulAPI

	class StoreProduct < APIResource
		include PrintfulAPI::APIOperations::List
		include PrintfulAPI::APIOperations::Get
    
                api_attributes :id, :external_id, :name, :variants, :synced, :thumbnail_url, :sync_product
    
                has_many :sync_variants, class: 'PrintfulAPI::SyncVariant', :inverse_of => :store_product
		has_many :files, class: 'PrintfulAPI::File', :inverse_of => :store_product

		def self.resource_path
		  '/store/products'
		end

		def load_data( data )
		   if data['product'].present?
		     super(data['product'])
		   else
		     super( data )
		   end
		end




	end

end
