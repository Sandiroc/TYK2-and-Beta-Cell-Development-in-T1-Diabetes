import argparse
import csv

# here we are initializing the argparse object that we will modify
parser = argparse.ArgumentParser()

# we are asking argparse to require a -i or --input flag on the command line when this
# script is invoked. It will store it in the "filenames" attribute of the object
# we will be passing it via snakemake, a list of all the outputs of verse so we can
# concatenate them into a single matrix using pandas 

parser.add_argument("-i", "--input", help='a GFF file', dest="input", required=True)
parser.add_argument("-o", "--output", help='Output file with region', dest="output", required=True)

# this method will run the parser and input the data into the namespace object
args = parser.parse_args()

# you can access the values on the command line by using `args.input` or 'args.output`


# string indices for id and name
GENE_ID_INDEX_START = 9
GENE_NAME_INDEX_START = 11

# store id and name per entry in gtf
gene_id = []
gene_name = []

with open(args.input, 'r') as gtf_file:
    # iterate over each line
    for line in gtf_file:
        
        # remove extra lines at top
        if line.startswith("#"):
            continue

        # make sure everything is tab delimited
        line = line.replace('; ', '\t')
        
        # split line by tab delimiter
        columns = line.split('\t')

        # check split line for id and name
        for item in columns:
            if item.startswith("gene_id"):
                gene_id.append(item[GENE_ID_INDEX_START:len(item) - 1])

            elif item.startswith("gene_name"):
                gene_name.append(item[GENE_NAME_INDEX_START:len(item) - 1])


tracker = 0
with open (args.output, 'w', newline="") as output_file:
    writer = csv.writer(output_file, delimiter='\t')
    #writer.writerow(['Ensembl_ID', 'Gene_Name']) 
    for gene_id, gene_name in zip(gene_id, gene_name):
        writer.writerow([gene_id, gene_name])





