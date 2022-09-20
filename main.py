from tools import get_config, get_mesh, Computer
import numpy as np
import os 
from tqdm import tqdm

file_list = np.load('picked_uiuc.npy', allow_pickle=True)

# coarse mesh
for airfoil_file in tqdm(file_list, desc="Get Coarse Mesh:"):
    get_mesh(airfoil_file, mesh_size=0.01, store_path='./Meshes/coarse', optimizer=False)
    get_config(airfoil_file, store_path='./Meshes/coarse', template_path='inv_NACA0012.cfg')