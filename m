Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id C34EB6EB10
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2014 16:41:19 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c41so351753eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2014 08:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DZ3EpZN7c3EekunbUFK8u8/AwoXO0nktKywzrFaFq2Y=;
	b=VGxDDfOeYnDShwK0Q9TkT1pHvO+sTbMvc04yGoKBFDCGXcIo7cm3VxvJqWiTIXQdY7
	slDQxDGWkZpjeoYYWVheOoeIV8hgtgwoX93CYCV5evE4RcK+A+m3xbG+wBv5L5XRypiv
	OCB6yuDtr25LOqPXvRw/79+M4phciH4SiawsLJdWJfWPAsyrwibsEeMO5f98+3+d0Lwd
	qoWHBRD8/pA7a7D3ptvEPQeiWCerz1vj+E/ZYaI29qTPoK0A6f2OAcl9SESVY20Smu/Z
	019HIHGA1l+DnzTfBRcoNmgM0sGONeCSn8nFqsPtWoqcf8mqHTBqAJwet7hPhjBX7ePj
	u0iA==
X-Received: by 10.14.203.197 with SMTP id f45mr3101771eeo.90.1391618480058;
	Wed, 05 Feb 2014 08:41:20 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m1sm103526211een.7.2014.02.05.08.41.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Feb 2014 08:41:18 -0800 (PST)
Date: Wed, 5 Feb 2014 17:41:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140205164121.GL3698@jama>
References: <1391018608-8719-1-git-send-email-krzysztof.m.sywula@intel.com>
	<20140129182830.GQ3718@jama>
	<6741EAAB26B57F4995668065CB62D86B339D5BA5@IRSMSX102.ger.corp.intel.com>
	<20140129204212.GR3718@jama>
	<6741EAAB26B57F4995668065CB62D86B339D60AD@IRSMSX102.ger.corp.intel.com>
	<CA+T6QPn9OBv7P1ocUuyqOOxRZaHvNMAYVimRCvrMpHe=TrZZeg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+T6QPn9OBv7P1ocUuyqOOxRZaHvNMAYVimRCvrMpHe=TrZZeg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH] nodejs 0.8.18: update to 0.10.25
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2014 16:41:20 -0000
X-Groupsio-MsgNum: 48050
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wKTlTxfx0Fr6BT7S"
Content-Disposition: inline

--wKTlTxfx0Fr6BT7S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2014 at 11:32:50AM -0500, Jason Kridner wrote:
> On Thu, Jan 30, 2014 at 9:54 AM, Sywula, Krzysztof M <
> krzysztof.m.sywula@intel.com> wrote:
>=20
> > Regarding cloud9 and nodejs 0.10.25 I have:
> > cloud9/0.6-r5/temp/run.do_configure.1786: line 79: node-waf: command not
> > found
> > Is that the same problem you had?
> >
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> > openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Martin
> > Jansa
> > Sent: Wednesday, January 29, 2014 8:42 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: koen@dominion.thruhere.net
> > Subject: Re: [oe] [PATCH] nodejs 0.8.18: update to 0.10.25
> >
> > On Wed, Jan 29, 2014 at 06:33:36PM +0000, Sywula, Krzysztof M wrote:
> > > No, I didn't try cloud9.
> > > Is it a blocker for bumping nodejs? Or in such a case we should prese=
rve
> > 0.8 and add 0.10 next to it?
> >
> > Yes, it's blocker, because then I would need to find some volunteer to =
fix
> > cloud9.
> >
> > preserving 0.8 like nodejs4 is (separate files in sysroot, parallel
> > installation) would be best.
> >
>=20
> Is it Cloud9 that isn't compatible with 0.8? From what I remember, the
> Cloud9 version that is there isn't even compatible with 0.8, which is why
> nodejs4 is still there. I think you have to run it on 0.4 but execute the
> individual scripts with the newer version, unless that is broken now with
> 0.10.

It is currently using both:
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:# Nodejs-native for node-waf,=
 nodejs4-native for the headers
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:DEPENDS =3D "libxml2 nodejs-n=
ative nodejs4-native"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:RDEPENDS_${PN} =3D "nodejs4 n=
odejs gzip"

>=20
> The c9v3 (updated version) is currently in closed beta but plays nice with
> node 0.10. I've been using it for a couple of months now and it is a real=
ly
> nice improvement and is packaged a bit cleaner, though I'm using 'npm' to
> build the C modules. Not sure if anyone has 'npm' working clean in a
> cross-environment.

Yes someone has :)

https://github.com/openwebos/meta-webos/commit/55a83cffb11132d44b6e7699f718=
e72db895d6c9

>=20
>=20
> >
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org
> > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> > > Of Martin Jansa
> > > Sent: Wednesday, January 29, 2014 6:29 PM
> > > To: openembedded-devel@lists.openembedded.org
> > > Cc: koen@dominion.thruhere.net
> > > Subject: Re: [oe] [PATCH] nodejs 0.8.18: update to 0.10.25
> > >
> > > On Wed, Jan 29, 2014 at 06:03:28PM +0000, krzysztof.m.sywula@intel.co=
mwrote:
> > > > From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> > > >
> > > > Regenerated Khem's patch for assembler-arm.cc, skipped:
> > > > deps/v8/src/platform-linux.cc since it is already correct in current
> > > > nodejs version
> > >
> > > Have you tried to build cloud9?
> > >
> > > Last time I've tried:
> > > http://patchwork.openembedded.org/patch/48253/
> > >
> > > cloud9 wasn't compatible with 0.10*
> > >
> > > > Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> > > > ---
> > > >  ...erating-Khem-s-patch-for-assembler-arm.cc.patch | 31 +++++++++++
> > > > ...uiltin-define-to-denote-hard-abi-when-in-.patch | 60
> > > > ----------------------  .../nodejs/{nodejs_0.8.18.bb =3D>
> > > > nodejs_0.10.25.bb} | 12 ++---
> > > >  3 files changed, 37 insertions(+), 66 deletions(-)  create mode
> > > > 100644
> > > > meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-s-patc
> > > > h- for-assembler-arm.cc.patch  delete mode 100644
> > > > meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define
> > > > -t o-denote-hard-abi-when-in-.patch  rename
> > > > meta-oe/recipes-devtools/nodejs/{nodejs_0.8.18.bb =3D>
> > > > nodejs_0.10.25.bb} (73%)
> > > >
> > > > diff --git
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-s-pa
> > > > tc
> > > > h-for-assembler-arm.cc.patch
> > > > b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-s-pa
> > > > tc
> > > > h-for-assembler-arm.cc.patch
> > > > new file mode 100644
> > > > index 0000000..19b4b6d
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-
> > > > +++ s- patch-for-assembler-arm.cc.patch
> > > > @@ -0,0 +1,31 @@
> > > > +From 9febf23ae39c6b7a49b3e9a43319ec9dca8ea771 Mon Sep 17 00:00:00
> > > > +2001
> > > > +From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> > > > +Date: Wed, 29 Jan 2014 17:32:13 +0000
> > > > +Subject: [PATCH] Regenerating Khem's patch for assembler-arm.cc
> > > > +
> > > > +deps/v8/src/platform-linux.cc is already fixed in this version of
> > > > +nodejs, so no need to patch it again.
> > > > +---
> > > > + deps/v8/src/arm/assembler-arm.cc | 4 ++--
> > > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > > +
> > > > +diff --git a/deps/v8/src/arm/assembler-arm.cc
> > > > +b/deps/v8/src/arm/assembler-arm.cc
> > > > +index 9be62a4..f919ff1 100644
> > > > +--- a/deps/v8/src/arm/assembler-arm.cc
> > > > ++++ b/deps/v8/src/arm/assembler-arm.cc
> > > > +@@ -71,10 +71,10 @@ static unsigned CpuFeaturesImpliedByCompiler()=
 {
> > > > +   // If the compiler is allowed to use VFP then we can use VFP too
> > in our code
> > > > +   // generation even when generating snapshots. ARMv7 and hardware
> > floating
> > > > +   // point support implies VFPv3, see ARM DDI 0406B, page A1-6.
> > > > +-#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__) \
> > > > ++#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP)
> > > > ++\
> > > > +     && !defined(__SOFTFP__)
> > > > +   answer |=3D 1u << VFP3 | 1u << ARMv7 | 1u << VFP2; -#endif  //
> > > > +defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__)
> > > > ++#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) &&
> > > > ++defined(__ARM_PCS_VFP)
> > > > +         // && !defined(__SOFTFP__)  #endif  // _arm__
> > > > +   if (answer & (1u << ARMv7)) {
> > > > +--
> > > > +1.7.12.2
> > > > +
> > > > diff --git
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-defi
> > > > ne
> > > > -to-denote-hard-abi-when-in-.patch
> > > > b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-defi
> > > > ne
> > > > -to-denote-hard-abi-when-in-.patch
> > > > deleted file mode 100644
> > > > index 6268d69..0000000
> > > > ---
> > > > a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-defi
> > > > ne
> > > > -to-denote-hard-abi-when-in-.patch
> > > > +++ /dev/null
> > > > @@ -1,60 +0,0 @@
> > > > -From bf701e7cb3616631a354ed9ecbed6dd16f60c60d Mon Sep 17 00:00:00
> > > > 2001
> > > > -From: Koen Kooi <koen@dominion.thruhere.net>
> > > > -Date: Wed, 30 Jan 2013 10:43:47 +0100
> > > > -Subject: [PATCH] gcc has a builtin define to denote hard abi when =
in
> > use, e.g.
> > > > - when using -mfloat-abi=3Dhard it will define __ARM_PCS_VFP to 1 a=
nd
> > > > therefore
> > > > - we should check that to determine which calling convention is in
> > > > use and not
> > > > - __VFP_FP__ which merely indicates presence of VFP unit
> > > > -
> > > > -The fix has been provided by Khem Raj <raj.khem@gmail.com>
> > > > -
> > > > -Upstream-Status: Forwarded
> > > > -
> > > > -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > > > ----
> > > > - deps/v8/src/arm/assembler-arm.cc | 4 ++--
> > > > - deps/v8/src/platform-linux.cc    | 4 ++--
> > > > - 2 files changed, 4 insertions(+), 4 deletions(-)
> > > > -
> > > > -diff --git a/deps/v8/src/arm/assembler-arm.cc
> > > > b/deps/v8/src/arm/assembler-arm.cc
> > > > -index 1787d15..c64ef58 100644
> > > > ---- a/deps/v8/src/arm/assembler-arm.cc
> > > > -+++ b/deps/v8/src/arm/assembler-arm.cc
> > > > -@@ -71,10 +71,10 @@ static unsigned CpuFeaturesImpliedByCompiler()=
 {
> > > > -   // If the compiler is allowed to use VFP then we can use VFP too
> > in our code
> > > > -   // generation even when generating snapshots. ARMv7 and hardware
> > floating
> > > > -   // point support implies VFPv3, see ARM DDI 0406B, page A1-6.
> > > > --#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__) \
> > > > -+#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP)
> > > > -+\
> > > > -     && !defined(__SOFTFP__)
> > > > -   answer |=3D 1u << VFP3 | 1u << ARMv7 | 1u << VFP2;
> > > > --#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) &&
> > > > defined(__VFP_FP__)
> > > > -+#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) &&
> > > > -+defined(__ARM_PCS_VFP)
> > > > -         // && !defined(__SOFTFP__)
> > > > - #endif  // _arm__
> > > > -
> > > > -diff --git a/deps/v8/src/platform-linux.cc
> > > > b/deps/v8/src/platform-linux.cc -index ed9eb79..10d1879 100644
> > > > ---- a/deps/v8/src/platform-linux.cc
> > > > -+++ b/deps/v8/src/platform-linux.cc
> > > > -@@ -170,7 +170,7 @@ bool OS::ArmCpuHasFeature(CpuFeature feature) {
> > > > - // calling this will return 1.0 and otherwise 0.0.
> > > > - static void ArmUsingHardFloatHelper() {
> > > > -   asm("mov r0, #0":::"r0");
> > > > --#if defined(__VFP_FP__) && !defined(__SOFTFP__)
> > > > -+#if defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
> > > > -   // Load 0x3ff00000 into r1 using instructions available in both=
 ARM
> > > > -   // and Thumb mode.
> > > > -   asm("mov r1, #3":::"r1");
> > > > -@@ -195,7 +195,7 @@ static void ArmUsingHardFloatHelper() {
> > > > - #else
> > > > -   asm("vmov d0, r0, r1");
> > > > - #endif  // __thumb__
> > > > --#endif  // defined(__VFP_FP__) && !defined(__SOFTFP__)
> > > > -+#endif  // defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
> > > > -   asm("mov r1, #0":::"r1");
> > > > - }
> > > > -
> > > > ---
> > > > -1.8.1
> > > > -
> > > > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> > > > b/meta-oe/recipes-devtools/nodejs/nodejs_0.10.25.bb
> > > > similarity index 73%
> > > > rename from meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> > > > rename to meta-oe/recipes-devtools/nodejs/nodejs_0.10.25.bb
> > > > index ec9e4cf..a6e8c3f 100644
> > > > --- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> > > > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.10.25.bb
> > > > @@ -1,15 +1,15 @@
> > > >  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> > > >  HOMEPAGE =3D "http://nodejs.org"
> > > >  LICENSE =3D "MIT & BSD"
> > > > -LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D95a589a3257ab7dfe37d8a8379e3c72d"
> > > > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D4a31e6c424761191227143b86f58a1ef"
> > > >
> > > >  DEPENDS =3D "openssl"
> > > >
> > > > -SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
> > > > -
> > file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch \
> > > > -"
> > > > -SRC_URI[md5sum] =3D "25ed6aa5710ac46b867ff3f17a4da1d6"
> > > > -SRC_URI[sha256sum] =3D
> > "1d63dd42f9bd22f087585ddf80a881c6acbe1664891b1dda3b71306fe9ae00f9"
> > > > +SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
> > > > +#
> > file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
> > > > +
> > > > +SRC_URI[md5sum] =3D "153bdbf77b4473df2600b8ce123ef331"
> > > > +SRC_URI[sha256sum] =3D
> > "46eef3b9d5475a2081dc2b2f7cf1f4c3a56824d1fc9b04e7ed1d7a88e8f6b36f"
> > > >
> > > >  S =3D "${WORKDIR}/node-v${PV}"
> > > >
> > > > --
> > > > 1.7.12.2
> > > >
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > -------------------------------------------------------------
> > > Intel Ireland Limited (Branch)
> > > Collinstown Industrial Park, Leixlip, County Kildare, Ireland
> > > Registered Number: E902934
> > >
> > > This e-mail and any attachments may contain confidential material for
> > > the sole use of the intended recipient(s). Any review or distribution
> > > by others is strictly prohibited. If you are not the intended
> > > recipient, please contact the sender and delete all copies.
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > -------------------------------------------------------------
> > Intel Ireland Limited (Branch)
> > Collinstown Industrial Park, Leixlip, County Kildare, Ireland
> > Registered Number: E902934
> >
> > This e-mail and any attachments may contain confidential material for
> > the sole use of the intended recipient(s). Any review or distribution
> > by others is strictly prohibited. If you are not the intended
> > recipient, please contact the sender and delete all copies.
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wKTlTxfx0Fr6BT7S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLyabEACgkQN1Ujt2V2gBx0NACfZV3mJ5wKs6c1V5s9nDzEWT1h
XikAn3wXgrm4C/HMyBsFz0IOykP6IlWi
=uXrP
-----END PGP SIGNATURE-----

--wKTlTxfx0Fr6BT7S--
