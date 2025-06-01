#!/usr/bin/env python3

import os
import glob

script_dir = os.path.dirname(os.path.abspath(__file__))

pattern = os.path.join(script_dir, ".nextflow.log.*")

files_to_delete = glob.glob(pattern)

for file in files_to_delete:
    try:
        os.remove(file)
        print(f"Deleted: {file}")
    except Exception as e:
        print(f"Failed to delete {file}: {e}")
