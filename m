Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=DB3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RbUI8-0000jT-L6
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 10:41:24 +0100
Received: from mail82-db3-R.bigfish.com (10.3.81.251) by
	DB3EHSOBE003.bigfish.com (10.3.84.23) with Microsoft SMTP Server id
	14.1.225.23; Fri, 16 Dec 2011 09:19:11 +0000
Received: from mail82-db3 (localhost [127.0.0.1])	by mail82-db3-R.bigfish.com
	(Postfix) with ESMTP id CA42EA03E6;
	Fri, 16 Dec 2011 09:19:19 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371I542M1432Nzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h944h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail82-db3 (localhost.localdomain [127.0.0.1]) by mail82-db3
	(MessageSwitch) id 1324027159690170_10467;
	Fri, 16 Dec 2011 09:19:19 +0000 (UTC)
Received: from DB3EHSMHS015.bigfish.com (unknown [10.3.81.243])	by
	mail82-db3.bigfish.com (Postfix) with ESMTP id 3E65DC006B;
	Fri, 16 Dec 2011 09:19:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS015.bigfish.com
	(10.3.87.115) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 16 Dec 2011 09:19:09 +0000
Received: from 039-SN2MPN1-022.039d.mgd.msft.net ([169.254.2.68]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Fri, 16 Dec 2011 03:19:08 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>
Thread-Topic: [oe] [PATCH meta-oe 5/9] nerperf: add
Thread-Index: AQHMu5uU0v7ifXEdrkurJWiJJ/F/5pXefH+A//+y/yA=
Date: Fri, 16 Dec 2011 09:19:08 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A02CEB8@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-5-git-send-email-b19537@freescale.com>
	<jcetai$4n1$5@dough.gmane.org>
In-Reply-To: <jcetai$4n1$5@dough.gmane.org>
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
X-List-Received-Date: Fri, 16 Dec 2011 09:41:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Koen,=20

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-
> devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
> Sent: Friday, December 16, 2011 3:52 PM
>=20
> > +++ b/meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb @@ -0,0 +1,47
> > @@ +DESCRIPTION=3D"Network performance benchmark including tests for
> > TCP, UDP, sockets, ATM and more." +SECTION =3D "console/network"
> > +HOMEPAGE =3D "http://www.netperf.org/" +LICENSE =3D "netperf"
>=20
> Can you include a comment on what type of license netperf is? MIT like, B=
SD like,
> GPL like?
[Luo Zhenhua-B19537] May I know which license type should be with following=
 COPYING content?

              Copyright (C) 1993 Hewlett-Packard Company
                         ALL RIGHTS RESERVED.
=20
  The enclosed software and documentation includes copyrighted works
  of Hewlett-Packard Co. For as long as you comply with the following
  limitations, you are hereby authorized to (i) use, reproduce, and
  modify the software and documentation, and to (ii) distribute the
  software and documentation, including modifications, for
  non-commercial purposes only.
     =20
  1.  The enclosed software and documentation is made available at no
      charge in order to advance the general development of
      high-performance networking products.
=20
  2.  You may not delete any copyright notices contained in the
      software or documentation. All hard copies, and copies in
      source code or object code form, of the software or
      documentation (including modifications) must contain at least
      one of the copyright notices.
=20
  3.  The enclosed software and documentation has not been subjected
      to testing and quality control and is not a Hewlett-Packard Co.
      product. At a future time, Hewlett-Packard Co. may or may not
      offer a version of the software and documentation as a product.
 =20
  4.  THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
      HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
      REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE OR
      DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUAL
      PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
      DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
      EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
      DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
      MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 =20
  5.  HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR ANY
      DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
      (INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
      MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTATION.


Best Regards,

Zhenhua



