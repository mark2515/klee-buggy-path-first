# KLEE Buggy Path First

This project adds a custom KLEE search strategy: `buggy-path-first`.

## Available Scripts

1. Start the KLEE Docker container.

```bash
docker run -ti --platform linux/amd64 -v <host_parent_dir>:/workspace klee/klee
```

`<host_parent_dir>` is the folder on your machine that contains this repo.
Inside Docker, this repo will usually be available at:

```bash
/workspace/klee-buggy-path-first
```

2. Copy this project's core files into the KLEE source tree and rebuild KLEE.

```bash
cp /workspace/klee-buggy-path-first/lib/Core/* /tmp/klee_src/lib/Core/
cd /home/klee/klee_build
make -j$(nproc)
```

3. Go to a benchmark folder and compile the `.c` file to LLVM bitcode.

```bash
cd /workspace/klee-buggy-path-first/benchmark/<BenchmarkName>
clang -I /home/klee/klee_src/include -emit-llvm -c <BenchmarkName>.c -o <BenchmarkName>.bc
```

Examples of benchmark names: `MixedBug`, `DeepBug`, `DivCheck`, `Malloc`.

4. Run KLEE with different search strategies.

```bash
klee --search=dfs --output-dir=dfs <BenchmarkName>.bc
klee --search=random-path --output-dir=random-path <BenchmarkName>.bc
klee --search=nurs:covnew --output-dir=nurs <BenchmarkName>.bc
klee --search=buggy-path-first --output-dir=buggy-path-first <BenchmarkName>.bc
```

## Example

```bash
cd /workspace/klee-buggy-path-first/benchmark/MixedBug
clang -I /home/klee/klee_src/include -emit-llvm -c MixedBug.c -o MixedBug.bc
klee --search=buggy-path-first --output-dir=buggy-path-first MixedBug.bc
```
