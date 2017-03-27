defmodule SearchTest do
  use ExUnit.Case
  #  ["olympics",
  #   ["Olympic Games",
  #    "Olympic symbols",
  #    "Olympics on NBC commentators",
  #    "Olympics on television",
  #    "Olympics on United States television"
  #  ],
  #  ["The modern Olympic Games or Olympics (French: Jeux olympiques) are leading international sporting events featuring summer and winter sports competitions in which thousands of athletes from around the world participate in a variety of competitions.",
  #   "The Olympic symbols are icons, flags and symbols used by the International Olympic Committee to elevate the Olympic Games.",
  #   "This article includes a list of hosts and commentators of the Olympic Games on NBC.",
  #   "The Olympic Games have been broadcast on television since the 1930s.",
  #   "The Olympic Games (Summer and Winter) have been televised in the United States since 1960. It has become one of the most popular programs on USA television every four and then two years."],
  #   ["https://en.wikipedia.org/wiki/Olympic_Games",
  #    "https://en.wikipedia.org/wiki/Olympic_symbols",
  #    "https://en.wikipedia.org/wiki/Olympics_on_NBC_commentators",
  #    "https://en.wikipedia.org/wiki/Olympics_on_television",
  #    "https://en.wikipedia.org/wiki/Olympics_on_United_States_television"]
  # ]
  test "result returned from wikipedia search" do
    results = Search.term(%{topic: "olympics", amount: 5})
    # %Result{link: link, description: "text", source: "wikipedia"}
    assert length(results) == 5
  end
end
