pp "Seeding Ankh decks"

Deck.create!(name: "Tailwind CSS")
Deck.create!(name: "Ruby")
Deck.create!(name: "Ruby on Rails")

hotwire = Deck.create!(name: "Hotwired Ruby on Rails")

hotwire.cards.create! \
  front: "<div>Generate a random number between 0 and 1</div>",
  back: "<code>rand</code>"

hotwire.cards.create! \
  front: "<div>Generate a random number between 1 and 10</div>",
  back: "<code>rand 10</code>"

hotwire.cards.create! \
  front: "<div>Generate a random number between 5 and 8</div>",
  back: "<code>rand(5...8)</code>"

hotwire.cards.create! \
  front: "<div>What’s the Tailwind CSS class to prevent button text from wrapping?</div>",
  back: "<code>.whitespace-nowrap</code>"

hotwire.cards.create! \
  front: "<div>Set a background color’s opacity</div>",
  back: "<code>.bg-opacity-50</code>"

hotwire.cards.create! \
  front: "<div>Create an element that blurs the text behind it</div>",
  back: "<div><pre>.backdrop-blur.bg-zinc-600/50\n  p I blur things</pre></div>"

hotwire.cards.create! \
  front: "<div>Underline an element in yellow</div>",
  back: "<code>decoration-yellow-500</code>"

hotwire.cards.create! \
  front: "<div>Create a gradient from top-left to bottom-right</div>",
  back: "<pre>.bg-gradient-to-br\n.from-zinc-700\n.to-zinc-800</pre>"

hotwire.cards.create! \
  front: "<div>How many pixels is <code>w-40</code>?</div>",
  back: "<div>160px</div>"

hotwire.cards.create! \
  front: "<div>How many rems is <code>w-12</code>?</div>",
  back: "<div><code>3rem</code></div>"

hotwire.cards.create! \
  front: "<div>How to prevent back navigation on left swipe?</div>",
  back: "<div><pre>html.overscroll-x-none\n  body.overscroll-x-none</pre></div>"
