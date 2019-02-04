Return-Path: <philip@balister.org>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Feb 2019 17:29:46 UTC
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with ESMTP id C49D8600B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 17:29:46 +0000 (UTC)
Received: (qmail 26743 invoked by uid 1003); 4 Feb 2019 17:23:11 -0000
Received: from unknown (HELO ?192.168.1.36?)
	(philip@opensdr.com@91.179.138.138)
	by mail.geekisp.com with (ECDHE-RSA-AES128-GCM-SHA256 encrypted) SMTP;
	4 Feb 2019 17:23:11 -0000
To: Adrian Bunk <bunk@stusta.de>, openembedded-devel@lists.openembedded.org
References: <20190204145940.17783-1-bunk@stusta.de>
From: Philip Balister <philip@balister.org>
Openpgp: preference=signencrypt
Autocrypt: addr=philip@balister.org; prefer-encrypt=mutual; keydata=
	xsBNBE6PN4EBCADXwOSVOvTrJ370tH2RmiR22OuCBcKfnKTLztyV5zA0veDB1kmrIajh+sJe
	HWNqsib0v19S3wdrvqzKrztSfNAgUctvkAuTOloU81dmbAjDSge6nFxjzIIz6XjNvmP5xl9J
	rstPm4i4dhAs5436xf4Bh0vn3C/Bp4fKwXBSW/Xto7vuiuSK03ojon3F8O2WNEmKxHyubFP1
	2tNvXOp/PeAR4LTnYq6fdAAofvbpbPDBg8qICe6j1UXaIyU93IbW+bJp1RFbeakWxiTw+eQ2
	fVjG5XnubNX0YBlmjHDJhjeqV1uwkImNHlZknecLjT7g37vIMwz+PTfPIhmIGffzqtHlABEB
	AAHNJVBoaWxpcCBCYWxpc3RlciA8cGhpbGlwQGJhbGlzdGVyLm9yZz7CwH4EEwECACgCGyMG
	CwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJYM1D9BQkRKOdqAAoJEMDJd4rr0merDX4H/3Pr
	nYKDnml7LRiikoOTFJb4r7ub04skrkGI2DAYvRUPH110KXaan84Qo2Yl4r/ma15Lpqx+cdPR
	3KbFlSWyjgY6CMN/BclutsK4mFkoxnmhdYJvc5M2TDfZLxBPMTeQiHo0MwxUB5v81mv812bx
	YKfEOg3ndk7C/TE0Q8ZER7p6fU3ol/e0ilLyaCpd85nkEcOEI7BdBBGhKWii+Cwvv8g2ofQZ
	3wAsqQFp7PFxlEjo5Xc1QGqo7L+UlDG23QjUn33n+wZMZm9EUZFu1c1MAGZsvXiqKw8P07Mj
	yyf6h6EMVP8wME7gnkxsZkpKv04mSvKpDLIInmRW9ZlHXaJ4YxjOwE0ETo83gQEIAPs+ZC0R
	gF4blrRIiVHdkARncAxUwSUbti5Ku23dQ0iBizozh4YGucgW48gxsvJCkCc9s/4C9e3vYiCZ
	GVGC8x6Ll3vE7xwRQ/euVqJ0mXG7tNK1zAPpSgI6aooPSZCW7PBvwY8uMvzzCzP+EBd0+oA5
	uXQSEcyOJUYy4beferoHUiBjBkyNd+v2iaJf7KjAYYxJOcPvtnq/VL09hlmtCD5zghOn80rt
	LqF66BJkHmATopSWyor1qz7gmowdCkFkUJDNW7yJT1wVANqDd9P5A8vYhngwJTHsvXVftmvB
	gLiJjYuKst36G2AOHgm4ls5jRMa/k7jWue1RKM5LxzgBtLUAEQEAAcLAZQQYAQIADwIbDAUC
	WDNRbAUJESjn5AAKCRDAyXeK69Jnq1qYB/93aiBdenAuu0H/zGWEFFB14cdhDR4S4q0EbfXl
	1z9o3Irazw6WMtLe12zJ4/Xl41Mh/IH8/+AgDnigisrkKRN1TkiOGDUVnS0akkhML3ONbeFd
	ocYEwBAPDTxAaWNoyjDe/bORokSJn31cFoG6QYyzUct79npHorbaXW0zW+KC77Do53yUKQ8+
	icWpfiCMk1YzSHCr0y5NZNVxac9a0+IDzH/YBbNdJLNaMvXcuege1Qqz85pdR0P4XuCVRD2j
	ZAbcGJzZXlu9ZzpIHjtZoyF8paJRMQwzWEO3/Txksmm7K8eu8Tz2JVpjiOIj44MOTKoRGKjO
	6eUfr0u7CwnEyqiQ
Message-ID: <a8c5c5d2-886e-5689-2a43-b4615df3a0bf@balister.org>
Date: Mon, 4 Feb 2019 18:23:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20190204145940.17783-1-bunk@stusta.de>
Subject: Re: [meta-oe][thud][PATCH] Add czmq (C bindings for ZeroMQ)
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
X-List-Received-Date: Mon, 04 Feb 2019 17:29:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit

How are zmq bindings versioned? Just curious why this has a different
version to:

http://layers.openembedded.org/layerindex/recipe/28410/

Thanks,

Philip

On 02/04/2019 03:59 PM, Adrian Bunk wrote:
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb  | 30 +++++++++++++++++++++
>  .../0001-Problem-out-of-date-with-zproject.patch   | 31 ++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb
>  create mode 100644 meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch
> 
> diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb
> new file mode 100644
> index 000000000..f2db0041c
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.1.1.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "C bindings for ZeroMQ"
> +HOMEPAGE = "http://www.zeromq.org"
> +LICENSE = "MPL-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
> +DEPENDS = "zeromq"
> +
> +SRC_URI = "https://github.com/zeromq/czmq/releases/download/v${PV}/czmq-${PV}.tar.gz \
> +    file://0001-Problem-out-of-date-with-zproject.patch \
> +"
> +
> +SRC_URI[md5sum] = "6d3a6fdd25c2bb29897c53670dce97bf"
> +SRC_URI[sha256sum] = "f00ff419881dc2a05d0686c8467cd89b4882677fc56f31c0e2cc81c134cbb0c0"
> +
> +inherit cmake
> +
> +PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-staticdev ${PN} ${PN}-dbg"
> +
> +FILES_${PN} = "${bindir}/*"
> +FILES_lib${BPN} = "${libdir}/*.so.*"
> +FILES_lib${BPN}-dev = "${libdir}/*.so ${libdir}/pkgconfig ${includedir}"
> +FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
> +
> +RDEPENDS_lib${BPN}-dev = "zeromq-dev"
> +
> +PACKAGECONFIG ??= "lz4 uuid"
> +PACKAGECONFIG[lz4] = ",-DCMAKE_DISABLE_FIND_PACKAGE_lz4=TRUE,lz4"
> +PACKAGECONFIG[uuid] = ",-DCMAKE_DISABLE_FIND_PACKAGE_uuid=TRUE,util-linux"
> +
> +BBCLASSEXTEND = "nativesdk"
> +
> diff --git a/meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch b/meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch
> new file mode 100644
> index 000000000..5f5702c8c
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch
> @@ -0,0 +1,31 @@
> +From d155ffd33630f80b23c31b3a6e01da221dd9bd13 Mon Sep 17 00:00:00 2001
> +From: Luca Boccassi <luca.boccassi@gmail.com>
> +Date: Fri, 30 Mar 2018 16:36:22 +0100
> +Subject: [PATCH] Problem: out of date with zproject
> +
> +Upstream-Status: backport
> +Signed-off-by: Adrian Bunk <bunk@stusta.de>
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index a3b81722..4f203461 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -38,7 +38,7 @@ if (NOT CMAKE_BUILD_TYPE)
> +             OUTPUT_STRIP_TRAILING_WHITESPACE
> +         )
> +         message(STATUS "git workspace root [${git_result}]: ${git_root}")
> +-        if ( "${git_result}" == "0" )
> ++        if ( "${git_result}" STREQUAL "0" )
> +             set (CMAKE_BUILD_TYPE Debug)
> +         else ()
> +             set (CMAKE_BUILD_TYPE Release)
> +@@ -608,7 +608,7 @@ add_custom_command(
> +     TARGET  distclean
> + )
> + 
> +-include(ClangFormat)
> ++include(ClangFormat OPTIONAL)
> + 
> + ########################################################################
> + # summary
> +
> 

