Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=VA3EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RdYkg-0002ey-VF
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Dec 2011 03:51:27 +0100
Received: from mail146-va3-R.bigfish.com (10.7.14.235) by
	VA3EHSOBE004.bigfish.com (10.7.40.24) with Microsoft SMTP Server id
	14.1.225.23; Thu, 22 Dec 2011 02:44:10 +0000
Received: from mail146-va3 (localhost [127.0.0.1])	by
	mail146-va3-R.bigfish.com (Postfix) with ESMTP id 99CB75000F8;
	Thu, 22 Dec 2011 02:45:02 +0000 (UTC)
X-SpamScore: -34
X-BigFish: VS-34(zzbb2dI9371Ic85fh146fK1447M542M1432N41c5N98dKzz1202hzz8275bh8275dhb22Rz2dh2a8h668h839h8e2h8e3hbe9n61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,0,
Received: from mail146-va3 (localhost.localdomain [127.0.0.1]) by mail146-va3
	(MessageSwitch) id 1324521901558933_7873;
	Thu, 22 Dec 2011 02:45:01 +0000 (UTC)
Received: from VA3EHSMHS020.bigfish.com (unknown [10.7.14.238])	by
	mail146-va3.bigfish.com (Postfix) with ESMTP id 77664360043;
	Thu, 22 Dec 2011 02:45:01 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS020.bigfish.com
	(10.7.99.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 22 Dec 2011 02:44:09 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Wed, 21 Dec 2011 20:44:18 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Thread-Topic: [oe] [PATCH meta-oe 5/9] nerperf: add
Thread-Index: AQHMu5uU0v7ifXEdrkurJWiJJ/F/5pXefH+A//+y/yCAAGZ4gIAA0hiAgATBSwD//90McIAB1BdQgAEhZACAADOlUA==
Date: Thu, 22 Dec 2011 02:44:18 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010BB252@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-5-git-send-email-b19537@freescale.com>
	<jcetai$4n1$5@dough.gmane.org>
	<CA452391058F6D4E9715FB2C29D9312A02CEB8@039-SN2MPN1-022.039d.mgd.msft.net>
	<44FD6890-C4DA-4A40-B30F-BDADC690C21E@dominion.thruhere.net>
	<20111216215455.GC28832@sakrah.homelinux.org>
	<CAPhnLPDSpXjAi+V9gjJCsrdoYez5CJWzv-+ejmDqm8P5mFu_Kw@mail.gmail.com>
	<CA452391058F6D4E9715FB2C29D9312A010B9F06@039-SN2MPN1-023.039d.mgd.msft.net>
	<CAPhnLPDpLHjNXG0gtr0fL1M_33bbxmQNPE5ZE_1xraN6=voikQ@mail.gmail.com>
In-Reply-To: <CAPhnLPDpLHjNXG0gtr0fL1M_33bbxmQNPE5ZE_1xraN6=voikQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 22 Dec 2011 02:51:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

May I know which license type should be put in the recipe?
LICENSE =3D "GPLv2+"
Or
LICENSE =3D "Netperf 4"


Best Regards,

Zhenhua

From: Flanagan, Elizabeth [mailto:elizabeth.flanagan@intel.com]
Sent: Thursday, December 22, 2011 1:38 AM
To: Luo Zhenhua-B19537
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH meta-oe 5/9] nerperf: add


On Tue, Dec 20, 2011 at 10:26 PM, Luo Zhenhua-B19537 <B19537@freescale.com<=
mailto:B19537@freescale.com>> wrote:
I have sent an email to netperf-feedback@netperf.org<mailto:netperf-feedbac=
k@netperf.org> to query the appropriate license type yesterday and not resp=
onse.

I'd like to adopt following option, does it make sense?
> > 2. We'll need to add a Netperf license to common-licenses and set LICEN=
SE =3D "Netperf"

Yes, I agree. Although the Netperf license isn't really compatible with any=
 OSI compliant license I know of and may cause end user problems. One optio=
n is to use Netperf 4 which is in fact GPL compliant. In that case it would=
 be licensed as LICENSE =3D "GPL-2.0+"

If netperf 4 was equivalent from a functional standpoint, I'd go consider r=
oute, as the Netperf 2.x.x license can be problematic for some end users, I=
'm sure.

-b

Best Regards,

Zhenhua


> -----Original Message-----
> From: Luo Zhenhua-B19537
> Sent: Tuesday, December 20, 2011 10:32 AM
> To: openembedded-devel@lists.openembedded.org<mailto:openembedded-devel@l=
ists.openembedded.org>
> Subject: RE: [oe] [PATCH meta-oe 5/9] nerperf: add
>
> Thanks for the feedback.
>
> I saw netperf is licensed under "netperf" in oe
> http://cgit.openembedded.org/openembedded/plain/recipes/netperf/netperf_2=
.4.4.bb.
>
> Anyway, I will send an email to the author to query about the license typ=
e.
>
>
> Best Regards,
>
> Zhenhua
>
> > -----Original Message-----
> > From: Flanagan, Elizabeth [mailto:elizabeth.flanagan@intel.com<mailto:e=
lizabeth.flanagan@intel.com>]
> > Sent: Tuesday, December 20, 2011 6:32 AM
> > To: openembedded-devel@lists.openembedded.org<mailto:openembedded-devel=
@lists.openembedded.org>; Luo Zhenhua-B19537
> > Subject: Re: [oe] [PATCH meta-oe 5/9] nerperf: add
> >
> > On Fri, Dec 16, 2011 at 1:54 PM, Khem Raj <raj.khem@gmail.com<mailto:ra=
j.khem@gmail.com>> wrote:
> > > On (16/12/11 10:22), Koen Kooi wrote:
> > >>
> > >> Op 16 dec. 2011, om 10:19 heeft Luo Zhenhua-B19537 het volgende gesc=
hreven:
> > >>
> > >> > Hello Koen,
> > >> >
> > >> >> -----Original Message-----
> > >> >> From: openembedded-devel-bounces@lists.openembedded.org<mailto:op=
enembedded-devel-bounces@lists.openembedded.org>
> > >> >> [mailto:openembedded-<mailto:openembedded-> devel-bounces@lists.o=
penembedded.org<mailto:devel-bounces@lists.openembedded.org>] On
> > >> >> Behalf Of Koen Kooi
> > >> >> Sent: Friday, December 16, 2011 3:52 PM
> > >> >>
> > >> >>> +++ b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb<http://=
netperf_2.4.4.bb> @@
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
> > >> >              Copyright (C) 1993 Hewlett-Packard Company
> > >> >                         ALL RIGHTS RESERVED.
> > >> >
> > >> >  The enclosed software and documentation includes copyrighted
> > >> > works
> > >> >  of Hewlett-Packard Co. For as long as you comply with the
> > >> > following
> > >> >  limitations, you are hereby authorized to (i) use, reproduce,
> > >> > and
> > >> >  modify the software and documentation, and to (ii) distribute
> > >> > the
> > >> >  software and documentation, including modifications, for
> > >> >  non-commercial purposes only.
> > >> >
> > >> >  1.  The enclosed software and documentation is made available at
> > >> > no
> > >> >      charge in order to advance the general development of
> > >> >      high-performance networking products.
> > >> >
> > >> >  2.  You may not delete any copyright notices contained in the
> > >> >      software or documentation. All hard copies, and copies in
> > >> >      source code or object code form, of the software or
> > >> >      documentation (including modifications) must contain at
> > >> > least
> > >> >      one of the copyright notices.
> > >> >
> > >> >  3.  The enclosed software and documentation has not been
> > >> > subjected
> > >> >      to testing and quality control and is not a Hewlett-Packard C=
o.
> > >> >      product. At a future time, Hewlett-Packard Co. may or may
> > >> > not
> > >> >      offer a version of the software and documentation as a produc=
t.
> > >> >
> > >> >  4.  THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
> > >> >      HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
> > >> >      REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE
> > >> > OR
> > >> >      DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUAL
> > >> >      PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
> > >> >      DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
> > >> >      EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
> > >> >      DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
> > >> >      MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
> > >> >
> > >> >  5.  HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR
> > >> > ANY
> > >> >      DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL
> > >> > DAMAGES
> > >> >      (INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
> > >> >      MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTATIO=
N.
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
> > >> Openembedded-devel@lists.openembedded.org<mailto:Openembedded-devel@=
lists.openembedded.org>
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
> > > Openembedded-devel@lists.openembedded.org<mailto:Openembedded-devel@l=
ists.openembedded.org>
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev
> > > el
> >
> >
> >
> > --
> > Elizabeth Flanagan
> > Yocto Project
> > Build and Release




--
Elizabeth Flanagan
Yocto Project
Build and Release

