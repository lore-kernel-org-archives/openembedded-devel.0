Subject: error: unknown type name 'GLclampf'; did you mean 'GLclampx'?
To: openembedded-devel@lists.openembedded.org
From: dima.szevczenko@gmail.com
X-Originating-Location: Krakow, Lesser Poland, PL (89.64.51.13)
X-Originating-Platform: Linux Firefox 76
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 20 May 2020 03:01:07 -0700
Message-ID: <9nG7.1589968867410675396.U1GR@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="v44ERLkYXx9FLjdOna6w"

--v44ERLkYXx9FLjdOna6w
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello, I'm try build linux fo stm32mp1. But i have 1 error:

Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32', 'c=
ommon-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make -j 2
| Making all in src
| make[1]: Entering directory '/home/demetriusz/Developer- Package/openst-=
linux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-=
vfpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/build/src'
| Making all in util
| make[2]: Entering directory '/home/demetriusz/Developer- Package/openst-=
linux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-=
vfpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/build/src/ util'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/home/demetriusz/Developer- Package/openst-l=
inux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-v=
fpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/build/src/ util'
| Making all in data
| make[2]: Entering directory '/home/demetriusz/Developer- Package/openst-=
linux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-=
vfpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/build/src/ data'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/home/demetriusz/Developer- Package/openst-l=
inux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-v=
fpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/build/src/ data'
| Making all in demos
| make[2]: Entering directory '/home/demetriusz/Developer- Package/openst-=
linux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-=
vfpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/build/src/ demos'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/home/demetriusz/Developer- Package/openst-l=
inux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-v=
fpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/build/src/ demos'
| Making all in egl
| make[2]: Entering directory '/home/demetriusz/Developer- Package/openst-=
linux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-=
vfpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/build/src/ egl'
| Making all in eglut
| make[3]: Entering directory '/home/demetriusz/Developer- Package/openst-=
linux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-=
vfpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/build/src/ egl/eglut'
| make[3]: Nothing to be done for 'all'.
| make[3]: Leaving directory '/home/demetriusz/Developer- Package/openst-l=
inux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-v=
fpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/build/src/ egl/eglut'
| Making all in opengles1
| make[3]: Entering directory '/home/demetriusz/Developer- Package/openst-=
linux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-=
vfpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/build/src/ egl/opengles1'
| arm-ostl-linux-gnueabi-gcc =C2=A0-march=3Darmv7ve -mthumb -mfpu=3Dneon-v=
fpv4 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/demetriusz/ Dev=
eloper-Package/openst- linux/build-openstlinuxweston- stm32mp1/tmp-glibc/wo=
rk/ cortexa7t2hf-neon-vfpv4-ostl- linux-gnueabi/mesa-demos/8.3. 0-r0/recipe=
-sysroot -DPACKAGE_NAME=3D\"mesa-demos\" -DPACKAGE_TARNAME=3D\"mesa- demos\=
" -DPACKAGE_VERSION=3D\"8.3.0\" -DPACKAGE_STRING=3D\"mesa-demos\ 8.3.0\" -D=
PACKAGE_BUGREPORT=3D\" https:// bugs.freedesktop.org/enter_ bug.cgi\?produc=
t=3DMesa\& component=3DDemos\ ( https://bugs.freedesktop.org/enter_bug.cgi%=
5C?product=3DMesa%5C&component=3DDemos%5C ) " -DPACKAGE_URL=3D\"\" -DPACKAG=
E=3D\"mesa-demos\" -DVERSION=3D\"8.3.0\" -DSTDC_HEADERS=3D1 -DHAVE_SYS_TYPE=
S_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_STRING_H=3D1 -DHAV=
E_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=
=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=3D1 -DLT_OBJDIR=3D\".libs/\" -DDEM=
OS_DATA_DIR=3D\"/usr/share/ mesa-demos/\" -DDEMOS_DATA_DIR=3D\"/usr/share/ =
mesa-demos/\" -I. -I../../../../mesa-demos-8.3. 0/src/egl/opengles1 =C2=A0 =
=
=C2=A0 =C2=A0 -I../../../../mesa-demos-8.3. 0/src/egl/eglut -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/home/ demetriusz/Develo=
per-Package/ openst-linux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work=
/cortexa7t2hf- neon-vfpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0=3D/usr/sr=
c/ debug/mesa-demos/8.3.0-r0 -fdebug-prefix-map=3D/home/ demetriusz/Develop=
er-Package/ openst-linux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/=
cortexa7t2hf- neon-vfpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/recipe- sy=
sroot=3D -fdebug-prefix-map=3D/home/ demetriusz/Developer-Package/ openst-l=
inux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-v=
fpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/recipe- sysroot-native=3D =C2=
=A0-c -o clear.o ../../../../mesa-demos-8.3.0/ src/egl/opengles1/clear.c
| arm-ostl-linux-gnueabi-gcc =C2=A0-march=3Darmv7ve -mthumb -mfpu=3Dneon-v=
fpv4 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/demetriusz/ Dev=
eloper-Package/openst- linux/build-openstlinuxweston- stm32mp1/tmp-glibc/wo=
rk/ cortexa7t2hf-neon-vfpv4-ostl- linux-gnueabi/mesa-demos/8.3. 0-r0/recipe=
-sysroot -DPACKAGE_NAME=3D\"mesa-demos\" -DPACKAGE_TARNAME=3D\"mesa- demos\=
" -DPACKAGE_VERSION=3D\"8.3.0\" -DPACKAGE_STRING=3D\"mesa-demos\ 8.3.0\" -D=
PACKAGE_BUGREPORT=3D\" https:// bugs.freedesktop.org/enter_ bug.cgi\?produc=
t=3DMesa\& component=3DDemos\ ( https://bugs.freedesktop.org/enter_bug.cgi%=
5C?product=3DMesa%5C&component=3DDemos%5C ) " -DPACKAGE_URL=3D\"\" -DPACKAG=
E=3D\"mesa-demos\" -DVERSION=3D\"8.3.0\" -DSTDC_HEADERS=3D1 -DHAVE_SYS_TYPE=
S_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_STRING_H=3D1 -DHAV=
E_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=
=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=3D1 -DLT_OBJDIR=3D\".libs/\" -DDEM=
OS_DATA_DIR=3D\"/usr/share/ mesa-demos/\" -DDEMOS_DATA_DIR=3D\"/usr/share/ =
mesa-demos/\" -I. -I../../../../mesa-demos-8.3. 0/src/egl/opengles1 =C2=A0 =
=
=C2=A0 =C2=A0 -I../../../../mesa-demos-8.3. 0/src/egl/eglut -O2 -pipe -g -=
feliminate-unused-debug-types -fdebug-prefix-map=3D/home/ demetriusz/Develo=
per-Package/ openst-linux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work=
/cortexa7t2hf- neon-vfpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0=3D/usr/sr=
c/ debug/mesa-demos/8.3.0-r0 -fdebug-prefix-map=3D/home/ demetriusz/Develop=
er-Package/ openst-linux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/=
cortexa7t2hf- neon-vfpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/recipe- sy=
sroot=3D -fdebug-prefix-map=3D/home/ demetriusz/Developer-Package/ openst-l=
inux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-v=
fpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/recipe- sysroot-native=3D =C2=
=A0-c -o drawtex.o ../../../../mesa-demos-8.3.0/ src/egl/opengles1/drawtex=
.c
| ../../../../mesa-demos-8.3.0/ src/egl/opengles1/clear.c:40: 45: error: u=
nknown type name 'GLclampf'; did you mean 'GLclampx'?
| =C2=A0typedef void (GL_APIENTRY *type_ClearColor)(GLclampf red, GLclampf=
 green, GLclampf blue, GLclampf alpha);
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~~~~~
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GLclampx
| ../../../../mesa-demos-8.3.0/ src/egl/opengles1/clear.c:40: 59: error: u=
nknown type name 'GLclampf'; did you mean 'GLclampx'?
| =C2=A0typedef void (GL_APIENTRY *type_ClearColor)(GLclampf red, GLclampf=
 green, GLclampf blue, GLclampf alpha);
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GLclampx
| ../../../../mesa-demos-8.3.0/ src/egl/opengles1/clear.c:40: 75: error: u=
nknown type name 'GLclampf'; did you mean 'GLclampx'?
| =C2=A0typedef void (GL_APIENTRY *type_ClearColor)(GLclampf red, GLclampf=
 green, GLclampf blue, GLclampf alpha);
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GLclampx
| ../../../../mesa-demos-8.3.0/ src/egl/opengles1/clear.c:40: 90: error: u=
nknown type name 'GLclampf'; did you mean 'GLclampx'?
| =C2=A0typedef void (GL_APIENTRY *type_ClearColor)(GLclampf red, GLclampf=
 green, GLclampf blue, GLclampf alpha);
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 GLclampx
| ../../../../mesa-demos-8.3.0/ src/egl/opengles1/clear.c:43: 8: error: un=
known type name 'type_ClearColor'
| =C2=A0static type_ClearColor fn_ClearColor;
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~
| ../../../../mesa-demos-8.3.0/ src/egl/opengles1/clear.c: In function 'in=
it':
| ../../../../mesa-demos-8.3.0/ src/egl/opengles1/clear.c:73: 21: error: '=
type_ClearColor' undeclared (first use in this function); did you mean 'fn_=
ClearColor'?
| =C2=A0 =C2=A0 fn_ClearColor =3D (type_ClearColor) get_proc("glClearColor=
");
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^~~~~~~~~~~~~~~
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fn_ClearColor
| ../../../../mesa-demos-8.3.0/ src/egl/opengles1/clear.c:73: 21: note: ea=
ch undeclared identifier is reported only once for each function it appears=
 in
| ../../../../mesa-demos-8.3.0/ src/egl/opengles1/clear.c:73: 37: error: e=
xpected ';' before 'get_proc'
| =C2=A0 =C2=A0 fn_ClearColor =3D (type_ClearColor) get_proc("glClearColor=
");
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;
| ../../../../mesa-demos-8.3.0/ src/egl/opengles1/clear.c:76: 4: error: ca=
lled object 'fn_ClearColor' is not a function or function pointer
| =C2=A0 =C2=A0 fn_ClearColor(1.0, 0.4, 0.4, 0.0);
| =C2=A0 =C2=A0 ^~~~~~~~~~~~~
| ../../../../mesa-demos-8.3.0/ src/egl/opengles1/clear.c:43: 24: note: de=
clared here
| =C2=A0static type_ClearColor fn_ClearColor;
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ^~~~~~~~~~~~~
| Makefile:634: recipe for target 'clear.o' failed
| make[3]: *** [clear.o] Error 1
| make[3]: *** Waiting for unfinished jobs....
| make[3]: Leaving directory '/home/demetriusz/Developer- Package/openst-l=
inux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-v=
fpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/build/src/ egl/opengles1'
| Makefile:413: recipe for target 'all-recursive' failed
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory '/home/demetriusz/Developer- Package/openst-l=
inux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-v=
fpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/build/src/ egl'
| Makefile:422: recipe for target 'all-recursive' failed
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory '/home/demetriusz/Developer- Package/openst-l=
inux/build- openstlinuxweston-stm32mp1/ tmp-glibc/work/cortexa7t2hf- neon-v=
fpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0/build/src'
| Makefile:439: recipe for target 'all-recursive' failed
| make: *** [all-recursive] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/demetri=
usz/Developer- Package/openst-linux/build- openstlinuxweston-stm32mp1/ tmp-=
glibc/work/cortexa7t2hf- neon-vfpv4-ostl-linux-gnueabi/ mesa-demos/8.3.0-r0=
/temp/log. do_compile.7265)
ERROR: Task (/home/demetriusz/Developer- Package/openst-linux/layers/ open=
embedded-core/meta/ recipes-graphics/mesa/mesa- demos_8.3.0.bb:do_compile) =
failed with exit code '1'

--v44ERLkYXx9FLjdOna6w
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
<div>Hello, I'm try build linux fo stm32mp1. But i have 1 error:</div>
<div>&nbsp;</div>
<div>Log data follows:<br />| DEBUG: SITE files ['endian-little', 'bit-32'=
, 'arm-common', 'arm-32', 'common-linux', 'common-glibc', 'arm-linux', 'arm=
-linux-gnueabi', 'common']<br />| DEBUG: Executing shell function do_compil=
e<br />| NOTE: make -j 2<br />| Making all in src<br />| make[1]: Entering =
directory '/home/demetriusz/Developer-<wbr />Package/openst-linux/build-<wb=
r />openstlinuxweston-stm32mp1/<wbr />tmp-glibc/work/cortexa7t2hf-<wbr />ne=
on-vfpv4-ostl-linux-gnueabi/<wbr />mesa-demos/8.3.0-r0/build/src'<br />| Ma=
king all in util<br />| make[2]: Entering directory '/home/demetriusz/Devel=
oper-<wbr />Package/openst-linux/build-<wbr />openstlinuxweston-stm32mp1/<w=
br />tmp-glibc/work/cortexa7t2hf-<wbr />neon-vfpv4-ostl-linux-gnueabi/<wbr =
/>mesa-demos/8.3.0-r0/build/src/<wbr />util'<br />| make[2]: Nothing to be =
done for 'all'.<br />| make[2]: Leaving directory '/home/demetriusz/Develop=
er-<wbr />Package/openst-linux/build-<wbr />openstlinuxweston-stm32mp1/<wbr=
 />tmp-glibc/work/cortexa7t2hf-<wbr />neon-vfpv4-ostl-linux-gnueabi/<wbr />=
mesa-demos/8.3.0-r0/build/src/<wbr />util'<br />| Making all in data<br />|=
 make[2]: Entering directory '/home/demetriusz/Developer-<wbr />Package/ope=
nst-linux/build-<wbr />openstlinuxweston-stm32mp1/<wbr />tmp-glibc/work/cor=
texa7t2hf-<wbr />neon-vfpv4-ostl-linux-gnueabi/<wbr />mesa-demos/8.3.0-r0/b=
uild/src/<wbr />data'<br />| make[2]: Nothing to be done for 'all'.<br />| =
make[2]: Leaving directory '/home/demetriusz/Developer-<wbr />Package/opens=
t-linux/build-<wbr />openstlinuxweston-stm32mp1/<wbr />tmp-glibc/work/corte=
xa7t2hf-<wbr />neon-vfpv4-ostl-linux-gnueabi/<wbr />mesa-demos/8.3.0-r0/bui=
ld/src/<wbr />data'<br />| Making all in demos<br />| make[2]: Entering dir=
ectory '/home/demetriusz/Developer-<wbr />Package/openst-linux/build-<wbr /=
>openstlinuxweston-stm32mp1/<wbr />tmp-glibc/work/cortexa7t2hf-<wbr />neon-=
vfpv4-ostl-linux-gnueabi/<wbr />mesa-demos/8.3.0-r0/build/src/<wbr />demos'=
<br />| make[2]: Nothing to be done for 'all'.<br />| make[2]: Leaving dire=
ctory '/home/demetriusz/Developer-<wbr />Package/openst-linux/build-<wbr />=
openstlinuxweston-stm32mp1/<wbr />tmp-glibc/work/cortexa7t2hf-<wbr />neon-v=
fpv4-ostl-linux-gnueabi/<wbr />mesa-demos/8.3.0-r0/build/src/<wbr />demos'<=
br />| Making all in egl<br />| make[2]: Entering directory '/home/demetriu=
sz/Developer-<wbr />Package/openst-linux/build-<wbr />openstlinuxweston-stm=
32mp1/<wbr />tmp-glibc/work/cortexa7t2hf-<wbr />neon-vfpv4-ostl-linux-gnuea=
bi/<wbr />mesa-demos/8.3.0-r0/build/src/<wbr />egl'<br />| Making all in eg=
lut<br />| make[3]: Entering directory '/home/demetriusz/Developer-<wbr />P=
ackage/openst-linux/build-<wbr />openstlinuxweston-stm32mp1/<wbr />tmp-glib=
c/work/cortexa7t2hf-<wbr />neon-vfpv4-ostl-linux-gnueabi/<wbr />mesa-demos/=
8.3.0-r0/build/src/<wbr />egl/eglut'<br />| make[3]: Nothing to be done for=
 'all'.<br />| make[3]: Leaving directory '/home/demetriusz/Developer-<wbr =
/>Package/openst-linux/build-<wbr />openstlinuxweston-stm32mp1/<wbr />tmp-g=
libc/work/cortexa7t2hf-<wbr />neon-vfpv4-ostl-linux-gnueabi/<wbr />mesa-dem=
os/8.3.0-r0/build/src/<wbr />egl/eglut'<br />| Making all in opengles1<br /=
>| make[3]: Entering directory '/home/demetriusz/Developer-<wbr />Package/o=
penst-linux/build-<wbr />openstlinuxweston-stm32mp1/<wbr />tmp-glibc/work/c=
ortexa7t2hf-<wbr />neon-vfpv4-ostl-linux-gnueabi/<wbr />mesa-demos/8.3.0-r0=
/build/src/<wbr />egl/opengles1'<br />| arm-ostl-linux-gnueabi-gcc &nbsp;-m=
arch=3Darmv7ve -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -mcpu=3Dcortex=
-a7 --sysroot=3D/home/demetriusz/<wbr />Developer-Package/openst-<wbr />lin=
ux/build-openstlinuxweston-<wbr />stm32mp1/tmp-glibc/work/<wbr />cortexa7t2=
hf-neon-vfpv4-ostl-<wbr />linux-gnueabi/mesa-demos/8.3.<wbr />0-r0/recipe-s=
ysroot -DPACKAGE_NAME=3D\"mesa-demos\" -DPACKAGE_TARNAME=3D\"mesa-<wbr />de=
mos\" -DPACKAGE_VERSION=3D\"8.3.0\" -DPACKAGE_STRING=3D\"mesa-demos\ 8.3.0\=
" -DPACKAGE_BUGREPORT=3D\"<a href=3D"https://bugs.freedesktop.org/enter_bug=
.cgi%5C?product=3DMesa%5C&amp;component=3DDemos%5C" target=3D"_blank" rel=
=3D"noopener" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps=
://bugs.freedesktop.org/enter_bug.cgi%255C?product%3DMesa%255C%26component%=
3DDemos%255C&amp;source=3Dgmail&amp;ust=3D1590055165876000&amp;usg=3DAFQjCN=
Ew9GAYtsP0_gu6SuYjSM-vv38oXg">https://<wbr />bugs.freedesktop.org/enter_<wb=
r />bug.cgi\?product=3DMesa\&amp;<wbr />component=3DDemos\</a>" -DPACKAGE_U=
RL=3D\"\" -DPACKAGE=3D\"mesa-demos\" -DVERSION=3D\"8.3.0\" -DSTDC_HEADERS=
=3D1 -DHAVE_SYS_TYPES_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHA=
VE_STRING_H=3D1 -DHAVE_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=
=3D1 -DHAVE_STDINT_H=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=3D1 -DLT_OBJDI=
R=3D\".libs/\" -DDEMOS_DATA_DIR=3D\"/usr/share/<wbr />mesa-demos/\" -DDEMOS=
_DATA_DIR=3D\"/usr/share/<wbr />mesa-demos/\" -I. -I../../../../mesa-demos-=
8.3.<wbr />0/src/egl/opengles1 &nbsp; &nbsp; &nbsp; -I../../../../mesa-demo=
s-8.3.<wbr />0/src/egl/eglut -O2 -pipe -g -feliminate-unused-debug-types -f=
debug-prefix-map=3D/home/<wbr />demetriusz/Developer-Package/<wbr />openst-=
linux/build-<wbr />openstlinuxweston-stm32mp1/<wbr />tmp-glibc/work/cortexa=
7t2hf-<wbr />neon-vfpv4-ostl-linux-gnueabi/<wbr />mesa-demos/8.3.0-r0=3D/us=
r/src/<wbr />debug/mesa-demos/8.3.0-r0 -fdebug-prefix-map=3D/home/<wbr />de=
metriusz/Developer-Package/<wbr />openst-linux/build-<wbr />openstlinuxwest=
on-stm32mp1/<wbr />tmp-glibc/work/cortexa7t2hf-<wbr />neon-vfpv4-ostl-linux=
-gnueabi/<wbr />mesa-demos/8.3.0-r0/recipe-<wbr />sysroot=3D -fdebug-prefix=
-map=3D/home/<wbr />demetriusz/Developer-Package/<wbr />openst-linux/build-=
<wbr />openstlinuxweston-stm32mp1/<wbr />tmp-glibc/work/cortexa7t2hf-<wbr /=
>neon-vfpv4-ostl-linux-gnueabi/<wbr />mesa-demos/8.3.0-r0/recipe-<wbr />sys=
root-native=3D &nbsp;-c -o clear.o ../../../../mesa-demos-8.3.0/<wbr />src/=
egl/opengles1/clear.c<br />| arm-ostl-linux-gnueabi-gcc &nbsp;-march=3Darmv=
7ve -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -mcpu=3Dcortex-a7 --sysro=
ot=3D/home/demetriusz/<wbr />Developer-Package/openst-<wbr />linux/build-op=
enstlinuxweston-<wbr />stm32mp1/tmp-glibc/work/<wbr />cortexa7t2hf-neon-vfp=
v4-ostl-<wbr />linux-gnueabi/mesa-demos/8.3.<wbr />0-r0/recipe-sysroot -DPA=
CKAGE_NAME=3D\"mesa-demos\" -DPACKAGE_TARNAME=3D\"mesa-<wbr />demos\" -DPAC=
KAGE_VERSION=3D\"8.3.0\" -DPACKAGE_STRING=3D\"mesa-demos\ 8.3.0\" -DPACKAGE=
_BUGREPORT=3D\"<a href=3D"https://bugs.freedesktop.org/enter_bug.cgi%5C?pro=
duct=3DMesa%5C&amp;component=3DDemos%5C" target=3D"_blank" rel=3D"noopener"=
 data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://bugs.freede=
sktop.org/enter_bug.cgi%255C?product%3DMesa%255C%26component%3DDemos%255C&a=
mp;source=3Dgmail&amp;ust=3D1590055165876000&amp;usg=3DAFQjCNEw9GAYtsP0_gu6=
SuYjSM-vv38oXg">https://<wbr />bugs.freedesktop.org/enter_<wbr />bug.cgi\?p=
roduct=3DMesa\&amp;<wbr />component=3DDemos\</a>" -DPACKAGE_URL=3D\"\" -DPA=
CKAGE=3D\"mesa-demos\" -DVERSION=3D\"8.3.0\" -DSTDC_HEADERS=3D1 -DHAVE_SYS_=
TYPES_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_STRING_H=3D1 -=
DHAVE_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT=
_H=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=3D1 -DLT_OBJDIR=3D\".libs/\" -DDE=
MOS_DATA_DIR=3D\"/usr/share/<wbr />mesa-demos/\" -DDEMOS_DATA_DIR=3D\"/usr/=
share/<wbr />mesa-demos/\" -I. -I../../../../mesa-demos-8.3.<wbr />0/src/eg=
l/opengles1 &nbsp; &nbsp; &nbsp; -I../../../../mesa-demos-8.3.<wbr />0/src/=
egl/eglut -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=3D=
/home/<wbr />demetriusz/Developer-Package/<wbr />openst-linux/build-<wbr />=
openstlinuxweston-stm32mp1/<wbr />tmp-glibc/work/cortexa7t2hf-<wbr />neon-v=
fpv4-ostl-linux-gnueabi/<wbr />mesa-demos/8.3.0-r0=3D/usr/src/<wbr />debug/=
mesa-demos/8.3.0-r0 -fdebug-prefix-map=3D/home/<wbr />demetriusz/Developer-=
Package/<wbr />openst-linux/build-<wbr />openstlinuxweston-stm32mp1/<wbr />=
tmp-glibc/work/cortexa7t2hf-<wbr />neon-vfpv4-ostl-linux-gnueabi/<wbr />mes=
a-demos/8.3.0-r0/recipe-<wbr />sysroot=3D -fdebug-prefix-map=3D/home/<wbr /=
>demetriusz/Developer-Package/<wbr />openst-linux/build-<wbr />openstlinuxw=
eston-stm32mp1/<wbr />tmp-glibc/work/cortexa7t2hf-<wbr />neon-vfpv4-ostl-li=
nux-gnueabi/<wbr />mesa-demos/8.3.0-r0/recipe-<wbr />sysroot-native=3D &nbs=
p;-c -o drawtex.o ../../../../mesa-demos-8.3.0/<wbr />src/egl/opengles1/dra=
wtex.c<br />| ../../../../mesa-demos-8.3.0/<wbr />src/egl/opengles1/clear.c=
:40:<wbr />45: error: unknown type name 'GLclampf'; did you mean 'GLclampx'=
?<br />| &nbsp;typedef void (GL_APIENTRY *type_ClearColor)(GLclampf red, GL=
clampf green, GLclampf blue, GLclampf alpha);<br />| &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~~~~~~<br =
/>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;GLclampx<br />| ../../../../mesa-demos-8.3.0/<wbr />src/egl/o=
pengles1/clear.c:40:<wbr />59: error: unknown type name 'GLclampf'; did you=
 mean 'GLclampx'?<br />| &nbsp;typedef void (GL_APIENTRY *type_ClearColor)(=
GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);<br />| &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~~~~~~<br />| &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GLclampx<br />| ../../=
../../mesa-demos-8.3.0/<wbr />src/egl/opengles1/clear.c:40:<wbr />75: error=
: unknown type name 'GLclampf'; did you mean 'GLclampx'?<br />| &nbsp;typed=
ef void (GL_APIENTRY *type_ClearColor)(GLclampf red, GLclampf green, GLclam=
pf blue, GLclampf alpha);<br />| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~=
~~~~~~<br />| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GLclampx<br />| ../..=
/../../mesa-demos-8.3.0/<wbr />src/egl/opengles1/clear.c:40:<wbr />90: erro=
r: unknown type name 'GLclampf'; did you mean 'GLclampx'?<br />| &nbsp;type=
def void (GL_APIENTRY *type_ClearColor)(GLclampf red, GLclampf green, GLcla=
mpf blue, GLclampf alpha);<br />| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^~~~~~~~<br />| &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; GLclampx<br />| ../../../../mesa-demos-8.3.0/<wbr />src/egl/opengles1/=
clear.c:43:<wbr />8: error: unknown type name 'type_ClearColor'<br />| &nbs=
p;static type_ClearColor fn_ClearColor;<br />| &nbsp; &nbsp; &nbsp; &nbsp; =
^~~~~~~~~~~~~~~<br />| ../../../../mesa-demos-8.3.0/<wbr />src/egl/opengles=
1/clear.c: In function 'init':<br />| ../../../../mesa-demos-8.3.0/<wbr />s=
rc/egl/opengles1/clear.c:73:<wbr />21: error: 'type_ClearColor' undeclared =
(first use in this function); did you mean 'fn_ClearColor'?<br />| &nbsp; &=
nbsp; fn_ClearColor =3D (type_ClearColor) get_proc("glClearColor");<br />| =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;^~~~~~~~~~~~~~~<br />| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;fn_ClearColor<br />| ../../../../mesa-demos-8.3.0/=
<wbr />src/egl/opengles1/clear.c:73:<wbr />21: note: each undeclared identi=
fier is reported only once for each function it appears in<br />| ../../../=
../mesa-demos-8.3.0/<wbr />src/egl/opengles1/clear.c:73:<wbr />37: error: e=
xpected ';' before 'get_proc'<br />| &nbsp; &nbsp; fn_ClearColor =3D (type_=
ClearColor) get_proc("glClearColor");<br />| &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;^~~~~~~~~<br />| &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;;<br />| ../../../../mesa-demos-8.3.0/<wbr />src/=
egl/opengles1/clear.c:76:<wbr />4: error: called object 'fn_ClearColor' is =
not a function or function pointer<br />| &nbsp; &nbsp; fn_ClearColor(1.0, =
0.4, 0.4, 0.0);<br />| &nbsp; &nbsp; ^~~~~~~~~~~~~<br />| ../../../../mesa-=
demos-8.3.0/<wbr />src/egl/opengles1/clear.c:43:<wbr />24: note: declared h=
ere<br />| &nbsp;static type_ClearColor fn_ClearColor;<br />| &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^~~~=
~~~~~~~~~<br />| Makefile:634: recipe for target 'clear.o' failed<br />| ma=
ke[3]: *** [clear.o] Error 1<br />| make[3]: *** Waiting for unfinished job=
s....<br />| make[3]: Leaving directory '/home/demetriusz/Developer-<wbr />=
Package/openst-linux/build-<wbr />openstlinuxweston-stm32mp1/<wbr />tmp-gli=
bc/work/cortexa7t2hf-<wbr />neon-vfpv4-ostl-linux-gnueabi/<wbr />mesa-demos=
/8.3.0-r0/build/src/<wbr />egl/opengles1'<br />| Makefile:413: recipe for t=
arget 'all-recursive' failed<br />| make[2]: *** [all-recursive] Error 1<br=
 />| make[2]: Leaving directory '/home/demetriusz/Developer-<wbr />Package/=
openst-linux/build-<wbr />openstlinuxweston-stm32mp1/<wbr />tmp-glibc/work/=
cortexa7t2hf-<wbr />neon-vfpv4-ostl-linux-gnueabi/<wbr />mesa-demos/8.3.0-r=
0/build/src/<wbr />egl'<br />| Makefile:422: recipe for target 'all-recursi=
ve' failed<br />| make[1]: *** [all-recursive] Error 1<br />| make[1]: Leav=
ing directory '/home/demetriusz/Developer-<wbr />Package/openst-linux/build=
-<wbr />openstlinuxweston-stm32mp1/<wbr />tmp-glibc/work/cortexa7t2hf-<wbr =
/>neon-vfpv4-ostl-linux-gnueabi/<wbr />mesa-demos/8.3.0-r0/build/src'<br />=
| Makefile:439: recipe for target 'all-recursive' failed<br />| make: *** [=
all-recursive] Error 1<br />| ERROR: oe_runmake failed<br />| WARNING: exit=
 code 1 from a shell command.<br />| ERROR: Function failed: do_compile (lo=
g file is located at /home/demetriusz/Developer-<wbr />Package/openst-linux=
/build-<wbr />openstlinuxweston-stm32mp1/<wbr />tmp-glibc/work/cortexa7t2hf=
-<wbr />neon-vfpv4-ostl-linux-gnueabi/<wbr />mesa-demos/8.3.0-r0/temp/log.<=
wbr />do_compile.7265)<br />ERROR: Task (/home/demetriusz/Developer-<wbr />=
Package/openst-linux/layers/<wbr />openembedded-core/meta/<wbr />recipes-gr=
aphics/mesa/mesa-<wbr />demos_8.3.0.bb:do_compile) failed with exit code '1=
'
<div class=3D"adL"><br /><br /></div>
</div>
</div>

--v44ERLkYXx9FLjdOna6w--
