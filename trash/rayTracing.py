import numpy as np
from PIL import Image

class Ray:
    """Represents a ray with an origin and direction."""
    def __init__(self, origin, direction):
        self.origin = np.array(origin, dtype=np.float32)
        self.direction = np.array(direction, dtype=np.float32)
        self.direction /= np.linalg.norm(self.direction)  # Normalize

class Sphere:
    """Defines a sphere with position, radius, and color."""
    def __init__(self, center, radius, color):
        self.center = np.array(center, dtype=np.float32)
        self.radius = radius
        self.color = np.array(color, dtype=np.uint8)

    def intersect(self, ray):
        """Checks if a ray intersects the sphere using quadratic formula."""
        oc = ray.origin - self.center
        a = np.dot(ray.direction, ray.direction)
        b = 2.0 * np.dot(oc, ray.direction)
        c = np.dot(oc, oc) - self.radius ** 2
        discriminant = b * b - 4 * a * c

        if discriminant < 0:
            return None  # No intersection
        else:
            t1 = (-b - np.sqrt(discriminant)) / (2.0 * a)
            t2 = (-b + np.sqrt(discriminant)) / (2.0 * a)
            return min(t1, t2) if t1 > 0 else (t2 if t2 > 0 else None)

def raytrace(width, height):
    """Renders the Sun and Moon with shadows using ray tracing."""
    camera = np.array([0, 0, -5])  # Camera at (0,0,-5)
    image = np.zeros((height, width, 3), dtype=np.uint8)

    # Define objects (Sun, Moon, and ground)
    sun = Sphere(center=[-2, 2, 5], radius=1, color=[255, 255, 0])  # Yellow Sun
    moon = Sphere(center=[0, 0, 3], radius=1, color=[150, 150, 150])  # Gray Moon
    ground = Sphere(center=[0, -1001, 0], radius=1000, color=[50, 200, 50])  # Green ground

    objects = [sun, moon, ground]

    for y in range(height):
        for x in range(width):
            px = (x / width) * 2 - 1
            py = 1 - (y / height) * 2
            ray = Ray(camera, [px, py, 1])  # Ray pointing forward

            min_t = float('inf')
            hit_object = None

            # Check intersection with objects
            for obj in objects:
                t = obj.intersect(ray)
                if t is not None and t < min_t:
                    min_t = t
                    hit_object = obj

            if hit_object:
                # Check if in shadow (cast ray toward Sun)
                shadow_ray = Ray(camera + min_t * ray.direction, sun.center - (camera + min_t * ray.direction))
                in_shadow = any(obj != hit_object and obj.intersect(shadow_ray) for obj in objects)

                if in_shadow:
                    image[y, x] = hit_object.color // 2  # Darken if in shadow
                else:
                    image[y, x] = hit_object.color

    return Image.fromarray(image)

# Generate and show image
img = raytrace(400, 400)
img.show()
img.save("raytrace_shadows.png")
