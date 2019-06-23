# linux-shell
## Examples
- Shell Header
``` shell
#!/usr/bin/env bash
```
- Shell Debug
``` shell
set -ex
```
- change to current shell dir
``` shell
cd ${0%/*}
```
- Parse Xml Elements
``` shell
cat pom.xml | grep '<version>' | head -n 1 | awk -F '>' '{print $2}' | awk -F '<' '{print $1}'
```

## Refs
