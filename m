Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0915A6010D;
	Sun, 17 Sep 2017 15:56:08 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id v109so4585735wrc.1;
	Sun, 17 Sep 2017 08:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=drD7c4avcDQU+3ep/3CLyfZTKXZOQCpiHyzSarkV89o=;
	b=Z/6NZXz5IoNsWA//o21IzeLpioTfNwrTzuW95ToqAqxSP1f+L8GSFytRE82Ug+gN0G
	7OD4otMlym/THyhf0MqcLglIV2B52XHCB5Wmu6xwPofwOaGe0Mwt/glP7ud0BwjzT1bd
	J/1vBK3B1ZHAh2BqMt1hCg7fFoD8fU5BZ3tIA1RteF3qiG+AYbzseh+mvQ2pb9Y5Xrbb
	xAF4HG+cyVZ1PTfP2C84idHS+OZB/OpQwGZ7BrZ2x76P+ZVrHLKugNdhQtrigK8C5VLm
	rADPhylhUHDRCPwZ9R4seP4XIJURbTRtESqZBsxPz/MLIlED32OLAISiAzANlNyF9d0W
	r0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=drD7c4avcDQU+3ep/3CLyfZTKXZOQCpiHyzSarkV89o=;
	b=tEE0nROQ/2hg2lr5ypQJ3uzjyBX2v4q7ImXEpHMt1WaMIwiiACYntCuV0W5XiKWBNk
	Xg2ngi1ZNxdg4ZlVmxPuFSPRnWK+q5/R4WsMTXdliFkShHlgsKZvnAUqUIYox5RXY/oX
	CSFvvHU9zWqitgS9n86wiuInXRDQCu+rZ0owKsluvBGq/hAHpM1nWUeoqHOEWuJ4xIQj
	TMgAembeq/xBfriBsqYBR10yjc5FqUs0SLv5cUa59ifCO3ZzcWJ9uFhl/2z4QwA78HUh
	qhaIVbzKYvDX3KpGhgx8n4q4fNDL6wOtJvP1lP/85ZbxAw8LvvWfDimbOql5+bThh4VD
	tPfA==
X-Gm-Message-State: AHPjjUgMxxys46G/D3fw2Mdv3fsPdEc42OrtOmjsA6gorqvmKl9ly4iG
	r+tWMVbaAnOPeBm5XUy7wSPM1Rbdvh7x0Ehgoy4=
X-Google-Smtp-Source: AOwi7QB6h3tbnjwE/Dc3wq7QVwmXG9u743KfC3kQK/GNCGOVPd8rzUBNR3LuMXwRuEpUkCLUCexyg+oFEzFgw9jsDFk=
X-Received: by 10.223.164.153 with SMTP id g25mr17575607wrb.67.1505663769614; 
	Sun, 17 Sep 2017 08:56:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Sun, 17 Sep 2017 08:56:08 -0700 (PDT)
In-Reply-To: <CAMKF1srFJqnZ3FADw7Wt6yNTS=T66NANuRPLozEkxwiCbNSNxg@mail.gmail.com>
References: <150418331295.10247.6347273124770785868@git.openembedded.org>
	<20170831124153.DE910236C54@git.openembedded.org>
	<CA+chaQcpJeMcLs7Scu7rvL8MpCA1fzN8pDqBrKNm__gwG=Jvdw@mail.gmail.com>
	<CAMKF1srFJqnZ3FADw7Wt6yNTS=T66NANuRPLozEkxwiCbNSNxg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 17 Sep 2017 16:56:08 +0100
Message-ID: <CA+chaQe1t-1UTYhi5BXru9dTJATqVGbnTxO4i_W0mvXLrp2n6w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [meta-openembedded] 20/32: python-m2crypto: Upgrade to 0.26.0
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
X-List-Received-Date: Sun, 17 Sep 2017 15:56:09 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks, no 64bit Ubuntu 14.04

On Sun, Sep 17, 2017 at 4:29 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Sep 17, 2017 at 2:35 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > There is one more issue with this change. It fails to build on aarch64
> (e.g.
> > raspberrypi3-64):
> >
> > building 'M2Crypto._m2crypto' extension
> > swigging SWIG/_m2crypto.i to SWIG/_m2crypto_wrap.c
> > swig -python -Ipython-m2crypto/0.26.0-r0/recipe-sysroot/usr/include
> > -Ipython-m2crypto/0.26.0-r0/recipe-sysroot/usr/include/python2.7
> > -Ipython-m2crypto/0.26.0-r0/recipe-sysroot/usr/include
> > -Ipython-m2crypto/0.26.0-r0/recipe-sysroot/include/x86_64-linux-gnu
> > -includeall -modern -builtin -outdir
> > python-m2crypto/0.26.0-r0/M2Crypto-0.26.0/M2Crypto -o
> SWIG/_m2crypto_wrap.c
> > SWIG/_m2crypto.i
> > python-m2crypto/0.26.0-r0/recipe-sysroot/usr/include/
> openssl/opensslconf.h:53:
> > Error: Unable to find 'openssl/opensslconf-32.h'
> > error: command 'swig' failed with exit status 1
> > ERROR: python setup.py build execution failed.
> >
>
> I will check this. do you use 32bit OS on build host ?
>
> > I've reverted this change and confirmed that it built ok with
> > python-m2crypto_0.25.1.bb
> >
> > On Thu, Aug 31, 2017 at 2:42 PM, <git@git.openembedded.org> wrote:
> >>
> >> This is an automated email from the git hooks/post-receive script.
> >>
> >> martin_jansa pushed a commit to branch master
> >> in repository meta-openembedded.
> >>
> >> commit f50e344cffbf0e1513308f0a2c845e21b272f1b5
> >> Author: Khem Raj <raj.khem@gmail.com>
> >> AuthorDate: Mon Aug 28 19:46:06 2017 -0700
> >>
> >>     python-m2crypto: Upgrade to 0.26.0
> >>
> >>     Use proper LICENCE file for LIC_FILES_CHKSUM
> >>     Update homepage to point to gitlab
> >>     Fix cross-build arch
> >>
> >>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >>  .../python-m2crypto/cross-compile-platform.patch   | 30
> >> ++++++++++++++++++++++
> >>  ...2crypto_0.25.1.bb => python-m2crypto_0.26.0.bb} | 21
> +++++++--------
> >>  2 files changed, 41 insertions(+), 10 deletions(-)
> >>
> >> diff --git
> >> a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-
> platform.patch
> >> b/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-
> platform.patch
> >> new file mode 100644
> >> index 0000000..c6654e5
> >> --- /dev/null
> >> +++
> >> b/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-
> platform.patch
> >> @@ -0,0 +1,30 @@
> >> +Do not compute platform, this does not work in cross compile
> environment
> >> +since it pokes at the system for getting architecture values
> >> +
> >> +Upstream-Status: Inappropriate
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +
> >> +Index: M2Crypto-0.26.0/setup.py
> >> +===================================================================
> >> +--- M2Crypto-0.26.0.orig/setup.py
> >> ++++ M2Crypto-0.26.0/setup.py
> >> +@@ -141,19 +141,6 @@ class _M2CryptoBuildExt(build_ext.build_
> >> +                 self.include_dirs.append(
> >> +                     os.path.join(self.openssl, 'include', 'openssl'))
> >> +
> >> +-            # For RedHat-based distros, the '-D__{arch}__' option for
> >> +-            # Swig needs to be normalized, particularly on i386.
> >> +-            mach = platform.machine().lower()
> >> +-            if mach in ('i386', 'i486', 'i586', 'i686'):
> >> +-                arch = '__i386__'
> >> +-            elif mach in ('ppc64', 'powerpc64'):
> >> +-                arch = '__powerpc64__'
> >> +-            elif mach in ('ppc', 'powerpc'):
> >> +-                arch = '__powerpc__'
> >> +-            else:
> >> +-                arch = '__%s__' % mach
> >> +-            self.swig_opts.append('-D%s' % arch)
> >> +-
> >> +         self.swig_opts.extend(['-I%s' % i for i in self.include_dirs])
> >> +         self.swig_opts.append('-includeall')
> >> +         self.swig_opts.append('-modern')
> >> diff --git a/meta-python/recipes-devtools/python/python-
> m2crypto_0.25.1.bb
> >> b/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
> >> similarity index 64%
> >> rename from meta-python/recipes-devtools/python/python-m2crypto_0.25.1.
> bb
> >> rename to meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
> >> index 72523bd..4b4fbbb 100644
> >> --- a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
> >> +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
> >> @@ -1,13 +1,14 @@
> >>  SUMMARY = "A Python crypto and SSL toolkit"
> >> -HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
> >> +HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
> >>
> >>  LICENSE = "BSD"
> >> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95295693f047bb8f76928251a6154a
> 60"
> >> +LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b99180
> 0e"
> >>
> >> -SRC_URI[md5sum] = "040234289fbef5bed4029f0f7d1dae35"
> >> -SRC_URI[sha256sum] =
> >> "ac303a1881307a51c85ee8b1d87844d9866ee823b4fdbc52f7e79187c2d9acef"
> >> -
> >> -SRC_URI +=
> >> "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch "
> >> +SRC_URI +=
> >> "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
> >> +            file://cross-compile-platform.patch \
> >> +           "
> >> +SRC_URI[md5sum] = "9f02f0b88fbe225cc6ea8680945cafa0"
> >> +SRC_URI[sha256sum] =
> >> "05d94fd9b2dae2fb8e072819a795f0e05d3611b09ea185f68e1630530ec09ae8"
> >>
> >>  PYPI_PACKAGE = "M2Crypto"
> >>  inherit pypi setuptools siteinfo
> >> @@ -18,16 +19,16 @@ RDEPENDS_${PN} += "python-typing"
> >>  DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}
> >> -I${STAGING_INCDIR}"
> >>  DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
> >>
> >> -inherit setuptools
> >> -
> >> -SWIG_FEATURES_x86-64 = "-D__x86_64__"
> >> -SWIG_FEATURES ?= ""
> >> +SWIG_FEATURES_x86 = "-D__i386__"
> >> +SWIG_FEATURES ?= "-D__${HOST_ARCH}__"
> >>  export SWIG_FEATURES
> >>
> >>  # Get around a problem with swig, but only if the
> >>  # multilib header file exists.
> >>  #
> >>  do_compile_prepend() {
> >> +    ${CPP} -dM - < /dev/null | grep -v __STDC__ | grep -v
> >> __REGISTER_PREFIX__ | grep -v __GNUC__ \
> >> +       | sed 's/^\(#define \([^ ]*\) .*\)$/#undef \2\n\1/' >
> >> SWIG/gcc_macros.h
> >>      if [ "${SITEINFO_BITS}" = "64" ];then
> >>          bit="64"
> >>      else
> >>
> >> --
> >> To stop receiving notification emails like this one, please contact
> >> the administrator of this repository.
> >> --
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> >
> >
>

