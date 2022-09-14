def make_snippet(text)
    split_text = text.split(" ")
    split_text.length <= 5 ? split_text.join(" ") : split_text.first(5).join(" ") + " ..."
end