# https://github.com/primer/view_components/blob/main/lib/primer/class_name_helper.rb
module ClassNameHelper
  def class_names(*args)
    classes = []

    args.each do |class_name|
      case class_name
      when String
        classes << class_name if class_name.present?
      when Hash
        class_name.each { |key, val| classes << key if val }
      when Array
        classes << class_names(*class_name).presence
      end
    end

    classes.compact.uniq.join(" ")
  end
end
