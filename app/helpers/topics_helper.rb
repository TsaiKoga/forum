# -*- encoding : utf-8 -*-
module TopicsHelper
  def render_topic_node_select_tag(topic)
    return if topic.blank?
    grouped_collection_select :topic, :node_id, Section.all,
                    :sorted_nodes, :name, :id, :name, {:value => topic.node_id,
                    :include_blank => true, :prompt => "选择节点"}, :style => "width:145px;"
  end
	
	def topic_favorite_tag(topic)
    return "" if current_user.blank?
		class_name = "bookmark"
		link_title = "收藏"
		favorite_topic_ids = current_user.favorite_topic_ids.nil? ? [] : current_user.favorite_topic_ids.split(",")
		if current_user and favorite_topic_ids.include?(topic.id.to_s)
			class_name = "bookmarked"
			link_title = "取消收藏"
		end
		link_to "", "#", onclick: "return Topics.favorite(this);", 'data-id' => topic.id, class: "icon small_#{class_name}", title: link_title
	end

end
