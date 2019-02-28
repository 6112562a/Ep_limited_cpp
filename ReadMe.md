# Ep_limited_cpp
Source from http://www.eplimited.com/confirmation.htm
修改部分代码支持MinGW下编译。
使用方法：
g++ -shared -o bdac.dll bdac.cpp classify.cpp rythmchk.cpp noisechk.cpp match.cpp postclas.cpp analbeat.cpp qrsfilt.cpp qrsdet2.cpp
编译出bdac.dll。