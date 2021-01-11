import sys
from ged4py.parser import GedcomReader
path = "/home/kitanosa/labs/logpro/gedcom.ged"
file = open('/home/kitanosa/labs/logpro/out.pl', 'w')
parser = GedcomReader(path)

with GedcomReader(path, encoding="utf-8") as parser:
    for i, indi in enumerate(parser.records0("INDI")):
        father = indi.father
        if father: 
            file.write("father('"+father.name.format()+"','"+indi.name.format()+"'). \n")

with GedcomReader(path, encoding="utf-8") as parser:
    for i, indi in enumerate(parser.records0("INDI")):
        mother = indi.mother
        if mother: 
            file.write("mother('"+mother.name.format()+"','"+indi.name.format()+"'). \n")

file.close()
