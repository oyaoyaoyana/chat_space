module GroupHelper
  def last_message(group)
    # メッセージがあるかどうか？
    if group.messages.present?
      # メッセージが有る場合、文字か画像か
      group.messages.last.body.present? ? "#{group.messages.last.body}" : "画像あり"
    else
      "メッセージはありません。"
    end
  end
end
