Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=DB3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RdFkP-0003pU-Ov
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 07:33:53 +0100
Received: from mail64-db3-R.bigfish.com (10.3.81.243) by
	DB3EHSOBE003.bigfish.com (10.3.84.23) with Microsoft SMTP Server id
	14.1.225.23; Wed, 21 Dec 2011 06:26:40 +0000
Received: from mail64-db3 (localhost [127.0.0.1])	by mail64-db3-R.bigfish.com
	(Postfix) with ESMTP id A53FD803A4;
	Wed, 21 Dec 2011 06:27:09 +0000 (UTC)
X-SpamScore: -34
X-BigFish: VS-34(zzbb2dI9371I146fK1447M542M1432N41c5N98dKzz1202hzz8275bh8275dhb22Rz2dh2a8h668h839h8e2h8e3hbe9n)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail64-db3 (localhost.localdomain [127.0.0.1]) by mail64-db3
	(MessageSwitch) id 1324448829472259_31290;
	Wed, 21 Dec 2011 06:27:09 +0000 (UTC)
Received: from DB3EHSMHS017.bigfish.com (unknown [10.3.81.249])	by
	mail64-db3.bigfish.com (Postfix) with ESMTP id 6CFF93A0046;
	Wed, 21 Dec 2011 06:27:09 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS017.bigfish.com
	(10.3.87.117) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 21 Dec 2011 06:26:38 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Wed, 21 Dec 2011 00:26:34 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "elizabeth.flanagan@intel.com"
	<elizabeth.flanagan@intel.com>
Thread-Topic: [oe] [PATCH meta-oe 5/9] nerperf: add
Thread-Index: AQHMu5uU0v7ifXEdrkurJWiJJ/F/5pXefH+A//+y/yCAAGZ4gIAA0hiAgATBSwD//90McIAB1BdQ
Date: Wed, 21 Dec 2011 06:26:34 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010B9F06@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-5-git-send-email-b19537@freescale.com>
	<jcetai$4n1$5@dough.gmane.org>
	<CA452391058F6D4E9715FB2C29D9312A02CEB8@039-SN2MPN1-022.039d.mgd.msft.net>
	<44FD6890-C4DA-4A40-B30F-BDADC690C21E@dominion.thruhere.net>
	<20111216215455.GC28832@sakrah.homelinux.org>
	<CAPhnLPDSpXjAi+V9gjJCsrdoYez5CJWzv-+ejmDqm8P5mFu_Kw@mail.gmail.com> 
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
X-List-Received-Date: Wed, 21 Dec 2011 06:33:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have sent an email to netperf-feedback@netperf.org to query the appropria=
te license type yesterday and not response.

I'd like to adopt following option, does it make sense?
> > 2. We'll need to add a Netperf license to common-licenses and set LICEN=
SE =3D "Netperf"


Best Regards,

Zhenhua


> -----Original Message-----
> From: Luo Zhenhua-B19537
> Sent: Tuesday, December 20, 2011 10:32 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: RE: [oe] [PATCH meta-oe 5/9] nerperf: add
>=20
> Thanks for the feedback.
>=20
> I saw netperf is licensed under "netperf" in oe
> http://cgit.openembedded.org/openembedded/plain/recipes/netperf/netperf_2=
.4.4.bb.
>=20
> Anyway, I will send an email to the author to query about the license typ=
e.
>=20
>=20
> Best Regards,
>=20
> Zhenhua
>=20
> > -----Original Message-----
> > From: Flanagan, Elizabeth [mailto:elizabeth.flanagan@intel.com]
> > Sent: Tuesday, December 20, 2011 6:32 AM
> > To: openembedded-devel@lists.openembedded.org; Luo Zhenhua-B19537
> > Subject: Re: [oe] [PATCH meta-oe 5/9] nerperf: add
> >
> > On Fri, Dec 16, 2011 at 1:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > > On (16/12/11 10:22), Koen Kooi wrote:
> > >>
> > >> Op 16 dec. 2011, om 10:19 heeft Luo Zhenhua-B19537 het volgende gesc=
hreven:
> > >>
> > >> > Hello Koen,
> > >> >
> > >> >> -----Original Message-----
> > >> >> From: openembedded-devel-bounces@lists.openembedded.org
> > >> >> [mailto:openembedded- devel-bounces@lists.openembedded.org] On
> > >> >> Behalf Of Koen Kooi
> > >> >> Sent: Friday, December 16, 2011 3:52 PM
> > >> >>
> > >> >>> +++ b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb @@
> > >> >>> +++ -0,0
> > >> >>> +++ +1,47
> > >> >>> @@ +DESCRIPTION=3D"Network performance benchmark including tests
> > >> >>> for TCP, UDP, sockets, ATM and more." +SECTION =3D "console/netw=
ork"
> > >> >>> +HOMEPAGE =3D "http://www.netperf.org/" +LICENSE =3D "netperf"
> > >> >>
> > >> >> Can you include a comment on what type of license netperf is?
> > >> >> MIT like, BSD like, GPL like?
> > >> > [Luo Zhenhua-B19537] May I know which license type should be with
> > >> > following
> > COPYING content?
> > >>
> > >> That looks like a BSD or MIT derivative, maybe Beth can give us
> > >> some guidance on what to use as LICENSE
> > >
> > > it says "for non-commercial purposes only"
> >
> > Yeah.... in this case, I would do one of two things (and I have a
> > feeling one will be more valid that the other):
> >
> > 1. Email the author and see if we can use BSD-4-Clause. My guess is no.
> > 2. We'll need to add a Netperf license to common-licenses and set
> > LICENSE =3D "Netperf"
> >
> > I've checked the openSuSE Build Service and they have this as an
> > "Other" license, so, check with the author first, but be prepared to
> > add Netperf to the common- licenses directory.
> >
> > And yes, Koen is right. I wouldn't use BSD or MIT for this,
> > specifically because of the non-commercial clause in (ii).
> >
> > -b
> >
> > >
> > >>
> > >> regards,
> > >>
> > >> Koen
> > >>
> > >>
> > >> >
> > >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0Copyright (C) 1993 Hewlett-Packard Comp=
any
> > >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ALL RIGHTS RESERVE=
D.
> > >> >
> > >> > =A0The enclosed software and documentation includes copyrighted
> > >> > works
> > >> > =A0of Hewlett-Packard Co. For as long as you comply with the
> > >> > following
> > >> > =A0limitations, you are hereby authorized to (i) use, reproduce,
> > >> > and
> > >> > =A0modify the software and documentation, and to (ii) distribute
> > >> > the
> > >> > =A0software and documentation, including modifications, for
> > >> > =A0non-commercial purposes only.
> > >> >
> > >> > =A01. =A0The enclosed software and documentation is made available=
 at
> > >> > no
> > >> > =A0 =A0 =A0charge in order to advance the general development of
> > >> > =A0 =A0 =A0high-performance networking products.
> > >> >
> > >> > =A02. =A0You may not delete any copyright notices contained in the
> > >> > =A0 =A0 =A0software or documentation. All hard copies, and copies =
in
> > >> > =A0 =A0 =A0source code or object code form, of the software or
> > >> > =A0 =A0 =A0documentation (including modifications) must contain at
> > >> > least
> > >> > =A0 =A0 =A0one of the copyright notices.
> > >> >
> > >> > =A03. =A0The enclosed software and documentation has not been
> > >> > subjected
> > >> > =A0 =A0 =A0to testing and quality control and is not a Hewlett-Pac=
kard Co.
> > >> > =A0 =A0 =A0product. At a future time, Hewlett-Packard Co. may or m=
ay
> > >> > not
> > >> > =A0 =A0 =A0offer a version of the software and documentation as a =
product.
> > >> >
> > >> > =A04. =A0THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
> > >> > =A0 =A0 =A0HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
> > >> > =A0 =A0 =A0REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTW=
ARE
> > >> > OR
> > >> > =A0 =A0 =A0DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLE=
CTUAL
> > >> > =A0 =A0 =A0PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE =
OR
> > >> > =A0 =A0 =A0DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIE=
S,
> > >> > =A0 =A0 =A0EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND TH=
E
> > >> > =A0 =A0 =A0DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES=
 OF
> > >> > =A0 =A0 =A0MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
> > >> >
> > >> > =A05. =A0HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE F=
OR
> > >> > ANY
> > >> > =A0 =A0 =A0DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL
> > >> > DAMAGES
> > >> > =A0 =A0 =A0(INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTI=
ON,
> > >> > =A0 =A0 =A0MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUME=
NTATION.
> > >> >
> > >> >
> > >> > Best Regards,
> > >> >
> > >> > Zhenhua
> > >> >
> > >>
> > >
> > >
> > >
> > >> _______________________________________________
> > >> Openembedded-devel mailing list
> > >> Openembedded-devel@lists.openembedded.org
> > >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de
> > >> ve
> > >> l
> > >
> > >
> > > --
> > > -Khem
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev
> > > el
> >
> >
> >
> > --
> > Elizabeth Flanagan
> > Yocto Project
> > Build and Release




