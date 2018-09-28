# shell script

#!/bin/bash
sed -i '1s/^/#!\/bin\/bash\n/' test.sh

# permissions
chmod u+x test.sh
