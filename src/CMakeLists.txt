add_subdirectory(config)
add_subdirectory(proxy)
add_subdirectory(settings)
add_subdirectory(utils)

set(QML_IMPORT_PATH "${CMAKE_CURRENT_SOURCE_DIR}/third_party/material_qt/" ${CMAKE_BINARY_DIR}/imports CACHE STRING "MMaterial imports" FORCE)

add_subdirectory(third_party/material_qt/MMaterial ./MMaterial)
