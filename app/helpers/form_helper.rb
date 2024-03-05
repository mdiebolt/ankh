module FormHelper
  def eyebrow_classes
    "text-sm text-zinc-300"
  end

  def link_classes
    "underline hover:decoration-yellow-600"
  end

  def button_classes(additional_classes = "")
    "#{additional_classes} text-center border border-yellow-600 text-yellow-600 rounded-full cursor-pointer hover:bg-yellow-600 hover:text-white active:bg-yellow-700 active:text-white"
  end

  def card_container_classes(additional_classes = "")
    "#{additional_classes} w-56 h-72 mx-auto bg-zinc-800 rounded-xl px-6 py-4 text-pretty shadow-xl shadow-yellow-900/10"
  end
end
