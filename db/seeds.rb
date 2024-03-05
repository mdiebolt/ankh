pp "Seeding Ankh decks"

Deck.create!(name: "Tailwind CSS")
Deck.create!(name: "Ruby")
Deck.create!(name: "Ruby on Rails")

hotwire = Deck.create!(name: "Hotwired Ruby on Rails")

hotwire.cards.create! \
  front: "<div>Generate a random number between 0 and 1</div>",
  back: "<pre>rand</pre>"

hotwire.cards.create! \
  front: "<div>Generate a random number between 1 and 10</div>",
  back: "<pre>rand 10</pre>"

hotwire.cards.create! \
  front: "<div>Generate a random number between 5 and 8</div>",
  back: "<pre>rand(5...8)</pre>"

hotwire.cards.create! \
  front: "<div>What’s the Tailwind CSS class to use to prevent button text from wrapping?</div>",
  back: "<pre>whitespace-nowrap</pre>"

hotwire.cards.create! \
  front: "<div>Set a background color’s opacity</div>",
  back: "<pre>bg-opacity-50</pre>"

hotwire.cards.create! \
  front: "<div>Create an element that blurs the text behind it</div>",
  back: "<div>You need the Tailwind CSS backdrop blur class and a semi-transparent background color.</div><pre>.backdrop-blur.bg-zinc-600/50\n  p I blur things</pre>"

hotwire.cards.create! \
  front: "<div>Underline an element in yellow</div>",
  back: "<pre>decoration-yellow-500</pre>"
