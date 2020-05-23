function db
rm -rf build && mkdir -p build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Debug && make -j8 && make install; cd ..
end
