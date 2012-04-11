Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SI12l-0000DC-CR
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 19:09:19 +0200
Received: from mail90-am1-R.bigfish.com (10.3.201.230) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.23; Wed, 11 Apr 2012 15:59:44 +0000
Received: from mail90-am1 (localhost [127.0.0.1])	by mail90-am1-R.bigfish.com
	(Postfix) with ESMTP id 5FD53100154	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 15:59:44 +0000 (UTC)
X-SpamScore: -9
X-BigFish: VS-9(zz9371I1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail90-am1 (localhost.localdomain [127.0.0.1]) by mail90-am1
	(MessageSwitch) id 1334159982492121_10928;
	Wed, 11 Apr 2012 15:59:42 +0000 (UTC)
Received: from AM1EHSMHS018.bigfish.com (unknown [10.3.201.249])	by
	mail90-am1.bigfish.com (Postfix) with ESMTP id 6AA1E800C9	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 15:59:42 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS018.bigfish.com
	(10.3.206.21) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 11 Apr 2012 15:59:40 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.132]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Wed, 11 Apr 2012 10:59:06 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] meta-linaro and toolchain-layer
Thread-Index: AQHNF/wG600CN+HuV0yC5ojzSKHbxw==
Date: Wed, 11 Apr 2012 15:59:06 +0000
Message-ID: <CAEsOVNdvazASp=afD+2mk+6Jw3qE_efF2T5ojys8ox5nzDYV+A@mail.gmail.com>
References: <4F80ACD6.8080901@gmail.com>
In-Reply-To: <4F80ACD6.8080901@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: meta-linaro and toolchain-layer
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
X-List-Received-Date: Wed, 11 Apr 2012 17:09:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6310636EE5EF7349BFD5C6931BB8DD15@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 7, 2012 at 4:08 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> Use gcc-4.6 from meta-linaro and retire it from toolchain-layer
> which means toolchain layer only has gcc-4.5 and eventually
> This also means that we don't move gcc-4.6 into toolchain-layer
> when its relegated from OE-Core

What is the harm in saving off the 4.6 toolchain recipes off in a
layer that we other users could later add back in if they needed it? I
for see issues where folks will insist on using the same toolchain
they have been using for years to come.

-M=



