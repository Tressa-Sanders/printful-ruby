module PrintfulAPI

	class StoreProduct < APIResource
		include PrintfulAPI::APIOperations::List
		include PrintfulAPI::APIOperations::Get

		#api_attributes :id, :type, :brand, :model, :image, :variant_count, :dimensions
    
                api_attributes :id, :external_id, :name, :thumbnail_url, :variants, :synced, :sync_variants
    
    
		# has_many :allowed_files, class: 'PrintfulAPI::FileType'
		has_many :files, class: 'PrintfulAPI::FileType'
		# has_many :allowed_options, class: 'PrintfulAPI::OptionType'
		has_many :options, class: 'PrintfulAPI::OptionType'
    
    has_many :sync_variants, class: 'PrintfulAPI::SyncVariant'

    # def variants
    #   @variants ||= PrintfulAPI::Variant.list( product_id: self.id )
    #   @variants
    # end
    
		def sync_variants
			@sync_variants ||= PrintfulAPI::SyncVariant.list( sync_product_id: self.id )
			@sync_variants
		end

		def self.resource_path
			'/store/products'
		end

		def load_data( data )

			if data['product'].present?

				super(data['product'])

        # @variants = data['variants'].collect do |variant_data|
        #   variant = PrintfulAPI::Variant.new.load_data( variant_data )
        #   variant.product = self
        #   variant
        # end
        
				@sync_variants = data['sync_variants'].collect do |sync_variant_data|
					variant = PrintfulAPI::SyncVariant.new.load_data( sync_variant_data )
					variant.sync_product = self
					variant
				end

			else

				super( data )

			end

		end




	end

end
