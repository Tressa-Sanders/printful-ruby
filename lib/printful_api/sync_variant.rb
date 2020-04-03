module PrintfulAPI

	class SyncVariant < APIResource
		include PrintfulAPI::APIOperations::Get

                api_attributes :id, :external_id, :sync_product_id, :name, :synced, :variant_id, :retail_price, :currency, :price, :size, :image, :color, :color_code, :color_code2, :in_stock, :product_id
    
		belongs_to :store_product

		def self.resource_path
		 '/store/products/'
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
