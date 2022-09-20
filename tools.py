from xml.etree.ElementTree import ProcessingInstruction
import numpy as np 
import pygmsh
from tqdm import tqdm
import gmsh
import os
import meshio
import subprocess

def get_mesh(airfoil_file, mesh_size, store_path, optimizer=True):
    data = np.loadtxt("./picked_uiuc/" + airfoil_file)[:-1]
    geometry = pygmsh.geo.Geometry()
    model = geometry.__enter__()
    airfoil = model.add_polygon(data, holes=None, mesh_size=mesh_size)
    points = [model.add_point((-0.5, -1, 0), mesh_size=5 * mesh_size),
              model.add_point((3.5, -1, 0), mesh_size=5 * mesh_size),
              model.add_point((3.5, 1, 0), mesh_size=5 * mesh_size),
              model.add_point((-0.5, 1, 0), mesh_size=5 * mesh_size)]

    channel_lines = [model.add_line(points[i], points[i + 1])
                     for i in range(-1, len(points) - 1)]
    
    channel_loop = model.add_curve_loop(channel_lines)
    plane_surface = model.add_plane_surface(channel_loop, holes=[airfoil.curve_loop])
    model.synchronize()
    volume_marker = 6
    model.add_physical([plane_surface], "Volume")
    model.add_physical([channel_lines[0]], "Inflow")
    model.add_physical([channel_lines[2]], "Outflow")
    model.add_physical([channel_lines[1], channel_lines[3]], "Walls")
    model.add_physical(airfoil.curve_loop.curves, "airfoil")

    geometry.generate_mesh(dim=2)

    pygmsh.write(os.path.join(store_path, airfoil_file[:-4]+'.su2'))
    geometry.__exit__()

    # mesh optimizer
    if optimizer:
        mesh = meshio.read(os.path.join(store_path, airfoil_file[:-4]+'.su2'), file_format='su2')
        optimized_mesh = pygmsh.optimize(mesh, method="")
        meshio.write(os.path.join(store_path, airfoil_file[:-4]+'.su2'), optimized_mesh)

def get_config(airfoil_file, store_path, template_path):
    f = open(template_path, 'r', encoding='utf-8')
    f1 = open(os.path.join(store_path, airfoil_file[:-4]+'.cfg'))
    lines = f.readlines()
    for i in range(len(lines)):
        if 'MESH_FILENAME= mesh_NACA0012_inv.su2' in lines[i]:
            new_line = lines[i].replace('mesh_NACA0012_inv.su2', airfoil_file[:-4]+'.su2')
            lines[i] = new_line
        elif 'CONV_FILENAME= history' in lines[i]:
            new_line = lines[i].replace('CONV_FILENAME= history', 'CONV_FILENAME= ' + airfoil_file[:-4] + '_history')
            lines[i] = new_line
        elif 'VOLUME_FILENAME= flow' in lines[i]:
            new_line = lines[i].replace('VOLUME_FILENAME= flow', 'VOLUME_FILENAME= ' + airfoil_file[:-4] + '_flow')
            lines[i] = new_line
        

    f1.writelines(lines)
    f.close()
    f1.close()

def Computer(airfoil_file, work_path):
    config_name = airfoil_file[:-4]+'.cfg'
    child = subprocess.check_output('su2_cfd'+config_name, cwd=work_path, shell=False)
    print(str(child, encoding='utf-8'))






