from PIL import Image
import numpy as np

def convert_image_to_string(image_path, target_size):
    palette = {
        '0': [255, 255, 255],  # white
        '1': [0, 0, 0],        # black
        '2': [255, 0, 0],      # red
        '3': [0, 255, 0],      # green
        '4': [0, 0, 255],      # blue
        '5': [255, 255, 0],    # yellow
        '6': [0, 255, 255],    # cyan
        '7': [255, 0, 255],    # magenta
        '8': [255, 165, 0],    # orange
        '9': [255, 192, 203],  # pink

        'a': [128, 0, 128],    # purple
        'b': [165, 42, 42],    # brown
        'c': [128, 128, 128],  # grey
        'd': [0, 255, 0],      # lime
        'e': [173, 216, 230],  # light_blue
        'f': [0, 128, 128],    # teal
        'g': [0, 0, 128],      # navy
        'h': [128, 0, 0],      # maroon
        'i': [128, 128, 0],    # olive
        'j': [255, 215, 0],    # gold
        'k': [255, 127, 80],   # coral
        'l': [250, 128, 114],  # salmon
        'm': [75, 0, 130],     # indigo
        'n': [238, 130, 238],  # violet
        'o': [64, 224, 208],   # turquoise
        'p': [220, 20, 60],    # crimson
        'q': [255, 218, 185],  # peach
        'r': [230, 230, 250],  # lavender
        's': [189, 252, 201],  # mint
        't': [245, 245, 220],  # beige
        'u': [240, 230, 140],  # khaki
        'v': [192, 192, 192],  # silver
        'w': [210, 105, 30],   # chocolate
        'x': [0, 191, 255],    # deep_sky
        'y': [34, 139, 34],    # forest
        'z': [64, 64, 64]      # dark_gray
    }

    # convert to numpy array
    palette_chars = list(palette.keys())
    palette_colors = np.array(list(palette.values()))

    # resize image
    with Image.open(image_path) as img:
        if img.mode != 'RGB':
            img = img.convert('RGB')
        
        # crop to square
        width, height = img.size
        size = min(width, height)
        left = (width - size) // 2
        top = (height - size) // 2
        img = img.crop((left, top, left + size, top + size))
        
        img = img.resize((target_size, target_size), Image.Resampling.LANCZOS)
    
    img_array = np.array(img)
    pixels = img_array.reshape(-1, 3)
    
    result = []
    
    for pixel in pixels:
        distances = np.sqrt(np.sum((palette_colors - pixel) ** 2, axis=1))
        closest_color_idx = np.argmin(distances)
        result.append(palette_chars[closest_color_idx])
    
    return ''.join(result)

def main():
    image_path = "input.png"
    target_size = 70
    
    result = convert_image_to_string(image_path, target_size)
    print(f"String length: {len(result)}")
    print("Result string:")
    print(result)

if __name__ == "__main__":
    main()