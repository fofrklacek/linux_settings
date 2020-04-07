#!/bin/bash

echo -e "#ifndef _"$(echo "$1" | tr '[:lower:]' '[:upper:]')"_H\n#define _"$(echo "$1" | tr '[:lower:]' '[:upper:]')"_H\n\nclass $1 \n{\n\tpublic:\n\tprivate:\n\tprotected:\n};\n\n#endif /*_"$(echo "$1" | tr '[:lower:]' '[:upper:]')"_H*/" >"../include/$1.h"


