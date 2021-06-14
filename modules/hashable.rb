module Hashable
  def message_output(type, message, key)
    {
       type.to_sym => message,
       :key => key.key,
       :date => key.date
     }
  end
end
