import sys, getopt

from History import History
from Genetic import Genetic

def getArgV(argv):
    json_file_path = ''
    log_file_path = ''
    try:
        opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
    except getopt.GetoptError:
        print('Modifier.py -i <Json file path> -o <Log file path>')
        sys.exit(2)
        
    if len(opts) < 2:
        print('Modifier.py -i <Json file path> -o <Log file path>')
        sys.exit(2)
        
    for opt, arg in opts:
        if opt == '-h':
            print ('Modifier.py -i <Json file path> -o <log file path>')
            sys.exit()
        elif opt in ("-i", "--ifile"):
            json_file_path = arg
        elif opt in ("-o", "--ofile"):
            log_file_path = arg

    print('Json file path "', json_file_path)
    print('Log file path "', log_file_path)

getArgV(sys.argv[1:])