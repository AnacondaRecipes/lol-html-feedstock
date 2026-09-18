#!/bin/bash
set -ex

export CARGO_PROFILE_RELEASE_STRIP=symbols
export CARGO_PROFILE_RELEASE_LTO=fat

cargo auditable cinstall --bins \
    --prefix "${PREFIX}" \
    --libdir "${PREFIX}/lib" \
    --manifest-path c-api/Cargo.toml \
    --library-type cdylib

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
