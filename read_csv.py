import csv

FILE_DATA = 'data/lte-jun18tojun19-yt_100.csv'

if __name__ == '__main__':
    print("Loading csv data ..")

    # As a dict
    with open(FILE_DATA) as csv_file:
        reader = csv.DictReader(csv_file)
        for row in reader:
            print(row)

    # As fields
    with open(FILE_DATA) as csv_file:
        reader = csv.reader(csv_file)
        for line in reader:
            print(line)




