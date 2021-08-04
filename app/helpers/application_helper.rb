module ApplicationHelper

	def robot_facing(face)
		case face
		when 'north'
			return "<div>↑</div><div>🤖</div>".html_safe
		when 'south'
			return "<div>🤖</div> <div>↓</div>".html_safe
		when 'east'
			return "🤖 →"
		when 'west'
			return "← 🤖"
		end
	end
end
