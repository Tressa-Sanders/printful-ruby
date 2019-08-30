module PrintfulAPI

	class SyncVariant < APIResource
		include PrintfulAPI::APIOperations::Get

    api_attributes :id, :external_id, :sync_product_id, :name, :synced, :variant_id, :retail_price, :currency
    
		belongs_to :store_product

    # def self.resource_path
    #   '/store/products/variant'
    # end

	end

end