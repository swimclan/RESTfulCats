class Cat < ActiveRecord::Base

	def to_s
		"Cat no: #{self.id} with a name of #{self.name} and is a #{self.breed}"
	end

end
