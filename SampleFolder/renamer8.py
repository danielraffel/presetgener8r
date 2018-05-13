with open('keyvalue8.txt') as f:
  replacements = dict(x.rstrip().split(None, 1) for x in f)

# write file to new output
with open('preset.first8.yml') as infile, open('new.preset.first8.yml', 'w') as outfile:
    for line in infile:
        for src, target in replacements.iteritems():
            line = line.replace(src, target)
        outfile.write(line)
