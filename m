Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 089A871A18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:45:27 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c85so11382118wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 03:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eIAwHeezo+BN7+PI6FPjrk8Sf2HVALKQy/Mg8XiK7cs=;
	b=gdMZN9RsmHPoL1wiWqX8E3DG24lxSUofE591wZTpS9G09dMcz5gADADGXWpmPlYrBJ
	zO+KhQ3xl+149dvoSWKPwNWQdh8wW9++Nn0NgTLT7s5VLcmFvR3iB+Gbij7BUXZa9uyK
	v8zW94jIvEePHpRA3/5nH5gpEG/nOLpnVN6OtwqEKkTfkc1lh9tZk/WxW/LtFCzRwzOQ
	3TgrtibiZA0K2wDS6u8DVfMXanoMxpSFrABqfokGkMhb37t/Aquk85ZjpE3F3CCg0Dep
	oJ2zpRbPXOSdtgg63J84NzNaJY4st5QSLdXPA6j3IkScYVr/Ccmh1tmHtWnOnLwNZjWd
	6+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eIAwHeezo+BN7+PI6FPjrk8Sf2HVALKQy/Mg8XiK7cs=;
	b=cLc8B3Utnwlwq6h3gE3vXAnnTst61gtglQK5+0vd1rZfgWtQBAP5dhA+h8CLrJfUYz
	iT7vtj/gt6+cQbt3Kr6QVzoIl7u4l+8vBF3KZpKxaPwgE9iYDDUfbL8zpDZrxvrah6Rr
	2Ik+16h/Q+BXe7ssDi6zQ7kLOO7y1JSUYh1pt7Gs4ND9q8W+/PJZLMQzCYo/vnnInyEp
	PPwksK5iP4ieD0QYs0XlFkl1MW4YEzpX5CgNihT9bq2LNTS9ngeXX+rQ387xXmO94oHo
	YZKQX0Vo4rt07nlWMpRVC43e70mMDBS1Rmn2vPygTKF5BEkfRlQK8PbbGLg7VDN9VOMS
	/OLQ==
X-Gm-Message-State: AIkVDXKiidKBIiHxR65F0ZtfhDmdCCXdpS0tMhwtSt88xR7eCCwX+xGFte7g7gusNx/3Yw==
X-Received: by 10.223.177.202 with SMTP id r10mr7173201wra.94.1484826327506;
	Thu, 19 Jan 2017 03:45:27 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 63sm52723328wmg.2.2017.01.19.03.45.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Jan 2017 03:45:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jan 2017 12:45:29 +0100
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20170119114529.GG3265@jama>
References: <20161229133508.5584-1-ricardo.ribalda@gmail.com>
	<20161229133508.5584-2-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161229133508.5584-2-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] opencv: Update to version 3.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2017 11:45:28 -0000
X-Groupsio-MsgNum: 64792
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WkfBGePaEyrk4zXB"
Content-Disposition: inline

--WkfBGePaEyrk4zXB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 29, 2016 at 02:35:08PM +0100, Ricardo Ribalda Delgado wrote:
> -Only enable protobuf as dependency if dnn module is enabled
> -Download manually xfeatures from 3rd party repo
> -Remove uneeded fixgcc60patch

Fails to build now:
http://errors.yoctoproject.org/Errors/Details/117456/

>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  ...01-3rdparty-ippicv-Use-pre-downloaded-ipp.patch |  2 +-
>  .../recipes-support/opencv/opencv/fixgcc60.patch   | 30 ----------------=
------
>  .../opencv/opencv/uselocalxfeatures.patch          | 12 +++++++++
>  .../opencv/opencv/useoeprotobuf.patch              | 13 ++++++++++
>  .../opencv/{opencv_3.1.bb =3D> opencv_3.2.bb}        | 27 +++++++++++---=
-----
>  5 files changed, 43 insertions(+), 41 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/opencv/opencv/fixgcc60.patch
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/uselocalxfeatur=
es.patch
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/useoeprotobuf.p=
atch
>  rename meta-oe/recipes-support/opencv/{opencv_3.1.bb =3D> opencv_3.2.bb}=
 (87%)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-U=
se-pre-downloaded-ipp.patch b/meta-oe/recipes-support/opencv/opencv/0001-3r=
dparty-ippicv-Use-pre-downloaded-ipp.patch
> index d568018b8d91..1077d05be5c6 100644
> --- a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-=
downloaded-ipp.patch
> +++ b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-=
downloaded-ipp.patch
> @@ -17,7 +17,7 @@ index a6016dbe10bc..af4062c8e95e 100644
>     endif()
>  =20
>  +  if(NOT DEFINED OPENCV_ICV_PATH)
> -   set(OPENCV_ICV_UNPACK_PATH "${CMAKE_CURRENT_LIST_DIR}/unpack")
> +   set(OPENCV_ICV_UNPACK_PATH "${CMAKE_BINARY_DIR}/3rdparty/ippicv")
>     set(OPENCV_ICV_PATH "${OPENCV_ICV_UNPACK_PATH}${OPENCV_ICV_PACKAGE_SU=
BDIR}")
>  +  endif()
>  =20
> diff --git a/meta-oe/recipes-support/opencv/opencv/fixgcc60.patch b/meta-=
oe/recipes-support/opencv/opencv/fixgcc60.patch
> deleted file mode 100644
> index 5d0bf97cab63..000000000000
> --- a/meta-oe/recipes-support/opencv/opencv/fixgcc60.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -diff --git a/cmake/OpenCVPCHSupport.cmake b/cmake/OpenCVPCHSupport.cmake
> -index 28ccc1c6be4f..b0e1cbf77287 100644
> ---- a/cmake/OpenCVPCHSupport.cmake
> -+++ b/cmake/OpenCVPCHSupport.cmake
> -@@ -19,7 +19,7 @@ IF(CMAKE_COMPILER_IS_GNUCXX)
> -         ARGS ${CMAKE_CXX_COMPILER_ARG1} -dumpversion
> -         OUTPUT_VARIABLE gcc_compiler_version)
> -     #MESSAGE("GCC Version: ${gcc_compiler_version}")
> --    IF(gcc_compiler_version VERSION_GREATER "4.2.-1")
> -+    IF(gcc_compiler_version VERSION_GREATER "4.2.-1" AND gcc_compiler_v=
ersion VERSION_LESS "6.0.0")
> -         SET(PCHSupport_FOUND TRUE)
> -     ENDIF()
> -=20
> -diff --git a/cmake/OpenCVUtils.cmake b/cmake/OpenCVUtils.cmake
> -index 3a23cd73633d..1fea1578b1d9 100644
> ---- a/cmake/OpenCVUtils.cmake
> -+++ b/cmake/OpenCVUtils.cmake
> -@@ -76,7 +76,11 @@ function(ocv_include_directories)
> -     if("${__abs_dir}" MATCHES "^${OpenCV_SOURCE_DIR}" OR "${__abs_dir}"=
 MATCHES "^${OpenCV_BINARY_DIR}")
> -       list(APPEND __add_before "${dir}")
> -     else()
> --      include_directories(AFTER SYSTEM "${dir}")
> -+	    if (gcc_compiler_version VERSION_LESS "6.0.0")
> -+		    include_directories(AFTER SYSTEM "${dir}")
> -+	    else()
> -+		    include_directories(AFTER "${dir}")
> -+	    endif()
> -     endif()
> -   endforeach()
> -   include_directories(BEFORE ${__add_before})
> diff --git a/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patc=
h b/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch
> new file mode 100644
> index 000000000000..a2db48d7c907
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch
> @@ -0,0 +1,12 @@
> +diff --git a/modules/xfeatures2d/CMakeLists.txt b/modules/xfeatures2d/CM=
akeLists.txt
> +index f295bddaed66..6086e75ec37b 100644
> +--- a/modules/xfeatures2d/CMakeLists.txt
> ++++ b/modules/xfeatures2d/CMakeLists.txt
> +@@ -1,5 +1,5 @@
> + set(the_description "Contributed/Experimental Algorithms for Salient 2D=
 Features Detection")
> + ocv_define_module(xfeatures2d opencv_core opencv_imgproc opencv_feature=
s2d opencv_calib3d opencv_shape opencv_highgui opencv_videoio opencv_ml
> +                   OPTIONAL opencv_cudaarithm WRAP python java)
> +-include(cmake/download_vgg.cmake)
> +-include(cmake/download_boostdesc.cmake)
> ++#include(cmake/download_vgg.cmake)
> ++#include(cmake/download_boostdesc.cmake)
> diff --git a/meta-oe/recipes-support/opencv/opencv/useoeprotobuf.patch b/=
meta-oe/recipes-support/opencv/opencv/useoeprotobuf.patch
> new file mode 100644
> index 000000000000..3068bd44d878
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/useoeprotobuf.patch
> @@ -0,0 +1,13 @@
> +diff --git a/modules/dnn/cmake/OpenCVFindLibProtobuf.cmake b/modules/dnn=
/cmake/OpenCVFindLibProtobuf.cmake
> +index eb2a729cc2eb..8717736484de 100644
> +--- a/modules/dnn/cmake/OpenCVFindLibProtobuf.cmake
> ++++ b/modules/dnn/cmake/OpenCVFindLibProtobuf.cmake
> +@@ -24,7 +24,7 @@ if(NOT BUILD_PROTOBUF AND NOT (DEFINED PROTOBUF_INCLUD=
E_DIR AND DEFINED PROTOBUF
> +   find_package(Protobuf QUIET)
> + endif()
> +=20
> +-if(PROTOBUF_FOUND)
> ++if(PROTOBUF_FOUND OR (DEFINED PROTOBUF_INCLUDE_DIR AND DEFINED PROTOBUF=
_LIBRARIES))
> +   # nothing
> + else()
> +   include(${CMAKE_CURRENT_LIST_DIR}/download_protobuf.cmake)
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recip=
es-support/opencv/opencv_3.2.bb
> similarity index 87%
> rename from meta-oe/recipes-support/opencv/opencv_3.1.bb
> rename to meta-oe/recipes-support/opencv/opencv_3.2.bb
> index 17805f7a017a..f18aa796f9aa 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.2.bb
> @@ -3,33 +3,40 @@ HOMEPAGE =3D "http://opencv.org/"
>  SECTION =3D "libs"
> =20
>  LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0ea90d28b4de883d7af5e6711f14f=
7bf"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2b2f8752cc5edf504d283107d033f=
544"
> =20
>  ARM_INSTRUCTION_SET_armv4 =3D "arm"
>  ARM_INSTRUCTION_SET_armv5 =3D "arm"
> =20
> -DEPENDS =3D "libtool swig swig-native python bzip2 zlib glib-2.0 libwebp=
 protobuf protobuf-native"
> +DEPENDS =3D "libtool swig swig-native python bzip2 zlib glib-2.0 libwebp"
> =20
> -SRCREV_opencv =3D "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
> -SRCREV_contrib =3D "5409d5ad560523c85c6796cc5a009347072d883c"
> -SRCREV_party3 =3D "81a676001ca8075ada498583e4166079e5744668"
> +SRCREV_opencv =3D "70bbf17b133496bd7d54d034b0f94bd869e0e810"
> +SRCREV_contrib =3D "86342522b0eb2b16fa851c020cc4e0fef4e010b7"
> +SRCREV_ipp =3D "81a676001ca8075ada498583e4166079e5744668"
> +SRCREV_bootdesc =3D "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
> +SRCREV_vgg =3D "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
>  IPP_MD5 =3D "808b791a6eac9ed78d32a7666804320e"
> =20
>  SRCREV_FORMAT =3D "opencv"
>  SRC_URI =3D "git://github.com/opencv/opencv.git;name=3Dopencv \
>      git://github.com/opencv/opencv_contrib.git;destsuffix=3Dcontrib;name=
=3Dcontrib \
> -    git://github.com/opencv/opencv_3rdparty.git;branch=3Dippicv/master_2=
0151201;destsuffix=3Dparty3;name=3Dparty3 \
> +    git://github.com/opencv/opencv_3rdparty.git;branch=3Dippicv/master_2=
0151201;destsuffix=3Dipp;name=3Dipp \
> +    git://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatur=
es2d_boostdesc_20161012;destsuffix=3Dbootdesc;name=3Dbootdesc \
> +    git://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatur=
es2d_vgg_20160317;destsuffix=3Dvgg;name=3Dvgg \
>      file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
> -    file://fixgcc60.patch \
>      file://fixpkgconfig.patch \
> +    file://uselocalxfeatures.patch;patchdir=3D../contrib/ \
> +    file://useoeprotobuf.patch;patchdir=3D../contrib/ \
>  "
> =20
> -PV =3D "3.1+git${SRCPV}"
> +PV =3D "3.2+git${SRCPV}"
> =20
>  S =3D "${WORKDIR}/git"
> =20
>  do_unpack_extra() {
> -    tar xzf ${WORKDIR}/party3/ippicv/ippicv_linux_20151201.tgz -C ${WORK=
DIR}
> +    tar xzf ${WORKDIR}/ipp/ippicv/ippicv_linux_20151201.tgz -C ${WORKDIR}
> +    cp ${WORKDIR}/vgg/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
> +    cp ${WORKDIR}/bootdesc/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
>  }
>  addtask unpack_extra after do_unpack before do_patch
> =20
> @@ -52,7 +59,7 @@ PACKAGECONFIG ??=3D "python3 eigen jpeg png tiff v4l li=
bv4l gstreamer samples tbb
> =20
>  PACKAGECONFIG[amdblas] =3D "-DWITH_OPENCLAMDBLAS=3DON,-DWITH_OPENCLAMDBL=
AS=3DOFF,libclamdblas,"
>  PACKAGECONFIG[amdfft] =3D "-DWITH_OPENCLAMDFFT=3DON,-DWITH_OPENCLAMDFFT=
=3DOFF,libclamdfft,"
> -PACKAGECONFIG[dnn] =3D "-DBUILD_opencv_dnn=3DON,-DBUILD_opencv_dnn=3DOFF=
,lapack,"
> +PACKAGECONFIG[dnn] =3D "-DBUILD_opencv_dnn=3DON -DUPDATE_PROTO_FILES=3DO=
N -DBUILD_PROTOBUF=3DOFF,-DBUILD_opencv_dnn=3DOFF,lapack protobuf protobuf-=
native,"
>  PACKAGECONFIG[eigen] =3D "-DWITH_EIGEN=3DON,-DWITH_EIGEN=3DOFF,libeigen =
gflags glog,"
>  PACKAGECONFIG[gphoto2] =3D "-DWITH_GPHOTO2=3DON,-DWITH_GPHOTO2=3DOFF,lib=
gphoto2,"
>  PACKAGECONFIG[gstreamer] =3D "-DWITH_GSTREAMER=3DON,-DWITH_GSTREAMER=3DO=
FF,gstreamer1.0 gstreamer1.0-plugins-base,"
> --=20
> 2.11.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WkfBGePaEyrk4zXB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWICm2AAKCRA3VSO3ZXaA
HI3vAJ90OsFUngfGWl0OZ+bLU43/3IFcZwCghD/zzrQinOE9W33iUhkPv4K2Dpo=
=ZUy2
-----END PGP SIGNATURE-----

--WkfBGePaEyrk4zXB--
