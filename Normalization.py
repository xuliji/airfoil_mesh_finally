import numpy as np
from sklearn.preprocessing import MinMaxScaler
import os
from tqdm import tqdm

# 读取数据
def get_data(result):
    with open(result) as f:
        lines = f.readlines()
    # print(lines[6])
    node_element = lines[6].split(',')[:2]
    node = "".join(list(filter(str.isdigit, node_element[0])))
    # element = "".join(list(filter(str.isdigit, node_element[1])))

    # node data
    node_data = np.loadtxt(result, dtype=float, skiprows=9, max_rows=int(node))[:, -1].reshape(-1, 1)
    # element_data = np.loadtxt(result, dtype=int, skiprows=9+int(node), max_rows=int(element))
    return node, node_data


# 给数据做集合
num_node_list = []
for i in tqdm(range(500)):
    num_node, node_data = get_data("./RAE_Mesh/RAE_coarse_mach/"+str(i)+".dat")
    num_node_list.append(num_node)
    if i == 0:
        sum_np = node_data.copy()
    sum_np = np.vstack((sum_np, node_data))

scaler = MinMaxScaler()
norm = scaler.fit_transform(sum_np)
Min_Max = [scaler.data_min_, scaler.data_max_]
np.savetxt("./coarse_Min_Max.txt", Min_Max)


# 读取数据
def get_data_1(result):
    with open(result) as f:
        lines = f.readlines()
    # print(lines[6])
    node_element = lines[6].split(',')[:2]
    node = "".join(list(filter(str.isdigit, node_element[0])))
    # element = "".join(list(filter(str.isdigit, node_element[1])))

    # node data
    node_data = np.loadtxt(result, dtype=float, skiprows=9, max_rows=int(node))
    # element_data = np.loadtxt(result, dtype=int, skiprows=9+int(node), max_rows=int(element))
    return node, node_data