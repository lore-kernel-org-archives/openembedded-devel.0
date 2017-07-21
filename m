Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 72345783C1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 08:48:07 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id x6so15116280ywd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 01:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=COyrZbnAYu4JAmuMN1/iO5yRuwHtExOV7NSG6Df4Ipk=;
	b=EiJ2K4FU7kzwMXBFHisW6hPFhj6zUiJGjoI8jEQcqmfNqOKc0zHO5GGLOr2suuDoT2
	YYcKWlK+oc1l5RutEUXWgItnKBCh3IY5d+z2Nd26N4wauz+o+F/1dP/ZngsNMhK++3ES
	q7KX+cjEsfDshFmjrJ0z2rej0ZSJc0W/wrSFtUakgWfz2v1n8zlHVqAjb8Q8aA9GC8fs
	WLqbkuoB0cFfme3Kdth/Gtgg+nsOUf1ii1Kof8F9JXvrCuOzXyHleAgL+wMIs+uJdPOm
	ap3gjUo4W8ltA0ABlcw29VWHmE5TwjD4GPvzYcuiuyzYZQ+U4sO3qmz2DtX1hiS83lKW
	01fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=COyrZbnAYu4JAmuMN1/iO5yRuwHtExOV7NSG6Df4Ipk=;
	b=NIeBUFsf/8fYjtawM/2Sza/bGIkhsdA9Fh1QGHKemoabL6ddedpM1qmZe9ueTFhr+8
	CFafRhc/NVnn+NHUvuVjc7fcixV1Wq4k5Ydd3Ix1XO3ZNWQNoFaBXh0HnXIogPlFqABs
	Ub3JCqLieY8YnF/DjxYAhRcWdi9EptVHaxzkXr8rAxIJIVCdKCriFIwjGc3GmKw1JBeM
	eHC6nDRnd6wGF0AlISxVH2U2e9eUtzxBN5hPE7ATx/d0hO3ggXye4wRlO8Z2u7NFj60G
	CFAt/6YiAO0QK+/PUPpZCwfCVbCTHCHAgQKb4sFPHmcY7UEfNip7240qf+COanbJuFk7
	+Yhw==
X-Gm-Message-State: AIVw112k8O0tVcNTdD2K3BSvgzwOnVIhvp+vJazZElh1FiOICx3cuAHT
	r/e3+FobI/MNu0byPDyMcpDbWV4d2Q==
X-Received: by 10.129.73.141 with SMTP id w135mr6061196ywa.414.1500626889293; 
	Fri, 21 Jul 2017 01:48:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Fri, 21 Jul 2017 01:48:08 -0700 (PDT)
In-Reply-To: <97F7C8E70D26E94FA7E05578493F65C60E25DEFE@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1496970385-22164-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<97F7C8E70D26E94FA7E05578493F65C60E25DEFE@G08CNEXMBPEKD03.g08.fujitsu.local>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 21 Jul 2017 10:48:08 +0200
Message-ID: <CA+chaQfhgcbZvh1iQ5wGTzxrkYtwpz3a87FZ7B4BZTKpc8qt3g@mail.gmail.com>
To: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] [PATCH] qtbase: add ptest
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
X-List-Received-Date: Fri, 21 Jul 2017 08:48:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It was merged last week, why are you pinging this?

On Fri, Jul 21, 2017 at 9:01 AM, Huang, Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> ping
>
> > -----Original Message-----
> > From: Huang, Qiyu/=E9=BB=84 =E7=90=A6=E5=AE=87
> > Sent: Friday, June 09, 2017 9:06 AM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Huang, Qiyu/=E9=BB=84 =E7=90=A6=E5=AE=87 <huangqy.fnst@cn.fujitsu.c=
om>
> > Subject: [oe] [meta-qt5] [PATCH] qtbase: add ptest
> >
> > Add ptest for qtbase  by using provided testsuite.
> >
> > Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > ---
> >  .../0001-Delete-qlonglong-and-qulonglong.patch     | 28
> > ++++++++++++++++++++++
> >  recipes-qt/qt5/qtbase/run-ptest                    |  6 +++++
> >  recipes-qt/qt5/qtbase_git.bb                       | 17 ++++++++++++-
> >  3 files changed, 50 insertions(+), 1 deletion(-)  create mode 100644
> > recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
> >  create mode 100644 recipes-qt/qt5/qtbase/run-ptest
> >
> > diff --git a/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-
> qulonglong.patch
> > b/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
> > new file mode 100644
> > index 0000000..975cd28
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qtbase/0001-Delete-qlonglong-and-qulonglong.patch
> > @@ -0,0 +1,28 @@
> > +From c67a4af2e5db4c1e2213961e6392b59affd1959f Mon Sep 17 00:00:00
> > 2001
> > +From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > +Date: Wed, 7 Jun 2017 21:00:49 +0900
> > +Subject: [PATCH] Delete qlonglong and qulonglong
> > +
> > +Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > +---
> > + tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro | 2 --
> > + 1 file changed, 2 deletions(-)
> > +
> > +diff --git
> > +a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> > +b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> > +index 09458bd..59a120e 100644
> > +--- a/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> > ++++ b/tests/auto/corelib/thread/qatomicinteger/qatomicinteger.pro
> > +@@ -5,10 +5,8 @@ SUBDIRS=3D\
> > +     char32_t \
> > +     int \
> > +     long \
> > +-    qlonglong \
> > +     qptrdiff \
> > +     quintptr \
> > +-    qulonglong \
> > +     schar \
> > +     short \
> > +     uchar \
> > +--
> > +2.7.4
> > +
> > diff --git a/recipes-qt/qt5/qtbase/run-ptest
> b/recipes-qt/qt5/qtbase/run-ptest
> > new file mode 100644 index 0000000..044f834
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qtbase/run-ptest
> > @@ -0,0 +1,6 @@
> > +#!/bin/sh
> > +
> > +for x in ` awk '{print $1}' tst_list `;do
> > +    ./${x};
> > +done
> > +
> > diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.b=
b
> index
> > 27d0de1..39fc272 100644
> > --- a/recipes-qt/qt5/qtbase_git.bb
> > +++ b/recipes-qt/qt5/qtbase_git.bb
> > @@ -23,8 +23,12 @@ SRC_URI +=3D "\
> >      file://0005-configure-bump-path-length-from-256-to-512-
> character.patch
> > \
> >      file://0009-Disable-all-unknown-features-instead-of-erroring-out.p=
atch
> \
> >
> > file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
> > \
> > +    file://0001-Delete-qlonglong-and-qulonglong.patch \
> > +    file://run-ptest \
> >  "
> >
> > +inherit ptest
> > +
> >  # only for target qtbase
> >  SRC_URI +=3D "\
> >      file://0008-configure-paths-for-target-qmake-properly.patch \ @@
> -48,7
> > +52,7 @@ PACKAGECONFIG_DISTRO ?=3D ""
> >  PACKAGECONFIG_RELEASE ?=3D "release"
> >  # This is in qt5.inc, because qtwebkit-examples are using it to enable
> > ca-certificates dependency  # PACKAGECONFIG_OPENSSL ?=3D "openssl"
> > -PACKAGECONFIG_DEFAULT ?=3D "dbus udev evdev widgets tools libs freetyp=
e"
> > +PACKAGECONFIG_DEFAULT ?=3D "dbus udev evdev widgets tools libs freetyp=
e
> > tests"
> >
> >  PACKAGECONFIG ?=3D " \
> >      ${PACKAGECONFIG_RELEASE} \
> > @@ -170,6 +174,17 @@ do_configure() {
> >          ${QT_CONFIG_FLAGS}
> >  }
> >
> > +fakeroot do_install_ptest() {
> > +    mkdir -p ${D}${PTEST_PATH}
> > +    t=3D${D}${PTEST_PATH}
> > +    for var in ` find ${B}/tests/auto/ -name tst_*`; do
> > +        if [ not ` echo ${var##*/} | grep '\.'` ]; then
> > +            echo ${var##*/} >> ${t}/tst_list
> > +            install -m 0644 ${var} ${t}
> > +        fi
> > +    done
> > +}
> > +
> >  do_install_append() {
> >      # Avoid qmake error "Cannot read
> > [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or
> directory"
> >      touch
> > ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
> > --
> > 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

