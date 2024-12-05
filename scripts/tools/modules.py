import os
import re
import pathlib

def generate_modules(repo_path, version , output="."):    
    ''' Generate modules for spack and write them to files.
    repo_path: root of the epcc spack repo
    version: spack version
    output: Folder where to save generated modules
    '''
    
    template_name=os.path.join(repo_path, "modules","spack.template.lua")

    with open(template_name) as f:
        lines=f.readlines()
        for i,line in enumerate(lines):
            lines[i]= re.sub(r"__EPCC__SPACK__REPO__ROOT__",repo_path,line)
            lines[i]= re.sub(r"__EPCC__SPACK__VERSION__",str(version),lines[i])
    
    pathlib.Path(output).mkdir(exist_ok=True,parents=True)
    with open(os.path.join(output,version + ".lua"),"w+") as f:
        f.writelines(lines)
    