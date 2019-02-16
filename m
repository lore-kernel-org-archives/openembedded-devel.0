Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA377C7C6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2019 06:36:09 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id v10so13618488qtp.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 22:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HLaocpO1L8G01YTgk2p4wxpr42KfPXojwop91mkYgNA=;
	b=CCTDVdcw6GA6Hr50ZNyji2h1ml0c2SLtjXY8HrFs+xrEKq21biqS3V+tGXueSh1Vfl
	IfEVzjpuDNZW0VWhYNAG67F0g8J/gueTH1KF8j5bANIHZyml2Q8t9XL1SWT/q+fDG+H3
	tgrIfY5b1BDetSoEeT81lFAfYvB0ReKECTkLyvIzo7YOlaDjdazd+eWKrKwYjgVBW4Og
	KA480mrsD7KdJkrtT/vIDnhXfau1i8hnVDYNdB5/LWgNtCIwIpT6BNyYZ1jp7PKIOehi
	cCLAFAX2aRFQp53iZwCClC/X0bTPd42Yzt/5qLBxJQC2JkrK9A7rCyvt6PYMuq1XiJ78
	YZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HLaocpO1L8G01YTgk2p4wxpr42KfPXojwop91mkYgNA=;
	b=G8hTu3274Wq1f6OxsS/52iRJewPcxj1fhNLyG6CTJQHud0VWP0AX/Cz+GAWhn5XDO8
	zew8+aWrhHM1ATb2CEbH8xaZ5x0f7471YIkGAhOitjcTgdDjlbQaM3VEAWxP00StUAcC
	IX0/YRGo5NA9cP/KJ/lVOYWQ8qdFgVjbXX4Z7QukzKS6BF8L/B+AwiJVhHmyTJWubbMV
	ckCVTqFsZV2g4exJVrajZ7urMWa7YaW0PAr2fx48JFQKcyDHt6my9/0chPLhnzwTbXrm
	/AlRh5z5puVpZhSkkaoCvwdV1/DJ2n8Bdsj6FL2R/h2Gw7/QqELmGN7u4/nLBjY8QbEp
	sK2w==
X-Gm-Message-State: AHQUAuat5sHnSaeV4rbMDupRZq0qRB9QQ+tFPwd9HDMbgYNX0Kpsxp7z
	Vjaape2NoY99tSGCBSkBJiW1pSTWhB3eu7tq5NB/sT/a
X-Google-Smtp-Source: AHgI3IY7v6FH1J8woh26myEQAQg1h+Ot7rAfJ2zJ5q9YXfQn7UeeZ2UMBAqhB4nnKpoJw8tmeiH6Fun+uWD1bXuglAk=
X-Received: by 2002:a0c:c103:: with SMTP id f3mr10088850qvh.194.1550298970162; 
	Fri, 15 Feb 2019 22:36:10 -0800 (PST)
MIME-Version: 1.0
References: <20190214145313.5406-1-andrej.valek@siemens.com>
	<20190215204204.4302-1-andrej.valek@siemens.com>
	<CAMKF1spvT8t80HN3cL-pMBLEySePtZWOkTNcKrpGvCgckgFWhQ@mail.gmail.com>
In-Reply-To: <CAMKF1spvT8t80HN3cL-pMBLEySePtZWOkTNcKrpGvCgckgFWhQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 22:35:44 -0800
Message-ID: <CAMKF1spmwwQnKNSrdbDPGq2d4SPOe4SP92TrdhqXLHrsEgLAwg@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] nodejs 8.15.0 -> 10.15.1
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
X-List-Received-Date: Sat, 16 Feb 2019 06:36:09 -0000
Content-Type: text/plain; charset="UTF-8"

here is link https://errors.yoctoproject.org/Errors/Details/228122/
On Fri, Feb 15, 2019 at 10:35 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Feb 15, 2019 at 12:43 PM Andrej Valek <andrej.valek@siemens.com> wrote:
> >
> > Update nodejs to active 10.x LTS release 10.15.1.
> >
>
> nodejs-native fails on ubuntu 14.04 which has gcc 4.8, I wonder
> if there is a fix for this or do we expect it to not work
> with 4.8 compiler
>
> > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > ---
> >  ...isable-running-gyp-files-for-bundled-deps.patch | 23 ++++++--------
> >  .../nodejs/nodejs/0002-Using-native-torque.patch   | 36 ++++++++++++++++++++++
> >  .../nodejs/nodejs/0003-Link-atomic-library.patch   | 20 ++++++++++++
> >  .../nodejs/{nodejs_8.15.0.bb => nodejs_10.15.1.bb} | 18 ++++++++---
> >  4 files changed, 80 insertions(+), 17 deletions(-)
> >  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch
> >  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0003-Link-atomic-library.patch
> >  rename meta-oe/recipes-devtools/nodejs/{nodejs_8.15.0.bb => nodejs_10.15.1.bb} (86%)
> >
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
> > index 324a4683d..5d0dc03b6 100644
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
> > @@ -4,26 +4,23 @@ Date: Thu, 27 Apr 2017 14:25:42 +0200
> >  Subject: [PATCH] Disable running gyp on shared deps
> >
> >  ---
> > - Makefile | 7 +++----
> > - 1 file changed, 3 insertions(+), 4 deletions(-)
> > + Makefile | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/Makefile b/Makefile
> > -index 0a217bd893..e1229ad07f 100644
> > +index a98772f..f5663e2 100644
> >  --- a/Makefile
> >  +++ b/Makefile
> > -@@ -79,10 +79,9 @@ $(NODE_G_EXE): config.gypi out/Makefile
> > -       $(MAKE) -C out BUILDTYPE=Debug V=$(V)
> > -       if [ ! -r $@ -o ! -L $@ ]; then ln -fs out/Debug/$(NODE_EXE) $@; fi
> > +@@ -123,8 +123,8 @@ with-code-cache:
> > + test-code-cache: with-code-cache
> > +       $(PYTHON) tools/test.py $(PARALLEL_ARGS) --mode=$(BUILDTYPE_LOWER) code-cache
> >
> >  -out/Makefile: common.gypi deps/uv/uv.gyp deps/http_parser/http_parser.gyp \
> >  -              deps/zlib/zlib.gyp deps/v8/gypfiles/toolchain.gypi \
> > --              deps/v8/gypfiles/features.gypi deps/v8/src/v8.gyp node.gyp \
> > --              config.gypi
> >  +out/Makefile: common.gypi deps/http_parser/http_parser.gyp \
> > -+              deps/v8/gypfiles/toolchain.gypi deps/v8/gypfiles/features.gypi \
> > -+                        deps/v8/src/v8.gyp node.gyp config.gypi
> > ++              deps/v8/gypfiles/toolchain.gypi \
> > +               deps/v8/gypfiles/features.gypi deps/v8/gypfiles/v8.gyp node.gyp \
> > +               config.gypi
> >         $(PYTHON) tools/gyp_node.py -f make
> > -
> > - config.gypi: configure
> >  --
> > -2.12.2
> > +2.19.2
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch
> > new file mode 100644
> > index 000000000..e9035f9eb
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch
> > @@ -0,0 +1,36 @@
> > +From 4bbee5e3d58bc4911999f3ec2cc5aab8ded6717b Mon Sep 17 00:00:00 2001
> > +From: "Winker Matthias (TT-CA/ENG1)" <Matthias.Winker@de.bosch.com>
> > +Date: Tue, 11 Dec 2018 10:44:29 +0100
> > +Subject: [PATCH] Using native torque
> > +
> > +---
> > + deps/v8/gypfiles/v8.gyp | 6 ++++--
> > + 1 file changed, 4 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/deps/v8/gypfiles/v8.gyp b/deps/v8/gypfiles/v8.gyp
> > +index 8c78f02255..434168844e 100644
> > +--- a/deps/v8/gypfiles/v8.gyp
> > ++++ b/deps/v8/gypfiles/v8.gyp
> > +@@ -2831,7 +2831,6 @@
> > +         {
> > +           'action_name': 'run_torque',
> > +           'inputs': [  # Order matters.
> > +-            '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
> > +             '../src/builtins/base.tq',
> > +             '../src/builtins/array.tq',
> > +             '../src/builtins/typed-array.tq',
> > +@@ -2845,7 +2844,10 @@
> > +             '<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed-array-from-dsl-gen.cc',
> > +             '<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed-array-from-dsl-gen.h',
> > +           ],
> > +-          'action': ['<@(_inputs)', '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated'],
> > ++          'action': [
> > ++            'torque',
> > ++            '<@(_inputs)',
> > ++            '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated'],
> > +         },
> > +       ],
> > +     }, # torque
> > +--
> > +2.19.2
> > +
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Link-atomic-library.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Link-atomic-library.patch
> > new file mode 100644
> > index 000000000..66ff18b4a
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Link-atomic-library.patch
> > @@ -0,0 +1,20 @@
> > +Link atomic library to fix missing undefined referrences
> > +like "undefined reference to `__atomic_fetch_add_8'"
> > +
> > +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > +
> > +diff -Naur node-v10.15.1/deps/v8/gypfiles/v8.gyp node-v10.15.1/deps/v8/gypfiles/v8.gyp
> > +--- node-v10.15.1/deps/v8/gypfiles/v8.gyp      2019-02-13 09:02:21.000000000 +0100
> > ++++ node-v10.15.1/deps/v8/gypfiles/v8.gyp      2019-02-15 21:27:11.755679660 +0100
> > +@@ -452,6 +452,11 @@
> > +         '<(DEPTH)',
> > +         '<(SHARED_INTERMEDIATE_DIR)'
> > +       ],
> > ++      'link_settings': {
> > ++        'libraries': [
> > ++          '-latomic'
> > ++        ],
> > ++      },
> > +       'sources': [
> > +         '<@(inspector_all_sources)',
> > +         '../include//v8-inspector-protocol.h',
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.15.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
> > similarity index 86%
> > rename from meta-oe/recipes-devtools/nodejs/nodejs_8.15.0.bb
> > rename to meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
> > index 44eaee974..f2bfe8abe 100644
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs_8.15.0.bb
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
> > @@ -1,9 +1,10 @@
> >  DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
> >  HOMEPAGE = "http://nodejs.org"
> >  LICENSE = "MIT & BSD & Artistic-2.0"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=fde91d5c5bbd1e0389623e1ac018d9e8"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=9ceeba79eb2ea1067b7b3ed16fff8bab"
> >
> >  DEPENDS = "openssl zlib icu"
> > +DEPENDS_append_class-target = " nodejs-native"
> >
> >  inherit pkgconfig
> >
> > @@ -13,9 +14,14 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
> >
> >  SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
> >             file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
> > -"
> > -SRC_URI[md5sum] = "bfc5da493c72ded3a7f43b5662bfc53c"
> > -SRC_URI[sha256sum] = "968523333947cc3f769d73dedc6c9c60580826d8714bc0e62ca4589de6a7c633"
> > +           file://0003-Link-atomic-library.patch \
> > +           "
> > +SRC_URI_append_class-target = " \
> > +           file://0002-Using-native-torque.patch \
> > +           "
> > +
> > +SRC_URI[md5sum] = "1cad7963255de53509bfa560221bdc88"
> > +SRC_URI[sha256sum] = "1a55f7b9fb80442182d9e1eba4fca4dac3c781cdcb25d6be37b24d253f61c858"
> >
> >  S = "${WORKDIR}/node-v${PV}"
> >
> > @@ -74,6 +80,10 @@ do_install_append_class-native() {
> >      # use sed on npm-cli.js because otherwise symlink is replaced with normal file and
> >      # npm-cli.js continues to use old shebang
> >      sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> > +
> > +    # Install the native torque to provide it within sysroot for the target compilation
> > +    install -d ${D}${bindir}
> > +    install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
> >  }
> >
> >  do_install_append_class-target() {
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

