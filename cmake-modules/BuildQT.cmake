macro(build_qt install_prefix staging_prefix)

  SET(QT_SHARED_LIBRARY ON)
  
  ExternalProject_Add(QT
    URL  "http://download.qt-project.org/official_releases/qt/4.8/4.8.6/qt-everywhere-opensource-src-4.8.6.tar.gz"
    URL_MD5 "2edbe4d6c2eff33ef91732602f3518eb"
	BUILD_IN_SOURCE 1
	INSTALL_DIR     "${CMAKE_BINARY_DIR}/external"
	BUILD_COMMAND   $(MAKE)
	INSTALL_COMMAND $(MAKE)  install # DESTDIR=${CMAKE_BINARY_DIR}/external
	CONFIGURE_COMMAND  ./configure --prefix=${CMAKE_BINARY_DIR}/external/${install_prefix} -no-webkit -fast -nomake demos -nomake examples -no-multimedia -no-phonon -no-qt3support -opensource -release -developer-build -shared -confirm-license
  )
  
  # CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER} "CXXFLAGS=${EXT_CXX_FLAGS}" "CFLAGS=${EXT_C_FLAGS}"
  SET(QTDIR ${CMAKE_BINARY_DIR}/external/${install_prefix} )
  SET(QT_DIR ${CMAKE_BINARY_DIR}/external/${install_prefix} )
  
endmacro(build_qt)
