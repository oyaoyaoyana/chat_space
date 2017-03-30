module GroupHelper
  def last_message(group)
    if group.messages.present?
      group.messages.last.body.present? ? "#{group.messages.last.body}" : "画像あり"
    else
      "メッセージはありません。"
    end
  end
end
