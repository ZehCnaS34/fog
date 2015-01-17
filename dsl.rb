require 'fog'

document :something do
  title "that awesome"
  sub_title "this is the subtitle"
  section :sub do
    title "this awesome"
    sub_title "this is the test"
    field do
      question "this is the question"
      helper "this is the subquestion"
      text_field :better, placeholder: "bruh..."
      drop_down :name, first: :empty do
        option id: "This is the best"
        option something: "This is the best"
      end
    end
  end
end
