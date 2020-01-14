Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
	[209.85.222.46])
	by mail.openembedded.org (Postfix) with ESMTP id B07747FA37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 12:01:21 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id y23so4670234ual.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 04:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yvR81vYA1toGL9x24NQlSgdBEobw7XYecmgJujL6gtk=;
	b=ZqPIcrIev/aTm/dkOk4kNnQTZUX/FW16+bpfovKwmRow3KX+BbMtjC8B0cYu5L2ODg
	gckXT7sGCA2cLI0FGyiiKqNgFM+MdE1XGfIORPrS2olMq1srRtwP/n4sHl6WB2KnhYXc
	MP9Yyup71nXAdQWE1qtQtTMDSfKWCeppGqzsO6Es1U8rQgaa7nDwAYVSh/bowcwyfEuG
	O+SNxi7Nv9qvZKyRvJUxDkywbt800zF0tQ/Tjyx9ZXsFyhAXXNNTlwy8C32FO95BdtG9
	BlVC0WREkt6f0wVrFCyUZCggloKXJ2YkNjj+h8zDqrmdwcHeJP/Z4y84F1Ieoye/18/0
	7lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yvR81vYA1toGL9x24NQlSgdBEobw7XYecmgJujL6gtk=;
	b=LrsaODz7aU1PeS9ZYRzMNWMcXgcCEoNOGl7i9WIjf/LXfT3VMuCDJX1W+Mz0tkMRMI
	sI3bDKaj1BAiJUARNVIdUxxfuGQRJpwxBpxM491oOh3sqYqfyqAeQa+aMTh34pxDdwXZ
	ygKf0BLU5gQoqoRoZVUajaukj+zcijcVSUJ/aNkypUyBcwZWfwn1hD6IHtu0HpMpMjVq
	G2OwZ4i28mRayjWfQCOCcMdMh/UKIIsmszuDFd2MIbat4mDNQipQUJeyOgcTtC6HI/Zb
	4sXO531ASMuqXrlfv+LfaKKH+3Rm1mwuNWX7SJCR5mcZrlTBVdFKXXf8qoR/d7yY80Et
	t5tg==
X-Gm-Message-State: APjAAAXxEKHAPbpG2V1+ifXSSnrffku2Bu6NDr6Mye1wPQfLQAqqOLFo
	brJE9GgDDWr4PqHFUyqBko/k4eLo+zuNvSC0b4M=
X-Google-Smtp-Source: APXvYqx9zEFshzU4YO/0FWCPFa10a3OwxGTSvrit2qcWeQNsc/VAjaQnnZil3IrZzxYhWNBx7hFfKYPGKEN63nbI+ws=
X-Received: by 2002:ab0:2006:: with SMTP id v6mr12467506uak.22.1579003282403; 
	Tue, 14 Jan 2020 04:01:22 -0800 (PST)
MIME-Version: 1.0
References: <CA+chaQdXtycq=z3+2i2VK7+7TDQKjU3JCcE4nFxcav37z1cOwQ@mail.gmail.com>
	<20200113190102.22584-1-Martin.Jansa@gmail.com>
	<673df57a-3aa3-6c7b-eafc-6e17d491baf1@gmail.com>
In-Reply-To: <673df57a-3aa3-6c7b-eafc-6e17d491baf1@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Jan 2020 13:01:11 +0100
Message-ID: <CANNYZj8Ty0Ref3T54KhTtmRP=bSzcLw7ghDSea6WD18f9nUCCA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCHv2 1/2] sysprof: add a recipe from oe-core
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
X-List-Received-Date: Tue, 14 Jan 2020 12:01:22 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks, I've just sent a patch for this.

Alex

On Tue, 14 Jan 2020 at 01:37, Khem Raj <raj.khem@gmail.com> wrote:

> On 1/13/20 11:01 AM, Martin Jansa wrote:
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> >
> > Latest version (3.34) of sysprof have a hard dependency on polkit,
> > which in turn requires mozjs, which pulls in a number of other
> > meta-oe packages including python2. This makes it difficult
> > to keep sysprof in oe-core, so for the time being it is moved to
> > meta-oe.
>
>
> it fails to build for arm
> https://errors.yoctoproject.org/Errors/Details/306463/
> https://errors.yoctoproject.org/Errors/Details/306361/
>
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   ...thing-in-help-as-it-requires-itstool.patch | 27 ++++++++++++++++
> >   .../files/define-NT_GNU_BUILD_ID.patch        | 22 +++++++++++++
> >   .../recipes-kernel/sysprof/sysprof_3.32.0.bb  | 32 +++++++++++++++++++
> >   3 files changed, 81 insertions(+)
> >   create mode 100644
> meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
> >   create mode 100644
> meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> >   create mode 100644 meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
> >
> > diff --git
> a/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
> b/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
> > new file mode 100644
> > index 0000000000..ade51cf864
> > --- /dev/null
> > +++
> b/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
> > @@ -0,0 +1,27 @@
> > +From d332b480257aa98b63d39c3c94896a111536f937 Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Wed, 23 Aug 2017 18:38:26 +0300
> > +Subject: [PATCH 2/2] Do not build anything in help/ as it requires
> itstool.
> > +
> > +Upstream-Status: Inappropriate [oe-core specific]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +
> > +---
> > + meson.build | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/meson.build b/meson.build
> > +index 3986273..ae2f65e 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -164,7 +164,6 @@ subdir('tools')
> > + subdir('tests')
> > +
> > + subdir('data')
> > +-subdir('help')
> > + subdir('po')
> > +
> > + meson.add_install_script('build-aux/meson/post_install.sh')
> > +--
> > +2.7.4
> > +
> > diff --git
> a/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> b/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> > new file mode 100644
> > index 0000000000..f75ddad43a
> > --- /dev/null
> > +++
> b/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> > @@ -0,0 +1,22 @@
> > +On uclibc elf.h does not have GNU extentions but we need this define
> > +so we define it locally if its not getting it from elf.h
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +
> > +Index: git/elfparser.h
> > +===================================================================
> > +--- git.orig/lib/util/elfparser.h    2011-07-16 18:57:41.000000000 -0700
> > ++++ git/lib/util/elfparser.h 2011-07-16 20:28:54.733829895 -0700
> > +@@ -17,6 +17,10 @@
> > +  */
> > + #include <glib.h>
> > +
> > ++#ifndef NT_GNU_BUILD_ID
> > ++#define NT_GNU_BUILD_ID 3
> > ++#endif
> > ++
> > + typedef struct ElfSym ElfSym;
> > + typedef struct ElfParser ElfParser;
> > +
> > diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
> b/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
> > new file mode 100644
> > index 0000000000..b92933806c
> > --- /dev/null
> > +++ b/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
> > @@ -0,0 +1,32 @@
> > +SUMMARY = "System-wide Performance Profiler for Linux"
> > +HOMEPAGE = "http://www.sysprof.com"
> > +LICENSE = "GPLv3+"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504
> \
> > +
> file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
> > +
> > +GNOMEBASEBUILDCLASS = "meson"
> > +inherit gnomebase gettext systemd upstream-version-is-even gsettings
> > +
> > +DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
> > +
> > +SRC_URI[archive.md5sum] = "d1fa9ad216419d722770ca36713ad3af"
> > +SRC_URI[archive.sha256sum] =
> "fc22a69e468701c5ec9036e960c6273afa1ed6a89df1f889fed49417add5554d"
> > +SRC_URI += " \
> > +           file://define-NT_GNU_BUILD_ID.patch \
> > +
>  file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
> > +           "
> > +
> > +PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES',
> '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
> > +PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3"
> > +PACKAGECONFIG[sysprofd] =
> "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
> > +
> > +SOLIBS = ".so"
> > +FILES_SOLIBSDEV = ""
> > +
> > +SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG',
> 'sysprofd', 'sysprof2.service', '', d)}"
> > +
> > +FILES_${PN} += " \
> > +               ${datadir}/dbus-1/system-services \
> > +               ${datadir}/dbus-1/system.d \
> > +               ${datadir}/metainfo \
> > +               "
> >
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

