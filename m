Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1UFen0-0005D0-48
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 07:03:51 +0100
Received: from mail125-co1-R.bigfish.com (10.243.78.241) by
	CO1EHSOBE004.bigfish.com (10.243.66.67) with Microsoft SMTP Server id
	14.1.225.23; Wed, 13 Mar 2013 05:32:01 +0000
Received: from mail125-co1 (localhost [127.0.0.1])	by
	mail125-co1-R.bigfish.com (Postfix) with ESMTP id 75489540164	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 05:32:01 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I542I1432I1447Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275ch17326ah8275dh8275bhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail125-co1 (localhost.localdomain [127.0.0.1]) by mail125-co1
	(MessageSwitch) id 136315271928349_16823;
	Wed, 13 Mar 2013 05:31:59 +0000 (UTC)
Received: from CO1EHSMHS023.bigfish.com (unknown [10.243.78.238])	by
	mail125-co1.bigfish.com (Postfix) with ESMTP id EF8D8A8004B	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 05:31:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS023.bigfish.com
	(10.243.66.33) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 13 Mar 2013 05:31:58 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.152]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0328.011; Wed, 13 Mar 2013 05:31:58 +0000
From: Liu Ting-B28495 <B28495@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] tclap: initial add 1.2.1
Thread-Index: AQHOH6cZoNQ1fQgywkCD+6uQCUnM55ijF/pQ
Date: Wed, 13 Mar 2013 05:31:57 +0000
Message-ID: <AF604684617F454390621992F367F169012C456A@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1363146643-30820-1-git-send-email-b28495@freescale.com>
	<4E524730-2F6C-4396-8DDC-2BD21AA7AA05@gmail.com>
In-Reply-To: <4E524730-2F6C-4396-8DDC-2BD21AA7AA05@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.85]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe][PATCH] tclap: initial add 1.2.1
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
X-List-Received-Date: Wed, 13 Mar 2013 06:04:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Wednesday, March 13, 2013 12:55 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] tclap: initial add 1.2.1
>=20
>=20
> On Mar 12, 2013, at 8:50 PM, b28495@freescale.com wrote:
>=20
> > From: Ting Liu <b28495@freescale.com>
> >
> > TCLAP (Templatized C++ Command Line Parser Library ) is a small,
> > flexible library that provides a simple interface for defining and
> > accessing command line arguments. Templatized C++ Command Line Parser
> > Library.
> >
> > Use the commit of tag tclap-1-2-1-release-final.
> >
> > Signed-off-by: Ting Liu <b28495@freescale.com>
> > ---
> > meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb |   13 +++++++++++++
> > 1 files changed, 13 insertions(+), 0 deletions(-) create mode 100644
> > meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> >
> > diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > new file mode 100644
> > index 0000000..c2b03a4
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> > @@ -0,0 +1,13 @@
> > +DESCRIPTION =3D "Templatized C++ Command Line Parser"
> > +HOMEPAGE =3D "http://tclap.sourceforge.net/"
> > +SECTION =3D "tclap"
>=20
> why a special section dedicated to it.?

thanks for the finding. Will remove it.

-Ting

>=20
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dc8ab0ff134bcc584d0e6b5b9f8732453"
> > +
> > +SRCREV =3D "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
> > +SRC_URI =3D "git://tclap.git.sourceforge.net/gitroot/tclap/tclap"
> > +
> > +S =3D "${WORKDIR}/git"
> > +inherit autotools
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 1.7.3.4
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




