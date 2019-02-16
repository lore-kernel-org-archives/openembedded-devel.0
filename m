Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 814 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 16 Feb 2019 08:08:19 UTC
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id C8FC87C619
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Feb 2019 08:08:19 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x1G7sjYp027637
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Sat, 16 Feb 2019 08:54:45 +0100
Received: from [192.168.253.100] ([167.87.34.169])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x1G7sjAJ028433;
	Sat, 16 Feb 2019 08:54:45 +0100
To: Khem Raj <raj.khem@gmail.com>
References: <20190214145313.5406-1-andrej.valek@siemens.com>
	<20190215204204.4302-1-andrej.valek@siemens.com>
	<CAMKF1spvT8t80HN3cL-pMBLEySePtZWOkTNcKrpGvCgckgFWhQ@mail.gmail.com>
	<CAMKF1spmwwQnKNSrdbDPGq2d4SPOe4SP92TrdhqXLHrsEgLAwg@mail.gmail.com>
From: Andrej Valek <andrej.valek@siemens.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrej.valek@siemens.com; prefer-encrypt=mutual; keydata=
	mQENBFkSzTcBCADSJTRk7YudjxZ/ma2IXPV4Y5gkACJKDOYAZcRqNjDbIFUmc7ck3KeuUGKy
	ifrpWD6/7YPXbixv4sAlFly6sNL31agVHLO4BCCE77DaZ2smiN0JaLYzmMdr0BPLMsL96nBO
	UDo8o2a1NwU+GpD8a0/vcovro+NgLvfk9xP4rYAve09VYvF4DbQNW9Y+8reqWFnBI8EN5Fps
	vPCUr/TSuxk3VpU//8QtP7WqyRA31qiWFDxE2dqSnrpUBojxQMY94tDP7kjQtzD2ZpaDt1oL
	PDE/n6qtYG792JVvNjuo1QpfPo8a8I4HvMmbh/Orv0fniauB229OaWNPp27ln55xG8FvABEB
	AAG0J0FuZHJlaiBWYWxlayA8YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29tPokBPgQTAQIAKAUC
	WRLNNwIbAwUJA8JnAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQ3npj5PmioO8DZQgA
	ibpOwfxDw3qlSEHDE395Tf+bEAYWjjNz9OQB4nnhq1Ql9jbUhfQQk/equaxoIfNHyLNDbeUU
	8ULLXJS+nDRi13yf2w/9L386fd5V63cdP6no2dpnEhwOKV1miiUtvcjDCe3bjm7WHVfg9OsF
	4AWox+/GR6sGJHRestHeXIJthmru8dB57oKy2fPgPpY1Ld1Wwb4okZgIi+1sKx19fk2xX9lc
	KpdvCXx+6FB3a9+sJTmb12meeGtKWC7BeElM2sG5NK7yx9zFNqSRebilwNankSE0QzWwmu4M
	bW6OTuxv/3qeHIvFH3EhrEmnd68Zm4+/jx2ZN5Ax23ZaGD8pabuO57kBDQRZEs03AQgA0oCu
	faa9qlV0iYK+XlLcW6u55/o5psqtwoUCo8u18v8j4qB80r9latFKsO/SOjhVOYgIuzTTftQs
	Di71i9GJwK8Kk2FMo0YuJ9J9xdcvmjUI2vNUbOcaz2V0tRC9P/P5UaIltQAMVxbFHDwj17UA
	7YpEUL3ixxMs/usIKKGA+jIvsBdcn1WFji/NXLffwQ+zrAoT3q8EuGn4jSdROND16e9ynKgk
	D5D+EoA5RoFi8y3tRHJsi/dNlaUISsQOux/MgXsk1UU2lkmq7uxddRw8xwzG5dhx79sQp4Dt
	YpSfZBylD3DnCTg3ajdWCHGVyBdMLVncfj8sPDsVkCozTaSqFwARAQABiQElBBgBAgAPBQJZ
	Es03AhsMBQkDwmcAAAoJEN56Y+T5oqDv8EEH/0qUECI1OpJS5R9Di9yc6YOfyNdCFHJ5rnUx
	dTr5+U3z30HBpzv1yPtO0fRQPulFRp2T81nhzT07B6Jce/pPUPE4QUVuwkM80KUbveJSNVHH
	Vp+9MGHEmpSevVHGKwzr+/7n5KJd5+SX3Y0mFxbu7GUZTMvM9Ra/p7lu0DsAH1CgEzKf3KTx
	FrUN9oSYETbN3l6+pxO3RYAxtCVRMCOCJ7skHkfPH0ADxsbecaKo2CHqcDJigqZBKxjnWYsm
	0+8mRhIQs3JuF0z7hKJGRacdGvKdQbCo0swLT9NVWU0IcUc/gwsCzQu/0Iml1x6MbgameiX4
	emYHzsJ3+vLapH+kAEI=
Message-ID: <60803d1c-1198-69d6-a7c8-52cf87ac2885@siemens.com>
Date: Sat, 16 Feb 2019 08:54:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spmwwQnKNSrdbDPGq2d4SPOe4SP92TrdhqXLHrsEgLAwg@mail.gmail.com>
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
X-List-Received-Date: Sat, 16 Feb 2019 08:08:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

I have set-up qemumips build, to check, if it's working or not.
But, is it really strange, isn't it?

What about just add it directly into ldflags, like "-Wl,--as-needed" ?

Andrej

On 2/16/19 7:35 AM, Khem Raj wrote:
> here is link https://errors.yoctoproject.org/Errors/Details/228122/
> On Fri, Feb 15, 2019 at 10:35 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Fri, Feb 15, 2019 at 12:43 PM Andrej Valek <andrej.valek@siemens.com> wrote:
>>>
>>> Update nodejs to active 10.x LTS release 10.15.1.
>>>
>>
>> nodejs-native fails on ubuntu 14.04 which has gcc 4.8, I wonder
>> if there is a fix for this or do we expect it to not work
>> with 4.8 compiler
>>
>>> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>>> ---
>>>  ...isable-running-gyp-files-for-bundled-deps.patch | 23 ++++++--------
>>>  .../nodejs/nodejs/0002-Using-native-torque.patch   | 36 ++++++++++++++++++++++
>>>  .../nodejs/nodejs/0003-Link-atomic-library.patch   | 20 ++++++++++++
>>>  .../nodejs/{nodejs_8.15.0.bb => nodejs_10.15.1.bb} | 18 ++++++++---
>>>  4 files changed, 80 insertions(+), 17 deletions(-)
>>>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch
>>>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0003-Link-atomic-library.patch
>>>  rename meta-oe/recipes-devtools/nodejs/{nodejs_8.15.0.bb => nodejs_10.15.1.bb} (86%)
>>>
>>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
>>> index 324a4683d..5d0dc03b6 100644
>>> --- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
>>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
>>> @@ -4,26 +4,23 @@ Date: Thu, 27 Apr 2017 14:25:42 +0200
>>>  Subject: [PATCH] Disable running gyp on shared deps
>>>
>>>  ---
>>> - Makefile | 7 +++----
>>> - 1 file changed, 3 insertions(+), 4 deletions(-)
>>> + Makefile | 4 ++--
>>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>>  diff --git a/Makefile b/Makefile
>>> -index 0a217bd893..e1229ad07f 100644
>>> +index a98772f..f5663e2 100644
>>>  --- a/Makefile
>>>  +++ b/Makefile
>>> -@@ -79,10 +79,9 @@ $(NODE_G_EXE): config.gypi out/Makefile
>>> -       $(MAKE) -C out BUILDTYPE=Debug V=$(V)
>>> -       if [ ! -r $@ -o ! -L $@ ]; then ln -fs out/Debug/$(NODE_EXE) $@; fi
>>> +@@ -123,8 +123,8 @@ with-code-cache:
>>> + test-code-cache: with-code-cache
>>> +       $(PYTHON) tools/test.py $(PARALLEL_ARGS) --mode=$(BUILDTYPE_LOWER) code-cache
>>>
>>>  -out/Makefile: common.gypi deps/uv/uv.gyp deps/http_parser/http_parser.gyp \
>>>  -              deps/zlib/zlib.gyp deps/v8/gypfiles/toolchain.gypi \
>>> --              deps/v8/gypfiles/features.gypi deps/v8/src/v8.gyp node.gyp \
>>> --              config.gypi
>>>  +out/Makefile: common.gypi deps/http_parser/http_parser.gyp \
>>> -+              deps/v8/gypfiles/toolchain.gypi deps/v8/gypfiles/features.gypi \
>>> -+                        deps/v8/src/v8.gyp node.gyp config.gypi
>>> ++              deps/v8/gypfiles/toolchain.gypi \
>>> +               deps/v8/gypfiles/features.gypi deps/v8/gypfiles/v8.gyp node.gyp \
>>> +               config.gypi
>>>         $(PYTHON) tools/gyp_node.py -f make
>>> -
>>> - config.gypi: configure
>>>  --
>>> -2.12.2
>>> +2.19.2
>>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch
>>> new file mode 100644
>>> index 000000000..e9035f9eb
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch
>>> @@ -0,0 +1,36 @@
>>> +From 4bbee5e3d58bc4911999f3ec2cc5aab8ded6717b Mon Sep 17 00:00:00 2001
>>> +From: "Winker Matthias (TT-CA/ENG1)" <Matthias.Winker@de.bosch.com>
>>> +Date: Tue, 11 Dec 2018 10:44:29 +0100
>>> +Subject: [PATCH] Using native torque
>>> +
>>> +---
>>> + deps/v8/gypfiles/v8.gyp | 6 ++++--
>>> + 1 file changed, 4 insertions(+), 2 deletions(-)
>>> +
>>> +diff --git a/deps/v8/gypfiles/v8.gyp b/deps/v8/gypfiles/v8.gyp
>>> +index 8c78f02255..434168844e 100644
>>> +--- a/deps/v8/gypfiles/v8.gyp
>>> ++++ b/deps/v8/gypfiles/v8.gyp
>>> +@@ -2831,7 +2831,6 @@
>>> +         {
>>> +           'action_name': 'run_torque',
>>> +           'inputs': [  # Order matters.
>>> +-            '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
>>> +             '../src/builtins/base.tq',
>>> +             '../src/builtins/array.tq',
>>> +             '../src/builtins/typed-array.tq',
>>> +@@ -2845,7 +2844,10 @@
>>> +             '<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed-array-from-dsl-gen.cc',
>>> +             '<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed-array-from-dsl-gen.h',
>>> +           ],
>>> +-          'action': ['<@(_inputs)', '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated'],
>>> ++          'action': [
>>> ++            'torque',
>>> ++            '<@(_inputs)',
>>> ++            '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated'],
>>> +         },
>>> +       ],
>>> +     }, # torque
>>> +--
>>> +2.19.2
>>> +
>>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Link-atomic-library.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Link-atomic-library.patch
>>> new file mode 100644
>>> index 000000000..66ff18b4a
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Link-atomic-library.patch
>>> @@ -0,0 +1,20 @@
>>> +Link atomic library to fix missing undefined referrences
>>> +like "undefined reference to `__atomic_fetch_add_8'"
>>> +
>>> +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>>> +
>>> +diff -Naur node-v10.15.1/deps/v8/gypfiles/v8.gyp node-v10.15.1/deps/v8/gypfiles/v8.gyp
>>> +--- node-v10.15.1/deps/v8/gypfiles/v8.gyp      2019-02-13 09:02:21.000000000 +0100
>>> ++++ node-v10.15.1/deps/v8/gypfiles/v8.gyp      2019-02-15 21:27:11.755679660 +0100
>>> +@@ -452,6 +452,11 @@
>>> +         '<(DEPTH)',
>>> +         '<(SHARED_INTERMEDIATE_DIR)'
>>> +       ],
>>> ++      'link_settings': {
>>> ++        'libraries': [
>>> ++          '-latomic'
>>> ++        ],
>>> ++      },
>>> +       'sources': [
>>> +         '<@(inspector_all_sources)',
>>> +         '../include//v8-inspector-protocol.h',
>>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.15.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
>>> similarity index 86%
>>> rename from meta-oe/recipes-devtools/nodejs/nodejs_8.15.0.bb
>>> rename to meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
>>> index 44eaee974..f2bfe8abe 100644
>>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_8.15.0.bb
>>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
>>> @@ -1,9 +1,10 @@
>>>  DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
>>>  HOMEPAGE = "http://nodejs.org"
>>>  LICENSE = "MIT & BSD & Artistic-2.0"
>>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=fde91d5c5bbd1e0389623e1ac018d9e8"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9ceeba79eb2ea1067b7b3ed16fff8bab"
>>>
>>>  DEPENDS = "openssl zlib icu"
>>> +DEPENDS_append_class-target = " nodejs-native"
>>>
>>>  inherit pkgconfig
>>>
>>> @@ -13,9 +14,14 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
>>>
>>>  SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>>>             file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
>>> -"
>>> -SRC_URI[md5sum] = "bfc5da493c72ded3a7f43b5662bfc53c"
>>> -SRC_URI[sha256sum] = "968523333947cc3f769d73dedc6c9c60580826d8714bc0e62ca4589de6a7c633"
>>> +           file://0003-Link-atomic-library.patch \
>>> +           "
>>> +SRC_URI_append_class-target = " \
>>> +           file://0002-Using-native-torque.patch \
>>> +           "
>>> +
>>> +SRC_URI[md5sum] = "1cad7963255de53509bfa560221bdc88"
>>> +SRC_URI[sha256sum] = "1a55f7b9fb80442182d9e1eba4fca4dac3c781cdcb25d6be37b24d253f61c858"
>>>
>>>  S = "${WORKDIR}/node-v${PV}"
>>>
>>> @@ -74,6 +80,10 @@ do_install_append_class-native() {
>>>      # use sed on npm-cli.js because otherwise symlink is replaced with normal file and
>>>      # npm-cli.js continues to use old shebang
>>>      sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
>>> +
>>> +    # Install the native torque to provide it within sysroot for the target compilation
>>> +    install -d ${D}${bindir}
>>> +    install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
>>>  }
>>>
>>>  do_install_append_class-target() {
>>> --
>>> 2.11.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

