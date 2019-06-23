# linux-shell
## Examples
- Parse Xml Elements
``` shell
cat pom.xml | grep '<version>' | head -n 1 | awk -F '>' '{print $2}' | awk -F '<' '{print $1}'
```

## Refs
