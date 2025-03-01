import heapq

heap = []

# heap.heapify(heap)
heapq.heappush(heap, 10)
heapq.heappush(heap, 5)
heapq.heappush(heap, 14)
heapq.heappush(heap, 2)
heapq.heappush(heap, 11)
heapq.heappush(heap, 6)




print("Heap", heap)
smallest = heap.heappop(heap)
print("Smallest element removed:", smallest)

print("updated Heap", heap)