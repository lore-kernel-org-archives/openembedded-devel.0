Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF5E71BB9
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Jul 2018 23:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 9AA59183BC;
	Mon,  9 Jul 2018 01:33:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id RvoJx_62riC0; Mon,  9 Jul 2018 01:33:41 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 94032183B1;
	Mon,  9 Jul 2018 01:33:41 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8092E1E056;
	Mon,  9 Jul 2018 01:33:41 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7466E1E054;
	Mon,  9 Jul 2018 01:33:41 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon,  9 Jul 2018 01:33:41 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 67E652C9E;
	Mon,  9 Jul 2018 01:33:41 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 9 Jul 2018 01:33:41 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Mon, 9 Jul 2018 01:33:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Takuma Ueba <ueba.takuma@jp.fujitsu.com>, Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>
Thread-Topic: [oe] [PATCH] fix license from Apache-2.0 to MIT
Thread-Index: AQHUFPPjSpcSmcuwrkeqa89Gu+se4qSC1KyAgABMZoCAAtwsYA==
Date: Sun, 8 Jul 2018 23:33:41 +0000
Message-ID: <9230c538386e4f648408090dca391674@XBOX02.axis.com>
References: <20180706062625.7363-1-ueba.takuma@jp.fujitsu.com>
	<e19a9f68-d15d-0894-492a-0dd2d3f4cee4@gmail.com>
	<CAMKF1sqE11tW8Kcnjqv0MwMjKfeWVHR5=gEs6vQEJOKgiWCPNA@mail.gmail.com>
In-Reply-To: <CAMKF1sqE11tW8Kcnjqv0MwMjKfeWVHR5=gEs6vQEJOKgiWCPNA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] fix license from Apache-2.0 to MIT
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
X-List-Received-Date: Sun, 08 Jul 2018 23:33:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: den 7 juli 2018 07:49
> To: Armin Kuster <akuster808@gmail.com>
> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] [PATCH] fix license from Apache-2.0 to MIT
>=20
> On Fri, Jul 6, 2018 at 6:16 PM akuster808 <akuster808@gmail.com> wrote:
> >
> >
> >
> > On 07/05/2018 11:26 PM, Takuma Ueba wrote:
> > > Signed-off-by: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
> > > ---
> > >  meta-python/recipes-devtools/python/python-asn1crypto.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python-
> asn1crypto.inc b/meta-python/recipes-devtools/python/python-
> asn1crypto.inc
> > > index 5c379956f..660bf09a7 100644
> > > --- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
> > > +++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
> > > @@ -1,7 +1,7 @@
> > >  DESCRIPTION =3D "Python binding to the Networking and Cryptography (=
NaCl) library"
> > >  HOMEPAGE =3D "https://github.com/pyca/pynacl"
> > >  SECTION =3D "devel/python"
> > > -LICENSE =3D "Apache-2.0"
> > > +LICENSE =3D "MIT"
> >
> > Why did the LICENSE change? maybe not that in the commit message. It
> > helps the stable branch maintainer to decide if this needs to
> > propagate to other branches.
> >
>=20
> I dont think it changed, the SRC_URI for this is
>=20
> https://github.com/wbond/asn1crypto
>=20
> I am not sure if homepage is correct for this
>=20
> > - armin
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D52010cd3c7d7bd965b55721ef=
4d93ec2"
> > >
> > >  PYPI_PACKAGE =3D "asn1crypto"

Make sure to prefix the subject with the recipe name before this is merged,=
=20
to avoid confusion...

//Peter


