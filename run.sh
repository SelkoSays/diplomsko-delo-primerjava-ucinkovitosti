#!/usr/bin/env sh

check_and_build_c() {
    if [ ! -f "./c/build/c-test" ]; then
        echo "C verzija ni prevedena. Prevajam..."
        "./build.sh" c
        echo ""
    fi
}

check_and_build_cpp() {
    if [ ! -f "./cpp/build/cpp-test" ]; then
        echo "C++ verzija ni prevedena. Prevajam..."
        "./build.sh" cpp
        echo ""
    fi
}

check_and_build_rust() {
    if [ ! -f "./rust/target/release/rust-test" ]; then
        echo "Rust verzija ni prevedena. Prevajam..."
        "./build.sh" rust
        echo ""
    fi
}

check_and_build_java() {
    if [ ! -d "./java/bin" ] || [ -z "$(ls -A "./java/bin" 2>/dev/null)" ]; then
        echo "Java verzija ni prevedena. Prevajam..."
        "./build.sh" java
        echo ""
    fi
}

run_c() {
    check_and_build_c
    "./c/build/c-test" "$@"
}

run_cpp() {
    check_and_build_cpp
    "./cpp/build/cpp-test" "$@"
}

run_rust() {
    check_and_build_rust
    "./rust/target/release/rust-test" "$@"
}

run_java() {
    check_and_build_java
    java -cp "./java/bin" stressor.Stressor "$@"
}

usage() {
    echo "Uporaba: $0 <jezik> [možnosti]"
    echo ""
    echo "Jeziki:"
    echo "  c      Zaženi C verzijo"
    echo "  cpp    Zaženi C++ verzijo"
    echo "  rust   Zaženi Rust verzijo"
    echo "  java   Zaženi Java verzijo"
    echo ""
    echo "Za seznam možnosti programa uporabi: $0 <jezik> --help"
    exit 1
}

if [ $# -eq 0 ]; then
    usage
fi

lang="$1"
shift

case "$lang" in
    c)
        run_c "$@"
        ;;
    cpp|c++)
        run_cpp "$@"
        ;;
    rust|rs)
        run_rust "$@"
        ;;
    java)
        run_java "$@"
        ;;
    *)
        echo "Neznan jezik: $lang"
        usage
        ;;
esac
