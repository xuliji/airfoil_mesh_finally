import pygmsh
import numpy as np

with pygmsh.geo.Geometry() as geom:
    
    data = np.loadtxt("./MMOE_MFM_test/" + "MMOE_MFM_test_rae0.dat")[:-1]
    airfoil = geom.add_polygon(data, holes=None, mesh_size=0.1)
    circle = geom.add_circle([0.0, 0.0], 5.0, mesh_size=0.2)
    plane_surface = geom.add_plane_surface(circle.curve_loop, holes=[airfoil.curve_loop])
    geom.synchronize()
    mesh = geom.generate_mesh(dim=2)
    pygmsh.write("./test/1.msh")
    