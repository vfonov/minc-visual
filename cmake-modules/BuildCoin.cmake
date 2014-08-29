macro(build_coin install_prefix staging_prefix)


  IF(CMAKE_BUILD_TYPE STREQUAL Release)
    SET(EXT_C_FLAGS   "${CMAKE_C_FLAGS}   ${CMAKE_C_FLAGS_RELEASE}")
    SET(EXT_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_RELEASE}")
  ELSE()
    SET(EXT_C_FLAGS   "${CMAKE_C_FLAGS}    ${CMAKE_C_FLAGS_DEBUG}")
    SET(EXT_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CMAKE_CXX_FLAGS_DEBUG}")
  ENDIF()

  
  ExternalProject_Add(COIN
    URL  "https://bitbucket.org/Coin3D/coin/downloads/Coin-3.1.3.tar.gz"
    URL_MD5 "1538682f8d92cdf03e845c786879fbea"
	BUILD_IN_SOURCE 1
	INSTALL_DIR     "${CMAKE_BINARY_DIR}/external"
	BUILD_COMMAND   $(MAKE)
	INSTALL_COMMAND $(MAKE)   DESTDIR=${CMAKE_BINARY_DIR}/external install
	CONFIGURE_COMMAND  ./configure --prefix=${install_prefix} #CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER} "CXXFLAGS=${EXT_CXX_FLAGS}" "CFLAGS=${EXT_C_FLAGS}"
  )
  
  # 
  SET(COIN_DIR ${CMAKE_BINARY_DIR}/external)
endmacro(build_coin)
