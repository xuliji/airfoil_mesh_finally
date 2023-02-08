from tools import get_config, get_mesh, Computer
import numpy as np
import os 
from tqdm import tqdm

# file_list = np.load('picked_uiuc.npy', allow_pickle=True)

# coarse mesh
for i in tqdm(range(500), desc="Get Coarse Mesh:"):
    # get_mesh('MMOE_MFM_test_rae{}.dat'.format(str(i)), mesh_size=0.01, store_path='./RAE_Mesh/fine', optimizer=False)
    # get_mesh('MMOE_MFM_test_rae{}.dat'.format(str(i)), mesh_size=0.1, store_path='./RAE_Mesh/coarse', optimizer=False)
    # get_config('MMOE_MFM_test_rae{}.dat'.format(str(i)), store_path='./RAE_Mesh/coarse', template_path='inv_NACA0012.cfg')
    # get_config('MMOE_MFM_test_rae{}.dat'.format(str(i)), store_path='./RAE_Mesh/fine', template_path='inv_NACA0012.cfg')
    # Computer('MMOE_MFM_test_rae{}.dat'.format(str(i)), work_path='./RAE_Mesh/coarse')
    Computer('MMOE_MFM_test_rae{}.dat'.format(str(i)), work_path='./RAE_Mesh/fine')
    # break