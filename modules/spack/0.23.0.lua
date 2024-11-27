help([[
Spack v0.23.0
==============
Spack is a package management tool for HPC.
This module enables Spack and configures for
software packages to be installed into the
user's directories at
/work/group/group/username/.spack.

- Installed by: L. Parisi, EPCC"
   - Date: 26 Nov 2024\n"
]])

local pkgBase = "/work/z19/z19/lparisi/codes/spack/spack-epcc-20241106/install/spack/spack-v0.23.0"
local pkgConfigBase="/work/z19/z19/lparisi/codes/spack/spack-epcc-20241106/config/archer2-user"

setenv("SPACK_ROOT", pkgBase)

-- This is the user level package which will cache to a directory called .spack
-- located in the user's /work directory. This location is also used as the
-- default software install root.

local user = subprocess("id -un")
local group = subprocess("id -gn")
setenv("SPACK_USER_CACHE_PATH", pathJoin("/work", group, group, user, ".spack-0.23.0"))

-- Use the same directory for the user scope configs. Individual users may wish
-- to override this, but as a default we should make sure they stay on /work 
-- rather than /home, otherwise Spack will probably break in jobs.

setenv("SPACK_USER_CONFIG_PATH", pathJoin("/work", group, group, user, ".spack-0.23.0"))

-- We want to use the ARCHER2 user specific configs which, among other things,
-- is configured to use the CSE installation as an upstream package source. In
-- order to keep the USER scope config available, in case the user wants to
-- override anything themselves, we set the SYSTEM level config to a directory
-- inside the repository holding the user config files.

setenv("SPACK_SYSTEM_CONFIG_PATH",  pathJoin(pkgConfigBase,"spack-config"))
setenv("SPACK_EPCC_REPOS",  pathJoin(pkgConfigBase,"..","..","repos"))

-- NB this command sources the Spack setup script required for shell completion
-- and also for commands such as `spack load`. Using source_sh() would be
-- preferable but this misses *something* that the script does when converting
-- it to Lmod commands, so we run execute{} instead.

execute{cmd=" . ${SPACK_ROOT}/share/spack/setup-env.sh", modeA={"load"}}

family("spack")