Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A147E78845
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Feb 2018 16:28:38 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t6so1538930wmt.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Feb 2018 08:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fgbMYDKy4+u2b/r/gJAicrVu+Y6dEy+bCYpgDe5rQQ4=;
	b=pocdKlPGrJvhpMFSE8cDiNno64asHu40iH1+4SVWpEx7usQVICVfzGED/Bh9moHm2C
	1aG7jF5WSTi3or09Y2Yf08vkwMmdEzvDnpltw3TcTKuZ9C4IHbPJJPLTemppEQJAKJ6X
	grzJ6ENp56MgGf8RiIcS4keTY6Wq3Mdf306olNXPUpazVDHvNZaejRtF3ToORBEADqq9
	2RLvsbr7Ih5NUXrZIta9kwtrj5RoCkhNlPYeSj+DLsqC7X34ZmunjJHotUyi5pLf2cV0
	pxUiWDC3wQtnE/D8VWWoedFJQaTPXAP9fc0N21snlDMuRRO2zf1NmVZBfn4konuWIPXE
	T6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fgbMYDKy4+u2b/r/gJAicrVu+Y6dEy+bCYpgDe5rQQ4=;
	b=Q08sOCxGsSx5LnOv84f5BZYS4CDUtbUyFTABqeeK298zO6QQdyTWGDeZvENlHoK/aS
	vJykkiD1OK8Lu4o8wNfBaJ8gXuvhyU2X13sC7S9MzRnM7f7H5Enj+bd/PrDyJgWiaFBU
	YLLvQv+hYZ5TrTM4ifUznI8uiJK9B6lItwFvzJhKi0G1uaaY9ncOufgNmclO59/usLff
	wf9tnZiPRj5SJs2gmgs5BUkEhSaIBgt6WXjFyYOHas2WwbPXfSP0qHpPjPV/w95nVMiK
	pJ1huNz7v3F9kSs6XBBkXhWQsL0c/sbQf3gP4NUSmRL/AFnQpojQdm2HEr7qexM4LGZM
	xARw==
X-Gm-Message-State: APf1xPBTDMhv/FRgp2F3lw9w7dOndRRdZrsTD0BN0Ed09VHbeSCmamgg
	keUi9FJC+KUeAnpXYqAOkWWw7f2dQOXtxhwT0zc=
X-Google-Smtp-Source: AG47ELuUYGZ9M0gIv+dehxsxremKTrAlYdYiMt/8gdAEmeWtJnX+JorPexE9hVYLW5DjtC0yax5SDTCKpMpjqna1EOc=
X-Received: by 10.28.8.137 with SMTP id 131mr4815272wmi.79.1519489719281; Sat,
	24 Feb 2018 08:28:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sat, 24 Feb 2018 08:28:38 -0800 (PST)
In-Reply-To: <CAMKF1sqdzo=5r752eUngyj96bConSJ2jfjD2TehBNxQsnR33Bw@mail.gmail.com>
References: <20180224105155.14511-1-Martin.Jansa@gmail.com>
	<CAMKF1sqdzo=5r752eUngyj96bConSJ2jfjD2TehBNxQsnR33Bw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 24 Feb 2018 17:28:38 +0100
Message-ID: <CA+chaQd-YthWJ7K6s04=L8ZqtpJihfqt7QZmvjNOSDmbcQVQig@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: upgrade to 5.2.6
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
X-List-Received-Date: Sat, 24 Feb 2018 16:28:39 -0000
Content-Type: text/plain; charset="UTF-8"

Yes we can or we can wait for next vbox release which will hopefully
include support for 4.15 as suggested in Upstream-Status.

On Sat, Feb 24, 2018 at 4:57 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Feb 24, 2018 at 2:51 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > * 5.1.26 doesn't build with 4.15 kernel
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff | 90
> ++++++++++++++++++++++
> >  ...drivers_5.1.26.bb => vboxguestdrivers_5.2.6.bb} | 22 ++++--
> >  2 files changed, 107 insertions(+), 5 deletions(-)
> >  create mode 100644 meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
> >  rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdri
> vers_5.1.26.bb => vboxguestdrivers_5.2.6.bb} (69%)
> >
> > diff --git a/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.0-
> rc8-VBoxGuestAdditions-amd64.diff
> > new file mode 100644
> > index 0000000000..23a9021f04
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
> > @@ -0,0 +1,90 @@
> > +Based on:
> > +https://raw.githubusercontent.com/mjmaravillo/misc/master/linux-
> 4.15.0-rc8-VBoxGuestAdditions-amd64.diff
> > +
> > +Upstream-Status: Pending (hopefully new vbox will be released soon with
> proper 4.15 support, this patch isn't backwards compatible)
> > +
>
>
> can we use something like
>
> #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)
>
> to guard this code so it works with older kernels too
>
> > +--- vbox_module.orig/vboxvideo/vbox_mode.c     2018-02-18
> 16:42:47.000000000 +0000
> > ++++ vbox_module/vboxvideo/vbox_mode.c  2018-02-18 16:55:14.466029313
> +0000
> > +@@ -396,7 +396,7 @@
> > +
> > +       /* pick the encoder ids */
> > +       if (enc_id)
> > +-              return drm_encoder_find(connector->dev, enc_id);
> > ++              return drm_encoder_find(connector->dev, NULL, enc_id);
> > +
> > +       return NULL;
> > + }
> > +--- vbox_module.orig/vboxguest/VBoxGuest-linux.c       2018-02-18
> 16:42:28.000000000 +0000
> > ++++ vbox_module/vboxguest/VBoxGuest-linux.c    2018-02-18
> 16:54:36.793049118 +0000
> > +@@ -1058,7 +1058,7 @@
> > + #if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 0)
> > +
> > + /** log and dbg_log parameter setter. */
> > +-static int vgdrvLinuxParamLogGrpSet(const char *pszValue, struct
> kernel_param *pParam)
> > ++static int vgdrvLinuxParamLogGrpSet(const char *pszValue, const struct
> kernel_param *pParam)
> > + {
> > +     if (g_fLoggerCreated)
> > +     {
> > +@@ -1073,7 +1073,7 @@
> > + }
> > +
> > + /** log and dbg_log parameter getter. */
> > +-static int vgdrvLinuxParamLogGrpGet(char *pszBuf, struct kernel_param
> *pParam)
> > ++static int vgdrvLinuxParamLogGrpGet(char *pszBuf, const struct
> kernel_param *pParam)
> > + {
> > +     PRTLOGGER pLogger = pParam->name[0] == 'd' ?
> RTLogDefaultInstance() : RTLogRelGetDefaultInstance();
> > +     *pszBuf = '\0';
> > +@@ -1084,7 +1084,7 @@
> > +
> > +
> > + /** log and dbg_log_flags parameter setter. */
> > +-static int vgdrvLinuxParamLogFlagsSet(const char *pszValue, struct
> kernel_param *pParam)
> > ++static int vgdrvLinuxParamLogFlagsSet(const char *pszValue, const
> struct kernel_param *pParam)
> > + {
> > +     if (g_fLoggerCreated)
> > +     {
> > +@@ -1098,7 +1098,7 @@
> > + }
> > +
> > + /** log and dbg_log_flags parameter getter. */
> > +-static int vgdrvLinuxParamLogFlagsGet(char *pszBuf, struct
> kernel_param *pParam)
> > ++static int vgdrvLinuxParamLogFlagsGet(char *pszBuf, const struct
> kernel_param *pParam)
> > + {
> > +     PRTLOGGER pLogger = pParam->name[0] == 'd' ?
> RTLogDefaultInstance() : RTLogRelGetDefaultInstance();
> > +     *pszBuf = '\0';
> > +@@ -1109,7 +1109,7 @@
> > +
> > +
> > + /** log and dbg_log_dest parameter setter. */
> > +-static int vgdrvLinuxParamLogDstSet(const char *pszValue, struct
> kernel_param *pParam)
> > ++static int vgdrvLinuxParamLogDstSet(const char *pszValue, const struct
> kernel_param *pParam)
> > + {
> > +     if (g_fLoggerCreated)
> > +     {
> > +@@ -1123,7 +1123,7 @@
> > + }
> > +
> > + /** log and dbg_log_dest parameter getter. */
> > +-static int vgdrvLinuxParamLogDstGet(char *pszBuf, struct kernel_param
> *pParam)
> > ++static int vgdrvLinuxParamLogDstGet(char *pszBuf, const struct
> kernel_param *pParam)
> > + {
> > +     PRTLOGGER pLogger = pParam->name[0] == 'd' ?
> RTLogDefaultInstance() : RTLogRelGetDefaultInstance();
> > +     *pszBuf = '\0';
> > +@@ -1134,7 +1134,7 @@
> > +
> > +
> > + /** r3_log_to_host parameter setter. */
> > +-static int vgdrvLinuxParamR3LogToHostSet(const char *pszValue, struct
> kernel_param *pParam)
> > ++static int vgdrvLinuxParamR3LogToHostSet(const char *pszValue, const
> struct kernel_param *pParam)
> > + {
> > +     if (    pszValue == NULL
> > +         || *pszValue == '\0'
> > +@@ -1152,7 +1152,7 @@
> > + }
> > +
> > + /** r3_log_to_host parameter getter. */
> > +-static int vgdrvLinuxParamR3LogToHostGet(char *pszBuf, struct
> kernel_param *pParam)
> > ++static int vgdrvLinuxParamR3LogToHostGet(char *pszBuf, const struct
> kernel_param *pParam)
> > + {
> > +     strcpy(pszBuf, g_DevExt.fLoggingEnabled ? "enabled" : "disabled");
> > +     return strlen(pszBuf);
> > diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
> ers_5.1.26.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
> ers_5.2.6.bb
> > similarity index 69%
> > rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
> ers_5.1.26.bb
> > rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
> ers_5.2.6.bb
> > index fdefe03172..c018b789f2 100644
> > --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
> ers_5.1.26.bb
> > +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.6.bb
> > @@ -12,22 +12,27 @@ COMPATIBLE_MACHINE = "(qemux86|qemux86-64)"
> >  VBOX_NAME = "VirtualBox-${PV}"
> >
> >  SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_
> NAME}.tar.bz2 \
> > -           file://Makefile.utils \
> > +    file://Makefile.utils \
> >  "
> > -SRC_URI[md5sum] = "d3aec8190c649d7e0d92ba374779dfe3"
> > -SRC_URI[sha256sum] = "b5715035e681a11ef1475f83f9503d
> 34a00f0276b89c572eebec363dda80c8a9"
> > +
> > +# For default linux-yocto 4.15
> > +SRC_URI += "file://linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff"
> > +
> > +SRC_URI[md5sum] = "4490d6929dfae41cdf05e34f583318c8"
> > +SRC_URI[sha256sum] = "fe705288ee50efcce10ff4c80e461a
> 1c7091e461a7b55f98842fa1c9772ca4e7"
> >
> >  S = "${WORKDIR}/vbox_module"
> >
> >  export BUILD_TARGET_ARCH="${ARCH}"
> >  export BUILD_TARGET_ARCH_x86-64="amd64"
> > -export KERN_DIR="${STAGING_KERNEL_DIR}"
> > +
> > +EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build'"
> >
> >  addtask export_sources before do_patch after do_unpack
> >
> >  do_export_sources() {
> >      mkdir -p "${S}"
> > -    ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules
> ${T}/vbox_modules.tar.gz
> > +    ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules.sh
> ${T}/vbox_modules.tar.gz
> >      tar -C "${S}" -xzf ${T}/vbox_modules.tar.gz
> >
> >      # add a mount utility to use shared folder from VBox Addition
> Source Code
> > @@ -38,6 +43,13 @@ do_export_sources() {
> >
> >  }
> >
> > +do_configure_prepend() {
> > +    # vboxguestdrivers/5.2.6-r0/vbox_module/vboxguest/Makefile.include.header:99:
> *** The variable KERN_DIR must be a kernel build folder and end with /build
> without a trailing slash, or KERN_VER must be set.  Stop.
> > +    # vboxguestdrivers/5.2.6-r0/vbox_module/vboxguest/Makefile.include.header:108:
> *** The kernel build folder path must end in <version>/build, or the
> variable KERN_VER must be set.  Stop.
> > +    mkdir -p ${WORKDIR}/${KERNEL_VERSION}
> > +    ln -snf ${STAGING_KERNEL_DIR} ${WORKDIR}/${KERNEL_VERSION}/build
> > +}
> > +
> >  # compile and install mount utility
> >  do_compile_append() {
> >      oe_runmake 'LD=${CC}' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
> > --
> > 2.15.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

