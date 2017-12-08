#!/bin/bash

grep -v '#PBS' new_user_tutorial.md | grep -v '#\ \ ' | grep -v '#!/bin/bash' | grep '^#' > headers.tmp
