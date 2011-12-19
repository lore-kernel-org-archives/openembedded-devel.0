Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=AM1EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RcaEx-0002XK-OL
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Dec 2011 11:14:40 +0100
Received: from mail76-am1-R.bigfish.com (10.3.201.247) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.23; Mon, 19 Dec 2011 09:52:28 +0000
Received: from mail76-am1 (localhost [127.0.0.1])	by mail76-am1-R.bigfish.com
	(Postfix) with ESMTP id 01962500072;
	Sat, 12 May 2012 09:52:56 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I542M1432N41c5Nzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h944h286p)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail76-am1 (localhost.localdomain [127.0.0.1]) by mail76-am1
	(MessageSwitch) id 1336816375869612_30679;
	Sat, 12 May 2012 09:52:55 +0000 (UTC)
Received: from AM1EHSMHS005.bigfish.com (unknown [10.3.201.245])	by
	mail76-am1.bigfish.com (Postfix) with ESMTP id C5917480043;
	Sat, 12 May 2012 09:52:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS005.bigfish.com
	(10.3.207.105) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 19 Dec 2011 09:52:28 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Mon, 19 Dec 2011 03:52:21 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [PATCH meta-oe 5/9] nerperf: add
Thread-Index: AQHMu5uU0v7ifXEdrkurJWiJJ/F/5pXefH+A//+y/yCAAGZ4gIAA0hiAgAOHjOA=
Date: Mon, 19 Dec 2011 09:52:20 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010B90B0@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-5-git-send-email-b19537@freescale.com>
	<jcetai$4n1$5@dough.gmane.org>
	<CA452391058F6D4E9715FB2C29D9312A02CEB8@039-SN2MPN1-022.039d.mgd.msft.net>
	<44FD6890-C4DA-4A40-B30F-BDADC690C21E@dominion.thruhere.net>
	<20111216215455.GC28832@sakrah.homelinux.org>
In-Reply-To: <20111216215455.GC28832@sakrah.homelinux.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
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
X-List-Received-Date: Mon, 19 Dec 2011 10:14:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Khem,=20

> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Saturday, December 17, 2011 5:55 AM
> > >>
> > >>> +++ b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb @@ -0,0
> > >>> +++ +1,47
> > >>> @@ +DESCRIPTION=3D"Network performance benchmark including tests fo=
r
> > >>> TCP, UDP, sockets, ATM and more." +SECTION =3D "console/network"
> > >>> +HOMEPAGE =3D "http://www.netperf.org/" +LICENSE =3D "netperf"
> > >>
> > >> Can you include a comment on what type of license netperf is? MIT
> > >> like, BSD like, GPL like?
> > > [Luo Zhenhua-B19537] May I know which license type should be with fol=
lowing
> COPYING content?
> >
> > That looks like a BSD or MIT derivative, maybe Beth can give us some
> > guidance on what to use as LICENSE
>=20
> it says "for non-commercial purposes only"
[Luo Zhenhua-B19537] Does this message mean netperf can't be included in me=
ta-oe?

> > >
> > >              Copyright (C) 1993 Hewlett-Packard Company
> > >                         ALL RIGHTS RESERVED.
> > >
> > >  The enclosed software and documentation includes copyrighted works
> > > of Hewlett-Packard Co. For as long as you comply with the following
> > > limitations, you are hereby authorized to (i) use, reproduce, and
> > > modify the software and documentation, and to (ii) distribute the
> > > software and documentation, including modifications, for
> > > non-commercial purposes only.
> > >
> > >  1.  The enclosed software and documentation is made available at no
> > >      charge in order to advance the general development of
> > >      high-performance networking products.
> > >
> > >  2.  You may not delete any copyright notices contained in the
> > >      software or documentation. All hard copies, and copies in
> > >      source code or object code form, of the software or
> > >      documentation (including modifications) must contain at least
> > >      one of the copyright notices.
> > >
> > >  3.  The enclosed software and documentation has not been subjected
> > >      to testing and quality control and is not a Hewlett-Packard Co.
> > >      product. At a future time, Hewlett-Packard Co. may or may not
> > >      offer a version of the software and documentation as a product.
> > >
> > >  4.  THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
> > >      HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
> > >      REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE OR
> > >      DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUAL
> > >      PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
> > >      DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
> > >      EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
> > >      DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
> > >      MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
> > >
> > >  5.  HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR ANY
> > >      DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
> > >      (INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
> > >      MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTATION.


Best Regards,

Zhenhua



