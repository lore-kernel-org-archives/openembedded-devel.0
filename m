Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f47.google.com (mail-pl0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8869F71BA6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Dec 2017 23:02:50 +0000 (UTC)
Received: by mail-pl0-f47.google.com with SMTP id bi12so26214432plb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Dec 2017 15:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=/aZkaO4/yR6i0Z3F69fQzwtaLpS06MGV2FRz7pWQi/g=;
	b=gwMFJjxNeO1S35UQaogyUC5ZtgJVHjThJD4MQV/uNLpUaoa9Egw7QJFMwC88DQ4pa8
	PXmWyR7cE8HV/vLf/xppr2q3C2aIcJHDyIcnq4iqNpo5DFrlzG/Jz+AGsF3FQZolwCfQ
	nlSUBxfm/hdF0IlTdAZUNXgcvOV6GolKpsl/CcCruYTMmsxQTK5ufG9+qYFdhaFdlGBn
	r1XcBLcds52vovCX56GbmAbTkzNPDJbeF3RaPmqVUtZXJqe5Gb9nfyo9YscTtO2ESgm8
	kehKUT7wHMA7xz+kGjKwfGjvRLtd7JeKoEuE6sJK34sIPdBBb+/g4Nt+MmsnrZn5EFpI
	IznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=/aZkaO4/yR6i0Z3F69fQzwtaLpS06MGV2FRz7pWQi/g=;
	b=kMPsJjpavPUvHTZ6n1I8w+nuP8C8h+0U83eA0IGmDOzzjG6SD5NG7BBKBJhi3Uk/Wo
	JTjBhmaL7yMfejtP2kHElAU2b2TDV9lyfAsS5xBAHZzS/gwuBKSj69FkW7b7mSek+OE1
	WL56GH8EiackCY8naHgT6JPcuNULA6t76+tkM1VBYPd4AVQI6bNBj9PHnC4kGemr2iPk
	deqbg9PhoXXujUvQfjKTGAN3QQ98PzYawnTpP1psDzYhqYYryHIyWKylGeqr4fcLtVHS
	OxCeTd0sCW0Gu3aV5rMf47K4AIa61Lseesy8mg13tdqM9tCceu2rKrD8by+mqn8NCQk3
	G4sw==
X-Gm-Message-State: AKGB3mIGsIz8dnUrlHktH1+Z4OVAlhQ9mj5zKhZdbdih0KUUQ7/nIfLc
	S3+TcUICwUckD5nIqoo40l4Vxg==
X-Google-Smtp-Source: ACJfBotpN/xpwIHLYHhRzVHMSO8mBrQ5zZI29v4VcdLlC69e5hjwp2FN53SsOUUd5VYNKKyfYi+Rhw==
X-Received: by 10.84.194.163 with SMTP id h32mr40125171pld.335.1514761371613; 
	Sun, 31 Dec 2017 15:02:51 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:20c4:d690:9df8:7161?
	([2601:202:4000:1184:20c4:d690:9df8:7161])
	by smtp.gmail.com with ESMTPSA id
	r86sm91304305pfk.114.2017.12.31.15.02.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Dec 2017 15:02:51 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1513780518-29657-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CA+chaQcxkcjy=GJFM5YjXpY_c9yOTsSypOQfzAQOSGnDQq3c8w@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <59833560-334b-6ede-c412-a12b4a5040d2@gmail.com>
Date: Sun, 31 Dec 2017 15:02:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcxkcjy=GJFM5YjXpY_c9yOTsSypOQfzAQOSGnDQq3c8w@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libyui-ncurses: new add
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
X-List-Received-Date: Sun, 31 Dec 2017 23:02:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/27/2017 11:02 PM, Martin Jansa wrote:
> This is missing in master now, because dnfdragora was merged.
This should be in master now.

- armin
>
> Please use 4 spaces for indentation.
>
> On Wed, Dec 20, 2017 at 3:35 PM, zhengrq <zhengrq.fnst@cn.fujitsu.com>
> wrote:
>
>> Add a new recipe libyui-ncurses, which is a rdepend for dnfdragora.
>>
>> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>> ---
>>  ...1-Fix-the-error-of-can-t-find-header-file.patch | 100
>> +++++++++++++++++++++
>>  .../recipes-graphics/libyui/libyui-ncurses_git.bb  |  50 +++++++++++
>>  2 files changed, 150 insertions(+)
>>  create mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-
>> Fix-the-error-of-can-t-find-header-file.patch
>>  create mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
>>
>> diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-
>> Fix-the-error-of-can-t-find-header-file.patch b/meta-oe/recipes-graphics/
>> libyui/libyui-ncurses/0001-Fix-the-error-of-can-t-find-header-file.patch
>> new file mode 100644
>> index 0000000..26b4c17
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-
>> Fix-the-error-of-can-t-find-header-file.patch
>> @@ -0,0 +1,100 @@
>> +From eb0086dc4ea8fe9cda069456287b3a29a2631d30 Mon Sep 17 00:00:00 2001
>> +From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>> +Date: Wed, 13 Dec 2017 16:18:45 +0900
>> +Subject: [PATCH] Fix the error of can't find header file
>> +
>> +This fix is just for yocto.
>> +
>> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>> +---
>> + src/NCApplication.cc | 2 +-
>> + src/NCstyle.h        | 2 +-
>> + src/NCurses.h        | 2 +-
>> + src/ncursesp.h       | 2 +-
>> + src/ncursesw.cc      | 2 +-
>> + src/ncursesw.h       | 4 ++--
>> + 6 files changed, 7 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/src/NCApplication.cc b/src/NCApplication.cc
>> +index 5bcf969..510f034 100644
>> +--- a/src/NCApplication.cc
>> ++++ b/src/NCApplication.cc
>> +@@ -23,7 +23,7 @@
>> +
>> + /-*/
>> +
>> +-#include <ncursesw/curses.h>
>> ++#include <curses.h>
>> +
>> + #define  YUILogComponent "ncurses"
>> + #include <yui/YUILog.h>
>> +diff --git a/src/NCstyle.h b/src/NCstyle.h
>> +index a40d5a8..3657917 100644
>> +--- a/src/NCstyle.h
>> ++++ b/src/NCstyle.h
>> +@@ -25,7 +25,7 @@
>> + #ifndef NCstyle_h
>> + #define NCstyle_h
>> +
>> +-#include <ncursesw/ncurses.h>
>> ++#include <ncurses.h>
>> +
>> + #include <iosfwd>
>> + #include <string>
>> +diff --git a/src/NCurses.h b/src/NCurses.h
>> +index a07c6bf..d17d3c3 100644
>> +--- a/src/NCurses.h
>> ++++ b/src/NCurses.h
>> +@@ -34,7 +34,7 @@
>> + #include <yui/YWidget.h>
>> + #include <yui/YMenuItem.h>
>> +
>> +-#include <ncursesw/curses.h>  /* curses.h: #define  NCURSES_CH_T cchar_t
>> */
>> ++#include <curses.h>   /* curses.h: #define  NCURSES_CH_T cchar_t */
>> + #include <wchar.h>
>> +
>> + #include "ncursesw.h"
>> +diff --git a/src/ncursesp.h b/src/ncursesp.h
>> +index d478347..2fcfea5 100644
>> +--- a/src/ncursesp.h
>> ++++ b/src/ncursesp.h
>> +@@ -28,7 +28,7 @@
>> + #include <iosfwd>
>> +
>> + #include "ncursesw.h"
>> +-#include <ncursesw/panel.h>
>> ++#include <panel.h>
>> +
>> + class NCursesPanel : public NCursesWindow
>> + {
>> +diff --git a/src/ncursesw.cc b/src/ncursesw.cc
>> +index 3c771af..bb83210 100644
>> +--- a/src/ncursesw.cc
>> ++++ b/src/ncursesw.cc
>> +@@ -47,7 +47,7 @@
>> + #include <iostream>
>> + #include <stdlib.h>
>> + #include <string.h>
>> +-#include <ncursesw/term.h>
>> ++#include <term.h>
>> + #undef line
>> + #undef columns
>> +
>> +diff --git a/src/ncursesw.h b/src/ncursesw.h
>> +index d25923a..c140d37 100644
>> +--- a/src/ncursesw.h
>> ++++ b/src/ncursesw.h
>> +@@ -27,8 +27,8 @@
>> +
>> + #include <iosfwd>
>> +
>> +-#include <ncursesw/curses.h>
>> +-#include <ncursesw/etip.h>
>> ++#include <curses.h>
>> ++#include <etip.h>
>> + #include <cstdio>
>> + #include <cstdarg>
>> + #include <climits>
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
>> b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
>> new file mode 100644
>> index 0000000..f378701
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
>> @@ -0,0 +1,50 @@
>> +SUMMARY = "Character Based User Interface for libyui"
>> +LICENSE = "LGPLv3"
>> +LIC_FILES_CHKSUM = "file://COPYING.lgpl-3;md5=
>> e6a600fd5e1d9cbde2d983680233ad02 \
>> +                    file://COPYING.lgpl-2.1;md5=
>> 4fbd65380cdd255951079008b364516c \
>> +                   "
>> +
>> +SRC_URI = "git://github.com/libyui/libyui-ncurses.git \
>> +           "
>> +
>> +SRC_URI_append_class-target += " file://0001-Fix-the-error-of-
>> can-t-find-header-file.patch"
>> +
>> +PV = "2.48.3+git"
>> +SRCREV = "7b251c2ff541df6139f3d210d0a0a27d042926bd"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit cmake gettext pkgconfig
>> +
>> +DEPENDS += "boost libyui ncurses"
>> +
>> +BBCLASSEXTEND = "nativesdk"
>> +
>> +do_configure_prepend () {
>> +         cd ${S}
>> +         git checkout bootstrap.sh
>> +         sed -i "s#/usr#${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#"
>> bootstrap.sh
>> +         ./bootstrap.sh
>> +         mkdir -p ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
>> +         cp ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib/libyui.so*
>> ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
>> +         cd -
>> +         sed -i "s#\${YPREFIX}#\${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#"
>> ${S}/CMakeLists.txt
>> +         sed -i "s#/usr#${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#"
>> ${PKG_CONFIG_SYSROOT_DIR}${libdir}/cmake/libyui/
>> LibyuiLibraryDepends-release.cmake
>> +}
>> +
>> +do_install_append () {
>> +        if [ "${libdir}" = "${base_prefix}/usr/lib" ] && [ -d
>> ${D}/usr/lib64 ]; then
>> +            mv ${D}/usr/lib64 ${D}/usr/lib
>> +        fi
>> +}
>> +
>> +do_install_append_class-nativesdk () {
>> +        mkdir -p ${D}/${base_prefix}
>> +        mv ${D}/usr ${D}/${base_prefix}
>> +}
>> +
>> +FILES_${PN} += "${datadir}/*"
>> +
>> +FILES_${PN}-dev += "${libdir}/*"
>> --
>> 2.7.4
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


