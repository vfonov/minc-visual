# Additional settings for building a debian package

# make a list of used system libraries
SET(DEBIAN_DEPENDENCIES libc6  )

LIST(APPEND DEBIAN_DEPENDENCIES minc-toolkit freeglut3 libgl1  libxcb1 libxdmcp6 libx11-6 libxext6 libxau6  )

SET(CPACK_DEBIAN_PACKAGE_DEPENDS "")

# assemble all pieces together
foreach(arg ${DEBIAN_DEPENDENCIES})
  IF(CPACK_DEBIAN_PACKAGE_DEPENDS)
   set(CPACK_DEBIAN_PACKAGE_DEPENDS "${arg}, ${CPACK_DEBIAN_PACKAGE_DEPENDS}")
  ELSE(CPACK_DEBIAN_PACKAGE_DEPENDS)
    set(CPACK_DEBIAN_PACKAGE_DEPENDS "${arg}")
  ENDIF(CPACK_DEBIAN_PACKAGE_DEPENDS)
endforeach(arg ${DEBIAN_DEPENDENCIES})


SET(CPACK_DEBIAN_PACKAGE_SECTION "science")
