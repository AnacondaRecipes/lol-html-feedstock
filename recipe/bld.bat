@echo on

set CARGO_PROFILE_RELEASE_STRIP=symbols
set CARGO_PROFILE_RELEASE_LTO=fat

cargo auditable cinstall --bins ^
    --prefix %LIBRARY_PREFIX% ^
    --libdir %LIBRARY_LIB% ^
    --manifest-path c-api/Cargo.toml ^
    --library-type cdylib
if errorlevel 1 exit 1

move %LIBRARY_PREFIX%\lib\lolhtml.dll.lib %LIBRARY_PREFIX%\lib\lolhtml.lib
if errorlevel 1 exit 1

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
if errorlevel 1 exit 1
