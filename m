Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RVoMB-0005oF-5w
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 18:54:07 +0100
Received: from mail159-ch1-R.bigfish.com (10.43.68.252) by
	CH1EHSOBE013.bigfish.com (10.43.70.63) with Microsoft SMTP Server id
	14.1.225.22; Wed, 30 Nov 2011 17:32:20 +0000
Received: from mail159-ch1 (localhost [127.0.0.1])	by
	mail159-ch1-R.bigfish.com (Postfix) with ESMTP id 7C3623C03D7	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 17:32:20 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail159-ch1 (localhost.localdomain [127.0.0.1]) by mail159-ch1
	(MessageSwitch) id 1322674340417813_12997;
	Wed, 30 Nov 2011 17:32:20 +0000 (UTC)
Received: from CH1EHSMHS007.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.252])	by mail159-ch1.bigfish.com (Postfix) with ESMTP id
	629695E023E	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 17:32:20 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS007.bigfish.com
	(10.43.70.7) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 30 Nov 2011 17:32:19 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Wed, 30 Nov 2011 11:32:20 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Documentation problems
Thread-Index: AQHMr4YClcehpXuk3kGY20i9IKjvGw==
Date: Wed, 30 Nov 2011 17:32:19 +0000
Message-ID: <CAEsOVNfSkvOuLOMYb2c0EsihyHztXKccmZ39zHu1eAbp93Crgw@mail.gmail.com>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<4ED6507D.4090007@ts.fujitsu.com>
In-Reply-To: <4ED6507D.4090007@ts.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Documentation problems
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
X-List-Received-Date: Wed, 30 Nov 2011 17:54:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <73585DAADAA56C409DB9A80F2C6CE749@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2011 at 9:49 AM, Rainer Koenig
<Rainer.Koenig@ts.fujitsu.com> wrote:
> Seriously guys, if you are a developer and you are able to understand the
> structure in OE and what bitbake does, then you should be able to underst=
and
> the Wikimedia engine as well. And if you want to avoid a web-editor then
> copy/paste the stuff to your favorite editor and do it there. Complaining
> about the tool you need to use sounds like a lame excuse for an software
> engineer.
>
> Of course, the Wikimedia engine offers advanced methods like categories t=
o
> tag stuff but even that can be learned in short time. So I really doubt t=
hat
> the reason for not documenting is the Mediawiki engine.
>
> The other problem that I see when trying to contribute: This morning I
> registered my account "rakoenig". Now, 7 hours later I'm still not able t=
o
> edit anything and I have no idea how the process looks like to get write
> privileges. On the other hand, when I was doing the same in the Yocto wik=
i I
> was instantly able to write pages there.

Just a small rant here.

I won't use the Wiki because I don't know what is out of date or not.
We need documentation in the git repo it's documenting. That way we
know the documentation was valid when it was committed and we can
verify such things.

The wiki/webpage should just reference stuff in the GIT repo.

-M=



