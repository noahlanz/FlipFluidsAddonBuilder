# FlipFluidsAddonBuilder

This project helps building the flipfluid blender addon.

The build is done within docker. Start i like this:

'''docker build -t noahsamboa/flipfluidsaddonbuilder .'''

Then copy the addon like this:

'''docker cp noahsamboa/flipfluidsaddonbuilder:/flipfluids-blender-addon.zip ./flipfluids-blender-addon.zip'''
