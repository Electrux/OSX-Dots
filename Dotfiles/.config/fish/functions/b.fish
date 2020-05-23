function b
rm -rf build && mkdir -p build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release && make -j8 && make install; cd ..
end
