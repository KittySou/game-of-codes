json.array! @deck.questions do |question|
  json.content question.content
  json.answers question.answers do |answer|
    json.id answer.id.to_s
    json.content answer.content
    json.rightAnswer answer.right_answer
  end
end
