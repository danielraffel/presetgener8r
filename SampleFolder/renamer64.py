with open('keyvalue64.txt') as f:
  replacements = dict(x.rstrip().split(None, 1) for x in f)

# write file to new output
with open('preset.upto64.yml') as infile, open('new.preset.upto64.yml', 'w') as outfile:
    for line in infile:
        for src, target in replacements.iteritems():
            line = line.replace(src, target)
        outfile.write(line)
