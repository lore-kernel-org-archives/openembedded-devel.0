Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 097D678055
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 02:08:02 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id p193so725923vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 19:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=20yzJhk++9ztJ2J+rYwa77bWJjDNv4/o+JxoO9+h6wI=;
	b=PKakFlL4LxSjyM3/K2OFsdx3mUCnIp6zzpVkE/bfqu2oVmWYBg49GnkBzU1aPzQTEF
	RlRZeXMYT0S1QQ/JbY7D6ixkxuKHs1nv9MGnf3i780rItlfrO6uLWqJCu1SWwdr98ywM
	qh5VoX6a9nKpzYqVjCt468mN84lOvAPe3OBtr88g2V6l0r5RBJBo8wZQ+71QDJdEjBz8
	EKyzpotchL4mC1fAx6ETM6RVL8VzFi4YBStNTxOFiSIKXeM/OZPyKJVkbA7pt6uWUmkR
	ysUL6K1yUHY3pg7nhTcwz2Q+PM7Vnjv45gn+tR+SFdNhtq9/I56sB6xAVcDSR5w8GBPz
	HSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=20yzJhk++9ztJ2J+rYwa77bWJjDNv4/o+JxoO9+h6wI=;
	b=h+Xxm3+vu9zg2OjmxGsIs1FgISU3/Rr+NRlDhXBAg7/pA+b+w9I0SzHIzHEF0G+EnD
	GhzqVzSHVF/i80fKHqQUUuiAjHldZWxI+PaefSCxlK7e0/XUjV0d0gGW3980oTAmbwV5
	WIh2qMrdTwTJBfBsk/w1EPivtQ+SsQZtL1oZapmOxt1FYE7+xod+n4dsNb5Rzp8agpOS
	zerMpNSYVg2wwjSqYbCR7sSOPV8tBsdNU99kzwaDPoeR+Ys43tR8XNdVxlbqrj5TFRFJ
	Y08CKN0ZwuFYGqTtzkqA5TuEDM/5nYYxKkRZKvgGSKHMQDIB6L16vHD0pqn4QnJfMWUR
	YrKg==
X-Gm-Message-State: AIVw112zTqHzTjNXyY39uc5tQp7kQ1jpcrK/JC7hHAofcq/88mqcjCS2
	jacPS86o1P8HBZFBgxxbT5JUMCFi4Wea
X-Received: by 10.31.166.133 with SMTP id p127mr344146vke.134.1499825283905;
	Tue, 11 Jul 2017 19:08:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.78.91 with HTTP; Tue, 11 Jul 2017 19:08:03 -0700 (PDT)
In-Reply-To: <C483BBAB-ADAB-4944-8339-192A9A934C65@linux.intel.com>
References: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
	<1499791478-2407-2-git-send-email-liu.ming50@gmail.com>
	<C483BBAB-ADAB-4944-8339-192A9A934C65@linux.intel.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 12 Jul 2017 04:08:03 +0200
Message-ID: <CALatG=7O0bTra4a6OcidOVeRG3HMFhKY4YY8eahQkYwoeW3F0g@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe/meta-perl] [PATCH 1/8] libsombok3: add recipe
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
X-List-Received-Date: Wed, 12 Jul 2017 02:08:03 -0000
Content-Type: text/plain; charset="UTF-8"

Hi, Tim:

Are you sure about that? libsombok3 is actually not a perl module, it has
the same name "libsombok3" on debian/ubuntu distributions.

the best,
thank you

2017-07-12 0:32 GMT+02:00 Tim Orling <timothy.t.orling@linux.intel.com>:

>
> > On Jul 11, 2017, at 9:44 AM, liu.ming50@gmail.com wrote:
> >
> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >
> > Sombok - Unicode Text Segmentation Package.
> >
> > It's being depended by libunicode-linebreak-perl.
> >
> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> > ---
> > ...01-configure.ac-fix-cross-compiling-issue.patch | 31
> ++++++++++++++++++++++
> > .../libsombok3/libsombok3_2.4.0.bb                 | 25
> +++++++++++++++++
> > 2 files changed, 56 insertions(+)
> > create mode 100644 meta-oe/recipes-devtools/libsombok3/libsombok3/0001-
> configure.ac-fix-cross-compiling-issue.patch
> > create mode 100644 meta-oe/recipes-devtools/libsombok3/
> libsombok3_2.4.0.bb
>
> This is not following Debian naming, it should be libsombok3-perl_2.4.0.bb
>
> >
> > diff --git a/meta-oe/recipes-devtools/libsombok3/libsombok3/0001-
> configure.ac-fix-cross-compiling-issue.patch b/meta-oe/recipes-devtools/
> libsombok3/libsombok3/0001-configure.ac-fix-cross-compiling-issue.patch
> > new file mode 100644
> > index 0000000..1a69287
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/libsombok3/libsombok3/0001-
> configure.ac-fix-cross-compiling-issue.patch
> > @@ -0,0 +1,31 @@
> > +From 9c2ffe825e28d63e2a771135f297e8ffac0dbe81 Mon Sep 17 00:00:00 2001
> > +From: Ming Liu <liu.ming50@gmail.com>
> > +Date: Tue, 11 Jul 2017 14:35:30 +0200
> > +Subject: [PATCH] configure.ac: fix cross-compiling issue
> > +
> > +Avoid checking for file existence when cross compiling.
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +
> > +Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > +---
> > + configure.ac | 3 ---
> > + 1 file changed, 3 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 9978852..06b16e3 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -120,9 +120,6 @@ AC_ARG_WITH(unicode-version,
> > +   AC_HELP_STRING(--with-unicode-version=VERSION,
> > +   [version of Unicode Standard @<:@default=current version@:>@]),
> > +   UNICODE_VERSION=$withval,UNICODE_VERSION=$DEFAULT_UNICODE_VERSION)
> > +-AC_CHECK_FILE([lib/$UNICODE_VERSION.c],
> > +-  AC_MSG_RESULT($UNICODE_VERSION),
> > +-  AC_MSG_ERROR(Unknown Unicode version $UNICODE_VERSION.))
> > + AC_SUBST(UNICODE_VERSION)
> > +
> > + # check if code to debug memory allocation is enabled.
> > +--
> > +2.7.4
> > +
> > diff --git a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
> b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
> > new file mode 100644
> > index 0000000..b83e86a
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
>
> > @@ -0,0 +1,25 @@
> > +SUMMARY = "Sombok - Unicode Text Segmentation Package."
> > +DESCRIPTION = "Sombok library package performs Line Breaking Algorithm
> described in \
> > +Unicode Standard Annex #14 (UAX #14).  East_Asian_Width informative \
> > +properties defined by Annex #11 (UAX #11) may be concerned to determin \
> > +breaking positions.  This package also implements "default" Grapheme \
> > +Cluster segmentation described in Annex #29 (UAX #29)."
> > +LICENSE = "Artistic-1.0 | GPLv1+"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=5b122a36d0f6dc55279a0ebc69f3c6
> 0b"
> > +
> > +SRC_URI = "git://github.com/hatukanezumi/sombok.git;protocol=https \
> > +           file://0001-configure.ac-fix-cross-compiling-issue.patch \
> > +          "
> > +
> > +inherit autotools pkgconfig
> > +
> > +# sombok-2.4.0
> > +SRCREV = "0098d85a037ef5c99a648a3669a077781a45e8cc"
> > +
> > +S = "${WORKDIR}/git"
> > +B = "${S}"
> > +
> > +# Disable libthai support
> > +EXTRA_OECONF = "--disable-libthai"
> > +
> > +BBCLASSEXTEND = "native"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

