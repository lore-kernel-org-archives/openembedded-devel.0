Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RXzuP-0008DP-R9
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 19:38:30 +0100
Received: from mail114-ch1-R.bigfish.com (10.43.68.250) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.23; Tue, 6 Dec 2011 17:46:13 +0000
Received: from mail114-ch1 (localhost [127.0.0.1])	by
	mail114-ch1-R.bigfish.com (Postfix) with ESMTP id CC25768032C	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2011 17:46:12 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzzz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail114-ch1 (localhost.localdomain [127.0.0.1]) by mail114-ch1
	(MessageSwitch) id 1323193572762674_8354;
	Tue,  6 Dec 2011 17:46:12 +0000 (UTC)
Received: from CH1EHSMHS025.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.243])	by mail114-ch1.bigfish.com (Postfix) with ESMTP id
	AB070100268	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2011 17:46:12 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS025.bigfish.com
	(10.43.70.25) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 6 Dec 2011 17:46:08 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Tue, 6 Dec 2011 11:46:07 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [Beagleboard] Can't fetch Linux kernel source
Thread-Index: AQHMs7b/oKXflZBIM0mWAEahGn7/vA==
Date: Tue, 6 Dec 2011 17:46:06 +0000
Message-ID: <CAEsOVNcPr4kFVaMrJ_fcBC6GYb0Ehfwm0=0eEHKjQOS=u=rZdw@mail.gmail.com>
References: <w4liqqva4t.wl%peter@chubb.wattle.id.au>
	<CAEsOVNc01R2rsw9zv1vNtVed5VhB+Ext0b7CfVCzToksac6g_Q@mail.gmail.com>
	<w439cyavwe.wl%peter@chubb.wattle.id.au>
In-Reply-To: <w439cyavwe.wl%peter@chubb.wattle.id.au>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [Beagleboard] Can't fetch Linux kernel source
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
X-List-Received-Date: Tue, 06 Dec 2011 18:38:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CE2EC236D1BD3E40BE11E21629A5CF65@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 6, 2011 at 3:31 AM, Peter Chubb <peter.chubb@nicta.com.au> wrot=
e:
> McClintock> Do those tags still exists upstream?
>
> Yes.
>
> In fact, if I clone from the upstream into ${OE_BASE}/downloads/git2/
> the recipe works. =A0It's only if git2 starts off empty or non-existent
> that do_fetch() fails.

Are you behind a proxy? Keep in mind the fetcher within OE overrides
all local settings.

-M=



