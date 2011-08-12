# - Try to find USB-1.0
# Once done this will define
#
#  USB-1.0_FOUND - system has USB-1.0
#  USB-1.0_INCLUDE_DIRS - the USB-1.0 include directory
#  USB-1.0_LIBRARIES - Link these to use USB-1.0
#  USB-1.0_DEFINITIONS - Compiler switches required for using USB-1.0
#
#  Copyright (c) 2009 Andreas Schneider <mail@cynapses.org>
#
#  Redistribution and use is allowed according to the terms of the New
#  BSD license.
#  For details see the accompanying COPYING-CMAKE-SCRIPTS file.
#


if (USB-1.0_LIBRARIES AND USB-1.0_INCLUDE_DIRS)
  # in cache already
  set(USB-1.0_FOUND TRUE)
else (USB-1.0_LIBRARIES AND USB-1.0_INCLUDE_DIRS)
  # use pkg-config to get the directories and then use these values
  # in the FIND_PATH() and FIND_LIBRARY() calls
  if (${CMAKE_MAJOR_VERSION} EQUAL 2 AND ${CMAKE_MINOR_VERSION} EQUAL 4)
    include(UsePkgConfig)
    pkgconfig(libusb-1.0 _USB-1.0_INCLUDEDIR _USB-1.0_LIBDIR _USB-1.0_LDFLAGS _USB-1.0_CFLAGS)
  else (${CMAKE_MAJOR_VERSION} EQUAL 2 AND ${CMAKE_MINOR_VERSION} EQUAL 4)
    find_package(PkgConfig)
    if (PKG_CONFIG_FOUND)
      pkg_check_modules(_USB-1.0 libusb-1.0)
    endif (PKG_CONFIG_FOUND)
  endif (${CMAKE_MAJOR_VERSION} EQUAL 2 AND ${CMAKE_MINOR_VERSION} EQUAL 4)

  find_path(USB-1.0_INCLUDE_DIR
    NAMES
      libusb.h
    PATHS
      ${_USB-1.0_INCLUDEDIR}
      /usr/include
      /usr/local/include
      /opt/local/include
      /sw/include
    PATH_SUFFIXES
      libusb-1.0
  )
  mark_as_advanced(USB-1.0_INCLUDE_DIR)

  find_library(USB-1.0_LIBRARY
    NAMES
      usb-1.0
    PATHS
      ${_USB-1.0_LIBDIR}
      /usr/lib
      /usr/local/lib
      /opt/local/lib
      /sw/lib
  )
  mark_as_advanced(USB-1.0_LIBRARY)

  if (USB-1.0_LIBRARY)
    set(USB-1.0_FOUND TRUE)
    mark_as_advanced(USB-1.0_FOUND)
  endif (USB-1.0_LIBRARY)

  set(USB-1.0_INCLUDE_DIRS
    ${USB-1.0_INCLUDE_DIR}
  )

  if (USB-1.0_FOUND)
    set(USB-1.0_LIBRARIES
      ${USB-1.0_LIBRARIES}
      ${USB-1.0_LIBRARY}
    )
  endif (USB-1.0_FOUND)

  if (USB-1.0_INCLUDE_DIRS AND USB-1.0_LIBRARIES)
     set(USB-1.0_FOUND TRUE)
  endif (USB-1.0_INCLUDE_DIRS AND USB-1.0_LIBRARIES)

  if (USB-1.0_FOUND)
    if (NOT USB-1.0_FIND_QUIETLY)
      message(STATUS "Found USB-1.0: ${USB-1.0_LIBRARIES}")
    endif (NOT USB-1.0_FIND_QUIETLY)
  else (USB-1.0_FOUND)
    if (USB-1.0_FIND_REQUIRED)
      message(FATAL_ERROR "Could not find USB-1.0")
    endif (USB-1.0_FIND_REQUIRED)
  endif (USB-1.0_FOUND)

  # show the USB-1.0_INCLUDE_DIRS and USB-1.0_LIBRARIES variables only in the advanced view
  mark_as_advanced(USB-1.0_INCLUDE_DIRS USB-1.0_LIBRARIES)

endif (USB-1.0_LIBRARIES AND USB-1.0_INCLUDE_DIRS)

