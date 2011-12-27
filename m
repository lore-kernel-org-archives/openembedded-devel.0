Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
	helo=AM1EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RfScT-0006fo-4w
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Dec 2011 09:42:49 +0100
Received: from mail72-am1-R.bigfish.com (10.3.201.247) by
	AM1EHSOBE001.bigfish.com (10.3.204.21) with Microsoft SMTP Server id
	14.1.225.23; Tue, 27 Dec 2011 08:20:13 +0000
Received: from mail72-am1 (localhost [127.0.0.1])	by mail72-am1-R.bigfish.com
	(Postfix) with ESMTP id 9185170018E	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 27 Dec 2011 08:19:47 +0000 (UTC)
X-SpamScore: -16
X-BigFish: VS-16(z98bRz9371I542M1432Nzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h944hbe9n)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail72-am1 (localhost.localdomain [127.0.0.1]) by mail72-am1
	(MessageSwitch) id 1324973987510448_19949;
	Tue, 27 Dec 2011 08:19:47 +0000 (UTC)
Received: from AM1EHSMHS008.bigfish.com (unknown [10.3.201.245])	by
	mail72-am1.bigfish.com (Postfix) with ESMTP id 7838F520045	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 27 Dec 2011 08:19:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS008.bigfish.com
	(10.3.207.108) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 27 Dec 2011 08:20:13 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Tue, 27 Dec 2011 02:20:30 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH v4 meta-oe] xfsprogs: add version 3.1.7
Thread-Index: AQHMwTuOrwEuxikpB0q2AenrxTzNo5Xrst6AgAOqUKA=
Date: Tue, 27 Dec 2011 08:20:30 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010BCE4E@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1324621680-32025-1-git-send-email-b19537@freescale.com>
	<jd550r$uov$1@dough.gmane.org>
In-Reply-To: <jd550r$uov$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v4 meta-oe] xfsprogs: add version 3.1.7
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
X-List-Received-Date: Tue, 27 Dec 2011 08:42:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-
> devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
> Sent: Sunday, December 25, 2011 2:18 AM
>=20
> ../../install-sh -o koen -g koen -m 644 -T so_dot_version libhandle.lai
> /lib; ../../install-sh -o koen -g koen -T so_dot_current libhandle.lai /l=
ib
> | id: koen: No such user
> | id: koen: No such user
> | id: koen: No such user
> | id: koen: No such user
> | id: koen: No such user
> | id: koen: No such user
> | Installing libdisk-install
> | make[1]: Nothing to be done for `install'.
> | Installing copy-install
> | ../install-sh -o koen -g koen -m 755 -d /usr/sbin
> | id: koen: No such user
> | id: koen: No such user
> | make[1]: *** [install] Error 255
> | make: *** [copy-install] Error 2
> | + die 'oe_runmake failed'
> | + bbfatal 'oe_runmake failed'
> | + echo 'ERROR: oe_runmake failed'
> | ERROR: oe_runmake failed
> | + exit 1
> NOTE: package xfsprogs-3.1.7-r0: task do_install: Failed
>=20
> The whole 'install as user' idea is flawed, so I'd recommend to patch it =
out
[Luo Zhenhua-B19537] Makes sense.=20


Best Regards,

Zhenhua



