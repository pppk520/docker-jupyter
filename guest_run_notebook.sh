#!/bin/bash
xvfb-run -a -s "-screen 0 1280x720x24" jupyter notebook --ip 0.0.0.0 --no-browser --allow-root --port 7777
