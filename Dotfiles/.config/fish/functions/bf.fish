function bf
set CWD (pwd)
cd ~/Git/Electrux/Feral-Lang/Feral
rm -rf build && mkdir -p build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release && make -j8 && make install
cd $CWD
end
