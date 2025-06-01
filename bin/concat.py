#!/usr/bin/env python

import argparse
import os
import pandas as pd

def concat(files, output_file):
    # dataframes from input txt files
    read_files = []

    # read each file in target dir
    for f in files:
        # exon.txt files are tab delimited
        df = pd.read_csv(f, sep='\t', header=0, index_col=0)

        sample_name = os.path.splitext(os.path.basename(f))[0]  # Extract file name without extension
        df.columns = [sample_name]

        # add to list
        read_files.append(df)

    # combine all txt files
    result = pd.concat(read_files, axis=1)

    # output as tab delimited file
    result.to_csv(output_file, sep='\t')


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument("-i", "--input", nargs="+", help='Directory with input files', dest="input", required=True)
    parser.add_argument("-o", "--output", help='Output file with counts matrix', dest="output", required=True)

    args = parser.parse_args()

    concat(args.input, args.output)



if __name__ == "__main__":
    main()
    

