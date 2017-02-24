# My list of objects in pymol session
import glob
objs = glob.glob("/Users/pranjal/Downloads/SHREC17/model_pdb/*.pdb")
i = 0
for obj in objs:
    oa = obj.split("/")
    oa = oa[-1]
    objs[i] = oa
    i = i+1

c = 0
for obj in objs:
	if c < 5240:
		c = c + 1
		continue
	cmd.disable("all")
	cmd.load(obj)
	cmd.enable(obj)
	cmd.show("surface")
	cmd.save(obj.split(".")[0]+'.obj')
	cmd.delete(obj)
	cmd.disable("all")