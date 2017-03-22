module GroupHelper
  def last_message(group)
    if group.messages.present?
      if group.messages.last.body.present?
        "#{group.messages.last.body}"
      else
        "画像あり"
      end
    else
      "メッセージはありません。"
    end
  end
end
