# Primerjalni program za diplomsko delo

Implementacija primerjalnega (benchmark) programa v štirih programskih jezikih: C, C++, Rust in Java.

## Podprte platforme

- Linux
- macOS

## Zahteve

### C

- Prevajalnik `clang` (ali `gcc`)
- Knjižnice: `libm`
- Standard: C17

### C++

- Prevajalnik `clang++` (ali `g++`)
- Knjižnice: `libm`
- Standard: C++20

### Rust

- `cargo` in `rustc`

### Java

- Preverjeno na JDK 21

## Prevajanje

### Vse verzije naenkrat

```bash
./build.sh all
```

### Posamezna verzija

```bash
./build.sh c      # C verzija
./build.sh cpp    # C++ verzija
./build.sh rust   # Rust verzija
./build.sh java   # Java verzija
```

## Zagon

```bash
./run.sh c    [možnosti]   # Zaženi C verzijo
./run.sh cpp  [možnosti]   # Zaženi C++ verzijo
./run.sh rust [možnosti]   # Zaženi Rust verzijo
./run.sh java [možnosti]   # Zaženi Java verzijo
```

Za seznam vseh možnosti programa uporabi `-h` ali `--help`:

```bash
./run.sh c --help
```

## Struktura projekta

```sh
./
|-- c/           # C implementacija
|-- cpp/         # C++ implementacija
|-- rust/        # Rust implementacija
|-- java/        # Java implementacija
|-- build.sh     # Skripta za prevajanje
|-- run.sh       # Skripta za zagon
|-- LICENSE      # Licenca
\-- README.md
```
