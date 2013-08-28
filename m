Return-Path: <B19537@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe005.messaging.microsoft.com [216.32.180.188])
	by mail.openembedded.org (Postfix) with ESMTP id 85B116B988
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 05:21:29 +0000 (UTC)
Received: from mail63-co1-R.bigfish.com (10.243.78.252) by
	CO1EHSOBE039.bigfish.com (10.243.66.104) with Microsoft SMTP Server id
	14.1.225.22; Wed, 28 Aug 2013 05:21:28 +0000
Received: from mail63-co1 (localhost [127.0.0.1])	by mail63-co1-R.bigfish.com
	(Postfix) with ESMTP id D604324008F	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 05:21:28 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI542I1432Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h8275bh8275dh1de097hz2dh2a8h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5hbe9i1155h)
Received: from mail63-co1 (localhost.localdomain [127.0.0.1]) by mail63-co1
	(MessageSwitch) id 1377667286827250_11328;
	Wed, 28 Aug 2013 05:21:26 +0000 (UTC)
Received: from CO1EHSMHS025.bigfish.com (unknown [10.243.78.241])	by
	mail63-co1.bigfish.com (Postfix) with ESMTP id C105EB40041	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 05:21:26 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS025.bigfish.com
	(10.243.66.35) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 28 Aug 2013 05:21:26 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.40]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.03.0146.002; Wed, 28 Aug 2013 05:21:25 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH ] libhugetlbfs: add recipe
Thread-Index: AQHOovnWqhmtF+sp3Eu4ooAnXC5dupmosOaAgAE9FwCAACJKgIAABf/g
Date: Wed, 28 Aug 2013 05:21:24 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A016C2499@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1377589711-14948-1-git-send-email-b40290@freescale.com>
	<CAGNsrLC=F+urFnDux=ZB1RSez3jF7err6KEqV3zcBj_x6pXEqA@mail.gmail.com>
	<CA452391058F6D4E9715FB2C29D9312A016BC265@039-SN2MPN1-023.039d.mgd.msft.net>
	<CAGNsrLC9ZP5seQjwsvb=Py0QE6-fVy8FnRSV7NWxwz9bAS+EUA@mail.gmail.com>
In-Reply-To: <CAGNsrLC9ZP5seQjwsvb=Py0QE6-fVy8FnRSV7NWxwz9bAS+EUA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.84]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: Re: [meta-oe][PATCH ] libhugetlbfs: add recipe
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
X-List-Received-Date: Wed, 28 Aug 2013 05:21:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Fathi Boudra
>=20
> On 28 August 2013 05:56, Luo Zhenhua-B19537 <B19537@freescale.com> wrote:
> > Hi,
> >
> > libhugetlbfs should be moved to a common layer, since it can be used by
> other BSPs
>=20
> agreed.
>=20
> > except linaro.
>=20
> what do you mean by "except Linaro"?
[Luo Zhenhua-B19537] I mean libhugetlbfs recipe is maintained in meta-linar=
o layer.=20


Best Regards,

Zhenhua


