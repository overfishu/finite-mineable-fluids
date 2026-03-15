-- 			infinite	mining_time	amount_min	amount_max
-- crude-oil		true		1		10		10
-- sulfuric-acid	true		1		10		10
-- lithium-brine	false		1		 1		 1
-- fluorine		true		1		 1		 1

for _, resource in pairs(data.raw.resource) do
	if resource.infinite then
		resource.infinite = false
		for _, result in pairs(resource.minable.results) do
			resource.minable.mining_time = resource.minable.mining_time / result.amount_min
			result.amount_min = result.amount_min * resource.minable.mining_time
          		result.amount_max = result.amount_max * resource.minable.mining_time
          		-- error(string.format("mining time: %f, amount min: %i, amount max: %i", resource.minable.mining_time, result.amount_min, result.amount_max))
          	end
	end
end

