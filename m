Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UA3je-00055S-Im; Mon, 25 Feb 2013 20:29:18 +0100
Received: by mail-pa0-f52.google.com with SMTP id fb1so1918649pad.25
	for <multiple recipients>; Mon, 25 Feb 2013 11:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=9j1FtfnKmVA8aDq3TGHnZutnbLzflmRA5mraLOKv1s0=;
	b=Pa+ZzuzFe7N6bDiXn9tcFVPP8i0bJ7LtgOW4wEFf89jBEIicaz8r5HqFx7lQhJIorM
	1y9s17R8IxtyLypAxArny+ivkKyL8GM1BXOp10W+g1CLyaOEa0HiqWYzxdI2oGQQNP9U
	Qq2OKBMXQ9zVtSfBpRODtTty5ZWbrl2U1WP5d7B3UIskzTTNwp6DFJqr+pnkeZ3nUzlC
	V0r97g4BqkXr9F0a5a3/fM7RLecX+GuXEStBrxDpSoqXxX6Q3gti1dvxthTkuK+1XCfW
	yAFN0R3yZ4qpVsdXMlFdAoMuIGE7cEluoqtyFlosU7zv8e8xV9t28Gl7VcPd0uthK4qQ
	cKpQ==
X-Received: by 10.68.244.162 with SMTP id xh2mr19543902pbc.55.1361819575543;
	Mon, 25 Feb 2013 11:12:55 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k7sm14626897paz.13.2013.02.25.11.12.51
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 25 Feb 2013 11:12:53 -0800 (PST)
Date: Mon, 25 Feb 2013 20:13:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Message-ID: <20130225191302.GB3239@jama>
References: <20130206093803.C4B3920AB@opal> <20130206212207.GD3271@jama>
	<70CC66F5C30A414DADDA6973E4CA391A86ECAB@039-SN1MPN1-002.039d.mgd.msft.net>
MIME-Version: 1.0
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A86ECAB@039-SN1MPN1-002.039d.mgd.msft.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Matthew McClintock : libpfm4_4.3.0.bb: add libpfm4 recipe needed by oprofile for ppc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Feb 2013 19:29:19 -0000
X-Groupsio-MsgNum: 43299
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline

--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 07, 2013 at 04:34:27PM +0000, McClintock Matthew-B29882 wrote:
> On Wed, Feb 6, 2013 at 2:22 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Wed, Feb 06, 2013 at 09:38:03AM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: 52c94978992d9084d685d4999064a8cee35220d1
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3D52c94978992d9084d685d4999064a8cee35220d1
> >>
> >> Author: Matthew McClintock <msm@freescale.com>
> >> Date:   Tue Feb  5 11:46:46 2013 -0600
> >>
> >> libpfm4_4.3.0.bb: add libpfm4 recipe needed by oprofile for ppc
> >
> > This is pulled to world build on arm too and fails there:
> >
>=20
> I'll take a look at this next week once I'm back in the office.

Any update on this one?

> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te  -marm -mthumb-interwork  =
 --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroot=
s/qemuarm -O2 -pipe -g -feliminate-unused-debug-types  -g -Wall -Werror -We=
xtra -Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-cor=
e/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/in=
clude -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX  -g -Wall -Werror -Wex=
tra -Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/lib=
/../include -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX -D_REENTRANT -I.=
 -DCONFIG_PFMLIB_ARCH_X86 -DCONFIG_PFMLIB_ARCH_X86_64 -I. -c pfmlib_intel_n=
hm.c
> > | pfmlib_amd64.c: In function 'pfm_amd64_detect':
> > | pfmlib_amd64.c:185:3: error: impossible constraint in 'asm'
> > | pfmlib_amd64.c:185:3: error: impossible constraint in 'asm'
> > | pfmlib_intel_x86.c: In function 'pfm_intel_x86_detect':
> > | pfmlib_intel_x86.c:56:3: error: impossible constraint in 'asm'
> > | pfmlib_intel_x86.c:56:3: error: impossible constraint in 'asm'
> > | pfmlib_intel_x86_arch.c: In function 'pfm_intel_x86_arch_init':
> > | pfmlib_intel_x86_arch.c:55:3: error: impossible constraint in 'asm'
> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te  -marm -mthumb-interwork  =
 --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroot=
s/qemuarm -O2 -pipe -g -feliminate-unused-debug-types  -g -Wall -Werror -We=
xtra -Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-cor=
e/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/in=
clude -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX  -g -Wall -Werror -Wex=
tra -Wno-unused-parameter -I. -I/home/jenkins/oe/shr-core-branches/shr-core=
/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpfm4/4.3.0-r0/libpfm-4.3.0/lib=
/../include -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX -D_REENTRANT -I.=
 -DCONFIG_PFMLIB_ARCH_X86 -DCONFIG_PFMLIB_ARCH_X86_64 -I. -c pfmlib_intel_w=
sm.c
> > | make[1]: *** [pfmlib_intel_x86_arch.o] Error 1
> > | make[1]: *** Waiting for unfinished jobs....
> > | make[1]: *** [pfmlib_amd64.o] Error 1
> > | make[1]: *** [pfmlib_intel_x86.o] Error 1
> >
> >> Signed-off-by: Matthew McClintock <msm@freescale.com>
> >> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >>
> >> ---
> >>
> >>  meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb |   26 ++++++++++++++++++=
++++++++
> >>  1 files changed, 26 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb b/meta/recipe=
s-kernel/libpfm/libpfm4_4.3.0.bb
> >> new file mode 100644
> >> index 0000000..460029f
> >> --- /dev/null
> >> +++ b/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
> >> @@ -0,0 +1,26 @@
> >> +SUMMARY =3D "Monitoring tools exploiting the performance monitoring e=
vents"
> >> +DESCRIPTION =3D "This package provides a library, called libpfm4 whic=
h is used to develop \
> >> +monitoring tools exploiting the performance monitoring events such as=
 those \
> >> +provided by the Performance Monitoring Unit (PMU) of modern processor=
s."
> >> +HOMEPAGE =3D "http://perfmon2.sourceforge.net/"
> >> +BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D144822&ati=
d=3D759953&source=3Dnavbar"
> >> +
> >> +LICENSE =3D "MIT"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0de488f3bd4424e308e2e399cb=
99c788"
> >> +
> >> +SECTION =3D "devel"
> >> +
> >> +SRC_URI =3D "http://downloads.sourceforge.net/project/perfmon2/libpfm=
4/libpfm-4.3.0.tar.gz"
> >> +
> >> +SRC_URI[md5sum] =3D "0ab272dbdbb759b852ba8bd06db030ef"
> >> +SRC_URI[sha256sum] =3D "a23eb9affbff279e13563a39317c0ad71c4de28908d42=
43c8bc109138430cc3b"
> >> +
> >> +EXTRA_OEMAKE =3D "DESTDIR=3D\"${D}\" PREFIX=3D\"${prefix}\" LIBDIR=3D=
\"${libdir}\" LDCONFIG=3D\"true\""
> >> +EXTRA_OEMAKE_append_powerpc =3D " ARCH=3D\"powerpc\""
> >> +EXTRA_OEMAKE_append_powerpc64 =3D " ARCH=3D\"powerpc\" BITMODE=3D\"64=
\""
> >> +
> >> +S =3D "${WORKDIR}/libpfm-${PV}"
> >> +
> >> +do_install () {
> >> +     oe_runmake install
> >> +}
> >>
> >>
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commi=
ts
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlErt74ACgkQN1Ujt2V2gBwL9QCfW14ti6dBD1oDEt72aQoOiImB
24YAoJf97Z+/xpzrl/jx1dBvawhL1isz
=zBNh
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
