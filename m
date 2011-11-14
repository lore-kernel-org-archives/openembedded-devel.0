Received: from mail-am1.bigfish.com ([213.199.180.138]
	helo=AM1EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RQ1zN-0005zv-08
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 20:14:41 +0100
Received: from mail9-am1-R.bigfish.com (10.3.201.244) by
	AM1EHSOBE001.bigfish.com (10.3.204.21) with Microsoft SMTP Server id
	14.1.225.22; Mon, 14 Nov 2011 19:07:46 +0000
Received: from mail9-am1 (localhost [127.0.0.1])	by mail9-am1-R.bigfish.com
	(Postfix) with ESMTP id A909B6403C1	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 19:07:16 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail9-am1 (localhost.localdomain [127.0.0.1]) by mail9-am1
	(MessageSwitch) id 1321297636627769_28507;
	Mon, 14 Nov 2011 19:07:16 +0000 (UTC)
Received: from AM1EHSMHS004.bigfish.com (unknown [10.3.201.241])	by
	mail9-am1.bigfish.com (Postfix) with ESMTP id 89CD75C0042	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 19:07:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS004.bigfish.com
	(10.3.207.104) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 14 Nov 2011 19:07:45 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Mon, 14 Nov 2011 13:08:14 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] GCC Error
Thread-Index: AQHMov+P3c/H1X3ltEmCHoq9Qg2a8A==
Date: Mon, 14 Nov 2011 19:08:14 +0000
Message-ID: <CAEsOVNdtanuSxeyMew2Dvt6-nULXWiE1tCsc-nSs71AsH_5jYg@mail.gmail.com>
References: <CALJpqJz0x63nDkXuJe3Xp9k014gyaMnONpFUWtds5VNCUrTnrA@mail.gmail.com>
	<CAEsOVNf_5HnBQHuJpuOrAXJQDhhoM7kAF5L56bCF=fBFeOjxyA@mail.gmail.com>
	<CALJpqJwzNbcvmHbSZiy2Be5-akzkOpaZucaHa_0vMDsPYn7=MA@mail.gmail.com>
In-Reply-To: <CALJpqJwzNbcvmHbSZiy2Be5-akzkOpaZucaHa_0vMDsPYn7=MA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: GCC Error
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
X-List-Received-Date: Mon, 14 Nov 2011 19:14:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BD94DCDC8CB036438F2B176755604EFD@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2011 at 1:06 PM, David Thomas
<david.thomas@microbee-systems.com> wrote:
> 1) Fixing the (potential) errors in the source code
>
> Since I pulled this from Angstrom are you saying there is a error in
> the sources I need to hunt down??

It's a new build warning, it's something GCC is saying could be an
issue. It's probably not in Angstrom but rather in the source of a
package Angstrom is building.

-M=



