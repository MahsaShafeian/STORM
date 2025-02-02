

class History:
    usage_matrix = []
    num_set = 0
    num_way = 0
    blk_size = 0
    cache_capacity = 0
    num_region = 0
    region_size = 0
    
    def __init__(self, num_way, blk_size, cache_capacity, region_size):
        self.usage_matrix = []
        self.num_way = num_way
        self.blk_size = blk_size
        self.cache_capacity = cache_capacity
        self.num_region = blk_size // region_size
        self.region_size = region_size
        self.num_set = cache_capacity // (blk_size * num_way)
        for _ in range(self.num_set):
            temp = []
            for _ in range(self.num_region):
                temp.append(0)
            self.usage_matrix.append(temp)
    
    def getUsageArray(self, label, stack_frame_size):
        usageArray = []
        for i in range(stack_frame_size//self.region_size):
            usageArray.append(self.usage_matrix[label + (i // self.num_region)][i % self.num_region])
    
    def updateUsageMatrix(self, label, writeArray):
        for i in range(len(writeArray)):
            self.usage_matrix[label + (i // self.num_region)][i % self.num_region] = writeArray[i]