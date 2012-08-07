Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SyoO4-0001Q1-La
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 20:20:12 +0200
Received: from mail56-ch1-R.bigfish.com (10.43.68.245) by
	CH1EHSOBE005.bigfish.com (10.43.70.55) with Microsoft SMTP Server id
	14.1.225.23; Tue, 7 Aug 2012 17:53:19 +0000
Received: from mail56-ch1 (localhost [127.0.0.1])	by mail56-ch1-R.bigfish.com
	(Postfix) with ESMTP id 585803000DD	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  7 Aug 2012 17:53:19 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -10
X-BigFish: VS-10(zz98dI154cP9371I1432Izz1202hzz8275ch8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail56-ch1 (localhost.localdomain [127.0.0.1]) by mail56-ch1
	(MessageSwitch) id 1344361997252753_20214;
	Tue,  7 Aug 2012 17:53:17 +0000 (UTC)
Received: from CH1EHSMHS028.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.252])	by mail56-ch1.bigfish.com (Postfix) with ESMTP id
	3BDF33801BD for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Aug 2012 17:53:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS028.bigfish.com
	(10.43.70.28) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 7 Aug 2012 17:53:15 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Tue, 7 Aug 2012 12:53:15 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] meta-openembedded patch queue
Thread-Index: AQHNdMWEKDuQskuQ1Ue8oLnJbMgMLw==
Date: Tue, 7 Aug 2012 17:53:14 +0000
Message-ID: <CAEsOVNc1onWY2n27Gk8O-H5NsKq_yUARxo9NXPuGdZQToR9mTw@mail.gmail.com>
References: <jvqqs2$tn3$1@dough.gmane.org>
In-Reply-To: <jvqqs2$tn3$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: meta-openembedded patch queue
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
X-List-Received-Date: Tue, 07 Aug 2012 18:20:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5030A671DADA914FAE8BB0E18E6B818C@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 7, 2012 at 5:32 AM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> I've applied a bunch of patches and hopefully commented on all the ones I
> didn't apply. I also cleared the meta-oe patchwork so it's nice and empty
> now: http://patchwork.openembedded.org/project/oe/list/?q=3Dmeta-oe
>
> If your patch hasn't been applied yet into meta-openembedded master and i=
s
> lacking comments, please resubmit it as [meta-oe][PATCH v(N+1)] (substitu=
te
> N please).
>
> There are a few big deadlines coming up at work, so everything will have =
a
> few days of delay but if you haven't seen any feedback after a week and t=
he
> patch is still sitting in patchwork, please send a reminder. Replying to =
the
> patch with 'ping' is usually enough and most people know where to find me=
 on
> IRC.

I have this:

http://patchwork.openembedded.org/patch/32957/

-M

>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFQIO7TMkyGM64RGpERAqLPAKCK1fvuntGQiTzIPl1f+gbk7cMAhACfe388
> s978d0X19zmfwZ84oal2Ypg=3D
> =3DFdbg
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



