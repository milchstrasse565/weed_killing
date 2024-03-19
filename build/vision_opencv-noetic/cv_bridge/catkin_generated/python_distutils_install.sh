#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/lmk/weed_killing/src/vision_opencv-noetic/cv_bridge"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/lmk/weed_killing/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/lmk/weed_killing/install/lib/python3/dist-packages:/home/lmk/weed_killing/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/lmk/weed_killing/build" \
    "/usr/bin/python3" \
    "/home/lmk/weed_killing/src/vision_opencv-noetic/cv_bridge/setup.py" \
    egg_info --egg-base /home/lmk/weed_killing/build/vision_opencv-noetic/cv_bridge \
    build --build-base "/home/lmk/weed_killing/build/vision_opencv-noetic/cv_bridge" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/lmk/weed_killing/install" --install-scripts="/home/lmk/weed_killing/install/bin"
