import meshio
import pygmsh

# two triangles and one quad
points = [
    [0.0, 0.0],
    [1.0, 0.0],
    [0.0, 1.0],
    [1.0, 1.0],
    [2.0, 0.0],
    [2.0, 1.0],
]
cells = [
    ("triangle", [[0, 1, 2], [1, 3, 2]]),
    ("quad", [[1, 4, 5, 3]]),
]
meshio.write_points_cells("foo.vtk", points, cells)
mesh = meshio.read(
    'foo.vtk'
)
optimized_mesh = pygmsh.optimize(mesh, method="")
meshio.write('foo.su2', optimized_mesh)