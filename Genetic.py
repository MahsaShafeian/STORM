import random
import numpy as np

class Genetic:
    @staticmethod
    def alternating_crossover(parent1, parent2):
        child = []
        used_genes = []
        for i in range(len(parent1)):
            if i % 2 == 0:  
                child.append(parent1[i])
                used_genes.append(parent1[i])
            else:
                child.append(parent2[i])
                used_genes.append(parent2[i])
                
        un_used_genes = []
        for i in parent1:
            if i not in used_genes:
                un_used_genes.append(i)
        
        
        used_genes = []
        for i in range(len(child)):
            if child[i] in used_genes:
                child[i] = un_used_genes.pop()
                used_genes.append(child[i])
            else:
                used_genes.append(child[i])
                
        return child

    @staticmethod
    def merge_parents(parents):
        for i in range(10):
            parent1 = parents[i]
            parent2 = parents[(i + 1) % 10]
            # print(f"parent1:{parent1}, parent2:{parent2}")
            child = Genetic.alternating_crossover(parent1, parent2)
            parents.append(child)
        return parents
    
    @staticmethod
    def fitness_function(variable_list, usage_array):
        write_list = []
        for variable in variable_list:
            _, write_count, _, size = variable
            repeat_count = size // 4 
            write_list.extend([write_count] * repeat_count)
        
        if len(usage_array) != len(write_list):
            print(f"len usage array: {len(usage_array)}, len wrie list: {len(write_list)}")
            raise ValueError("usage_array and write_list must have the same length.")
        
        write_array = np.array(write_list)
        combined_array = usage_array + write_array        
        max_value = np.max(combined_array)

        return combined_array, max_value

    @staticmethod
    def find_best(variable_count, variable_list, usage_array):
        # print(f"usage_array:{usage_array}")
        parents = []
        for i in range(10):
            c1 = []
            while len(c1) < variable_count:
                random_number = random.randint(0, variable_count-1)
                if random_number in c1:
                    continue
                c1.append(random_number)
            p1 = []
            for i in c1:
                p1.append(variable_list[i])
            
            parents.append(p1)
            
        for _ in range(10):
            parents = Genetic.merge_parents(parents)
            parents = sorted(parents, key=lambda x: Genetic.fitness_function(x, usage_array)[1], reverse=False)
            parents = parents[:10]
            # print(f"best max_value:{Genetic.fitness_function(parents[0], usage_array)[1]}")
        
        return parents[0]
            