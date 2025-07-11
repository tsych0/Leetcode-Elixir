# https://leetcode.com/problems/longest-substring-without-repeating-characters/
defmodule HashTable.LengthOfLongestSubstring do
  @spec length_of_longest_substring(s :: String.t()) :: integer
  def length_of_longest_substring(s) do
    length_of_longest_(s, s, %MapSet{}, 0)
  end

  def length_of_longest_("", _, words_seen, max_len) do
    max(MapSet.size(words_seen), max_len)
  end

  def length_of_longest_(
        <<head, tail::binary>>,
        substring,
        words_seen,
        max_len
      ) do
    cond do
      MapSet.member?(words_seen, head) ->
        {substring, words_seen_new} = drop_til_char(substring, words_seen, head)
        length_of_longest_(tail, substring, words_seen_new, max(MapSet.size(words_seen), max_len))

      true ->
        length_of_longest_(
          tail,
          substring,
          MapSet.put(words_seen, head),
          max(max_len, MapSet.size(words_seen) + 1)
        )
    end
  end

  def drop_til_char(<<head, tail::binary>>, words_seen, c) do
    cond do
      head == c -> {tail, words_seen}
      true -> drop_til_char(tail, MapSet.delete(words_seen, head), c)
    end
  end
end
