defmodule Heap do
  defstruct size: 0, arr: %{}, cmp: :<

  def new(cmp \\ :<) do
    %Heap{cmp: cmp}
  end

  def peek(heap = %Heap{size: s}) when s > 0 do
    heap.arr[1]
  end

  def insert(heap = %Heap{}, val) do
    idx = heap.size + 1
    arr = heap.arr |> Map.put(idx, val)
    heap = %Heap{heap | size: idx, arr: arr}

    # Iterate from child towards parent and see whether heap property violates
    Stream.iterate(nil, & &1)
    |> Enum.reduce_while({heap, idx}, fn _, {heap, idx} ->
      parent = div(idx, 2)

      if idx > 1 and heap.cmp.(heap.arr[idx], heap.arr[parent]) do
        arr = %{heap.arr | idx => heap.arr[parent], parent => heap.arr[idx]}
        {:cont, {%Heap{heap | arr: arr}, parent}}
      else
        {:halt, heap}
      end
    end)
  end

  def pop(heap = %Heap{}) do
    size = heap.size - 1
    arr = %{heap.arr | 1 => heap.arr[heap.size]}
    heap = %Heap{heap | arr: arr, size: size}

    heapify(heap, 1)
  end

  def heapify(heap = %Heap{}, idx) do
    size = heap.size
    left_index = idx * 2
    right_idx = idx * 2 + 1

    min_index =
      if left_index <= size and heap.cmp.(heap.arr[left_index], heap.arr[idx]) do
        left_index
      else
        idx
      end

    min_index =
      if right_idx <= size and heap.cmp.(heap.arr[right_idx], heap.arr[min_index]) do
        right_idx
      else
        min_index
      end

    if min_index != idx do
      arr = %{heap.arr | idx => heap.arr[min_index], min_index => heap.arr[idx]}
      heapify(%Heap{heap | arr: arr}, min_index)
    else
      heap
    end
  end
end
