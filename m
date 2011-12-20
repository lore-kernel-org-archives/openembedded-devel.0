Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE009.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RcpbG-00082T-T1
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 03:38:44 +0100
Received: from mail97-tx2-R.bigfish.com (10.9.14.236) by
	TX2EHSOBE009.bigfish.com (10.9.40.29) with Microsoft SMTP Server id
	14.1.225.23; Tue, 20 Dec 2011 02:31:32 +0000
Received: from mail97-tx2 (localhost [127.0.0.1])	by mail97-tx2-R.bigfish.com
	(Postfix) with ESMTP id 10642620192	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 02:31:52 +0000 (UTC)
X-SpamScore: -24
X-BigFish: VS-24(zzbb2dI9371I146fK1447M542M1432N41c5N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9n61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail97-tx2 (localhost.localdomain [127.0.0.1]) by mail97-tx2
	(MessageSwitch) id 1324348311754780_2056;
	Tue, 20 Dec 2011 02:31:51 +0000 (UTC)
Received: from TX2EHSMHS035.bigfish.com (unknown [10.9.14.250])	by
	mail97-tx2.bigfish.com (Postfix) with ESMTP id 9F9B840058	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 02:31:51 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS035.bigfish.com
	(10.9.99.135) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 20 Dec 2011 02:31:31 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Mon, 19 Dec 2011 20:31:38 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH meta-oe 5/9] nerperf: add
Thread-Index: AQHMu5uU0v7ifXEdrkurJWiJJ/F/5pXefH+A//+y/yCAAGZ4gIAA0hiAgATBSwD//90McA==
Date: Tue, 20 Dec 2011 02:31:37 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010B966C@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-5-git-send-email-b19537@freescale.com>
	<jcetai$4n1$5@dough.gmane.org>
	<CA452391058F6D4E9715FB2C29D9312A02CEB8@039-SN2MPN1-022.039d.mgd.msft.net>
	<44FD6890-C4DA-4A40-B30F-BDADC690C21E@dominion.thruhere.net>
	<20111216215455.GC28832@sakrah.homelinux.org>
	<CAPhnLPDSpXjAi+V9gjJCsrdoYez5CJWzv-+ejmDqm8P5mFu_Kw@mail.gmail.com>
In-Reply-To: <CAPhnLPDSpXjAi+V9gjJCsrdoYez5CJWzv-+ejmDqm8P5mFu_Kw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH meta-oe 5/9] nerperf: add
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
X-List-Received-Date: Tue, 20 Dec 2011 02:38:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback.

I saw netperf is licensed under "netperf" in oe http://cgit.openembedded.or=
g/openembedded/plain/recipes/netperf/netperf_2.4.4.bb.=20

Anyway, I will send an email to the author to query about the license type.=
=20


Best Regards,

Zhenhua

> -----Original Message-----
> From: Flanagan, Elizabeth [mailto:elizabeth.flanagan@intel.com]
> Sent: Tuesday, December 20, 2011 6:32 AM
> To: openembedded-devel@lists.openembedded.org; Luo Zhenhua-B19537
> Subject: Re: [oe] [PATCH meta-oe 5/9] nerperf: add
>=20
> On Fri, Dec 16, 2011 at 1:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On (16/12/11 10:22), Koen Kooi wrote:
> >>
> >> Op 16 dec. 2011, om 10:19 heeft Luo Zhenhua-B19537 het volgende geschr=
even:
> >>
> >> > Hello Koen,
> >> >
> >> >> -----Original Message-----
> >> >> From: openembedded-devel-bounces@lists.openembedded.org
> >> >> [mailto:openembedded- devel-bounces@lists.openembedded.org] On
> >> >> Behalf Of Koen Kooi
> >> >> Sent: Friday, December 16, 2011 3:52 PM
> >> >>
> >> >>> +++ b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb @@ -0,0
> >> >>> +++ +1,47
> >> >>> @@ +DESCRIPTION=3D"Network performance benchmark including tests
> >> >>> for TCP, UDP, sockets, ATM and more." +SECTION =3D "console/networ=
k"
> >> >>> +HOMEPAGE =3D "http://www.netperf.org/" +LICENSE =3D "netperf"
> >> >>
> >> >> Can you include a comment on what type of license netperf is? MIT
> >> >> like, BSD like, GPL like?
> >> > [Luo Zhenhua-B19537] May I know which license type should be with fo=
llowing
> COPYING content?
> >>
> >> That looks like a BSD or MIT derivative, maybe Beth can give us some
> >> guidance on what to use as LICENSE
> >
> > it says "for non-commercial purposes only"
>=20
> Yeah.... in this case, I would do one of two things (and I have a feeling=
 one
> will be more valid that the other):
>=20
> 1. Email the author and see if we can use BSD-4-Clause. My guess is no.
> 2. We'll need to add a Netperf license to common-licenses and set LICENSE=
 =3D
> "Netperf"
>=20
> I've checked the openSuSE Build Service and they have this as an "Other" =
license,
> so, check with the author first, but be prepared to add Netperf to the co=
mmon-
> licenses directory.
>=20
> And yes, Koen is right. I wouldn't use BSD or MIT for this, specifically =
because
> of the non-commercial clause in (ii).
>=20
> -b
>=20
> >
> >>
> >> regards,
> >>
> >> Koen
> >>
> >>
> >> >
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0Copyright (C) 1993 Hewlett-Packard Compan=
y
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ALL RIGHTS RESERVED.
> >> >
> >> > =A0The enclosed software and documentation includes copyrighted work=
s
> >> > =A0of Hewlett-Packard Co. For as long as you comply with the
> >> > following
> >> > =A0limitations, you are hereby authorized to (i) use, reproduce, and
> >> > =A0modify the software and documentation, and to (ii) distribute the
> >> > =A0software and documentation, including modifications, for
> >> > =A0non-commercial purposes only.
> >> >
> >> > =A01. =A0The enclosed software and documentation is made available a=
t
> >> > no
> >> > =A0 =A0 =A0charge in order to advance the general development of
> >> > =A0 =A0 =A0high-performance networking products.
> >> >
> >> > =A02. =A0You may not delete any copyright notices contained in the
> >> > =A0 =A0 =A0software or documentation. All hard copies, and copies in
> >> > =A0 =A0 =A0source code or object code form, of the software or
> >> > =A0 =A0 =A0documentation (including modifications) must contain at l=
east
> >> > =A0 =A0 =A0one of the copyright notices.
> >> >
> >> > =A03. =A0The enclosed software and documentation has not been subjec=
ted
> >> > =A0 =A0 =A0to testing and quality control and is not a Hewlett-Packa=
rd Co.
> >> > =A0 =A0 =A0product. At a future time, Hewlett-Packard Co. may or may=
 not
> >> > =A0 =A0 =A0offer a version of the software and documentation as a pr=
oduct.
> >> >
> >> > =A04. =A0THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
> >> > =A0 =A0 =A0HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
> >> > =A0 =A0 =A0REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWAR=
E OR
> >> > =A0 =A0 =A0DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECT=
UAL
> >> > =A0 =A0 =A0PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
> >> > =A0 =A0 =A0DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
> >> > =A0 =A0 =A0EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
> >> > =A0 =A0 =A0DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES O=
F
> >> > =A0 =A0 =A0MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
> >> >
> >> > =A05. =A0HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR
> >> > ANY
> >> > =A0 =A0 =A0DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DA=
MAGES
> >> > =A0 =A0 =A0(INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION=
,
> >> > =A0 =A0 =A0MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENT=
ATION.
> >> >
> >> >
> >> > Best Regards,
> >> >
> >> > Zhenhua
> >> >
> >>
> >
> >
> >
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve
> >> l
> >
> >
> > --
> > -Khem
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
> --
> Elizabeth Flanagan
> Yocto Project
> Build and Release




