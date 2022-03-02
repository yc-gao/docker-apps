FROM xundaoxd/cuda-cmake:latest

WORKDIR /workdir

RUN git clone https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git \
    && cd llvm-project \
    && cmake -S llvm -B build -G Ninja -DLLVM_ENABLE_PROJECTS="mlir;clang" -DMLIR_ENABLE_CUDA_RUNNER=ON -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_BUILD_EXAMPLES=ON -DLLVM_CCACHE_BUILD=ON -DCMAKE_INSTALL_PREFIX=/workdir/llvm-home \
    && cmake --build build -j $(cat /proc/cpuinfo | grep processor | wc -l)
