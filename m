Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC4774607
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Sep 2018 11:52:13 +0000 (UTC)
Received: (qmail 4722 invoked by uid 1003); 9 Sep 2018 11:52:14 -0000
Received: from unknown (HELO ?192.168.11.100?)
	(philip@opensdr.com@73.152.143.112)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	9 Sep 2018 11:52:13 -0000
To: openembedded-devel@lists.openembedded.org
References: <20180908025910.13871-1-philip@balister.org>
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
Message-ID: <831f7623-b0fe-40a7-44f9-ed34aa256fee@balister.org>
Date: Sun, 9 Sep 2018 07:52:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180908025910.13871-1-philip@balister.org>
Subject: Re: [meta-oe][PATCH] sip: Update from 4.19.8 to 4.19.12.
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
X-List-Received-Date: Sun, 09 Sep 2018 11:52:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit

I also have any patch suggested by the sip developers. So do not merge
this. I'll need to test their suggestion.

Philip

On 09/07/2018 10:59 PM, Philip Balister wrote:
>  * This builds the private sip module for building PyQt5. In the
>    future we should split into a -tools and -modules. But lets fix
>    building for now
> 
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta-oe/recipes-devtools/sip/files/sip.patch             | 16 ++++++++++++++++
>  .../sip/{sip_4.19.8.bb => sip_4.19.12.bb}                | 16 +++++++++-------
>  2 files changed, 25 insertions(+), 7 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/sip/files/sip.patch
>  rename meta-oe/recipes-devtools/sip/{sip_4.19.8.bb => sip_4.19.12.bb} (69%)
> 
> diff --git a/meta-oe/recipes-devtools/sip/files/sip.patch b/meta-oe/recipes-devtools/sip/files/sip.patch
> new file mode 100644
> index 000000000..78100fc4b
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/sip/files/sip.patch
> @@ -0,0 +1,16 @@
> +diff -Nurd ./sip-4.19.12.orig/configure.py sip-4.19.12/configure.py
> +--- ./sip-4.19.12.orig/configure.py	2018-07-05 05:55:19.000000000 -0400
> ++++ sip-4.19.12/configure.py	2018-09-07 16:41:18.102569271 -0400
> +@@ -949,10 +949,10 @@
> + 
> +     if len(module_path) > 1:
> +         del module_path[-1]
> +-        module_path.insert(0, sip_root_dir)
> ++        module_path.insert(0, sip_module_dir)
> +         sip_module_dir = os.path.join(*module_path)
> +     else:
> +-        sip_module_dir = sip_root_dir
> ++        sip_module_dir = sip_module_dir
> + 
> +     # Override from the command line.
> +     if opts.platform is not None:
> diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.8.bb b/meta-oe/recipes-devtools/sip/sip_4.19.12.bb
> similarity index 69%
> rename from meta-oe/recipes-devtools/sip/sip_4.19.8.bb
> rename to meta-oe/recipes-devtools/sip/sip_4.19.12.bb
> index ea944b32f..be384fd39 100644
> --- a/meta-oe/recipes-devtools/sip/sip_4.19.8.bb
> +++ b/meta-oe/recipes-devtools/sip/sip_4.19.12.bb
> @@ -4,13 +4,15 @@ SECTION = "devel"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
>  
> -inherit python-dir
> -
>  DEPENDS = "python"
>  
> -SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz"
> -SRC_URI[md5sum] = "0625fb20347d4ff1b5da551539be0727"
> -SRC_URI[sha256sum] = "7eaf7a2ea7d4d38a56dd6d2506574464bddf7cf284c960801679942377c297bc"
> +inherit python-dir pythonnative
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz \
> +           file://sip.patch \
> +          "
> +SRC_URI[md5sum] = "e28b0790dfe4962ce6bbd7c4772f40c9"                            
> +SRC_URI[sha256sum] = "24617fc31b983df075500ecac0e99d2fb48bf63ba82d4a17518659e571923822" 
>  
>  BBCLASSEXTEND = "native"
>  
> @@ -23,7 +25,7 @@ do_configure_prepend_class-target() {
>      echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
>      echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
>      echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
> -    python configure.py --configuration sip.cfg --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
> +    python configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
>  }
>  do_configure_prepend_class-native() {
>      echo "py_platform = linux" > sip.cfg
> @@ -32,7 +34,7 @@ do_configure_prepend_class-native() {
>      echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
>      echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
>      echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
> -    python configure.py --configuration sip.cfg --sysroot ${STAGING_DIR_NATIVE}
> +    python configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot=${STAGING_DIR_NATIVE}
>  }
>  do_install() {
>      oe_runmake install
> 

