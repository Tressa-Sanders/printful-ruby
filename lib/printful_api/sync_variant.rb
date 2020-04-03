module PrintfulAPI

	class SyncVariant < APIResource
		include PrintfulAPI::APIOperations::Get

                api_attributes :id, :external_id, :sync_product_id, :name, :synced, :variant_id, :retail_price, :currency
    
		belongs_to :store_product, :inverse_of => :sync_variants
                accepts_nested_attributes_for :store_product

		#def self.resource_path
		# '/store/products/'
		#end
		
		#def load_data( data )
		# if data['product'].present?
		#   super(data['product'])
		# else
		#   super( data )
		# end
		#end
		
	end

end
