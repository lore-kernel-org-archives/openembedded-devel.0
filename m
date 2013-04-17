Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1USJ5L-0007tN-06
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 05:31:04 +0200
Received: from mail197-co9-R.bigfish.com (10.236.132.250) by
	CO9EHSOBE017.bigfish.com (10.236.130.80) with Microsoft SMTP Server id
	14.1.225.23; Wed, 17 Apr 2013 02:58:19 +0000
Received: from mail197-co9 (localhost [127.0.0.1])	by
	mail197-co9-R.bigfish.com (Postfix) with ESMTP id B370AB40740;
	Wed, 17 Apr 2013 02:58:19 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I542I1432Izz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275bh8275dh8275chz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail197-co9 (localhost.localdomain [127.0.0.1]) by mail197-co9
	(MessageSwitch) id 1366167423787035_6359;
	Wed, 17 Apr 2013 02:57:03 +0000 (UTC)
Received: from CO9EHSMHS013.bigfish.com (unknown [10.236.132.243])	by
	mail197-co9.bigfish.com (Postfix) with ESMTP id B6614540120;
	Wed, 17 Apr 2013 02:57:03 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS013.bigfish.com
	(10.236.130.23) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 17 Apr 2013 02:57:02 +0000
Received: from 039-SN2MPN1-013.039d.mgd.msft.net ([169.254.3.24]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0328.011; Wed, 17 Apr 2013 02:57:02 +0000
From: Liu Ting-B28495 <B28495@freescale.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH v4] tclap: initial add 1.2.1
Thread-Index: AQHOOcE7pPA0RBop8kaoB35vgWXQW5jZunnA
Date: Wed, 17 Apr 2013 02:57:01 +0000
Message-ID: <AF604684617F454390621992F367F16901C7BAB2@039-SN2MPN1-013.039d.mgd.msft.net>
References: <1366016435-10751-1-git-send-email-b28495@freescale.com>
	<20130415100740.GN2475@jama>
In-Reply-To: <20130415100740.GN2475@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.72]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4] tclap: initial add 1.2.1
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
X-List-Received-Date: Wed, 17 Apr 2013 03:31:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Monday, April 15, 2013 6:08 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH v4] tclap: initial add 1.2.1
>=20
> On Mon, Apr 15, 2013 at 05:00:35PM +0800, b28495@freescale.com wrote:
> > From: Ting Liu <b28495@freescale.com>
> >
> > TCLAP (Templatized C++ Command Line Parser Library ) is a small,
> > flexible library that provides a simple interface for defining and
> > accessing command line arguments.
> >
> > Use the commit of tag tclap-1-2-1-release-final.
> >
> > Signed-off-by: Ting Liu <b28495@freescale.com>
> > ---
> >  .../tclap/files/Makefile.am-disable-docs.patch     |   31
> ++++++++++++++++++++
> >  meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb      |   14 +++++++++
> >  2 files changed, 45 insertions(+), 0 deletions(-)  create mode 100644
> > meta-oe/recipes-devtools/tclap/files/Makefile.am-disable-docs.patch
> >  create mode 100644 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> >
> > diff --git
> > a/meta-oe/recipes-devtools/tclap/files/Makefile.am-disable-docs.patch
> > b/meta-oe/recipes-devtools/tclap/files/Makefile.am-disable-docs.patch
> > new file mode 100644
> > index 0000000..358cbef
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/tclap/files/Makefile.am-disable-docs.pa
> > +++ tch
>=20
> why not in meta-oe/recipes-devtools/tclap/tclap? Lookup would be few
> milliseconds faster :)

Modified in v5 patch. Thanks for your kindly reminder.

>=20
> > @@ -0,0 +1,31 @@
> > +From c209ed0e7ffca32fe3714bad9cc54bdb00c286bb Mon Sep 17 00:00:00
> > +2001
> > +From: Ting Liu <b28495@freescale.com>
> > +Date: Mon, 15 Apr 2013 16:28:37 +0800
> > +Subject: [PATCH] Makefile.am: disable docs
> > +
> > +Upstream-Status: Inappropriate [OE specific]
> > +
> > +docs need some generating tool (for example, doxygen) from host which
> > +may be not available. Disable it to avoid build issue.
> > +
> > +Signed-off-by: Ting Liu <b28495@freescale.com>
> > +---
> > + Makefile.am |    2 +-
> > + 1 files changed, 1 insertions(+), 1 deletions(-)
> > +
> > +diff --git a/Makefile.am b/Makefile.am index 0a6ebc9..6b42f41 100644
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -1,7 +1,7 @@
> > +
> > + ACLOCAL_AMFLAGS =3D -I config
> > +
> > +-SUBDIRS =3D include examples docs tests msc config
> > ++SUBDIRS =3D include examples tests msc config
> > +
> > + pkgconfigdir =3D $(libdir)/pkgconfig
> > + pkgconfig_DATA =3D $(PACKAGE).pc
> > +--
> > +1.7.5
> > +
> > diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > new file mode 100644
> > index 0000000..c9fab52
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > @@ -0,0 +1,14 @@
> > +DESCRIPTION =3D "Templatized C++ Command Line Parser"
> > +HOMEPAGE =3D "http://tclap.sourceforge.net/"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dc8ab0ff134bcc584d0e6b5b9f8732453"
> > +
> > +SRCREV =3D "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
> > +SRC_URI =3D "git://tclap.git.sourceforge.net/gitroot/tclap/tclap \
> > +          file://Makefile.am-disable-docs.patch \
>=20
> Please use 4 spaces if you send v5 with .patch file moved.
>=20
> > +"
> > +
> > +S =3D "${WORKDIR}/git"
> > +inherit autotools
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 1.7.5
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



