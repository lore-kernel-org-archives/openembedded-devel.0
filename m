Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P2maH-0008Ak-EU
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 17:04:12 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 83D9C491286
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Oct 2010 17:03:50 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 4 Oct 2010 17:03:50 +0200
Message-ID: <4CA9ECD6.8090203@dresearch.de>
Date: Mon, 04 Oct 2010 17:03:50 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.9) Gecko/20100915 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <i8cf7aMAN_POSIXLY_CORRECT=1@dough.gmane.org>	<1286194192-22256-1-git-send-email-sledz@dresearch.de>	<i8cjiv$806$1@dough.gmane.org>
	<4CA9D3A0.8080706@dresearch.de>
	<1286202766.3770.17.camel@mill.internal.reciva.com>
In-Reply-To: <1286202766.3770.17.camel@mill.internal.reciva.com>
X-OriginalArrivalTime: 04 Oct 2010 15:03:50.0423 (UTC)
	FILETIME=[5A4ADA70:01CB63D5]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v4] epiphany-2.30.2: unbreak build by adding ca-certificates dependencies
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
X-List-Received-Date: Mon, 04 Oct 2010 15:04:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 04.10.2010 16:32, schrieb Phil Blundell:
> On Mon, 2010-10-04 at 15:16 +0200, Steffen Sledz wrote:
>> Am 04.10.2010 15:07, schrieb Koen Kooi:
>>> To double check: is it gplv2 or gplv2+ (aka "or later"?)
>>
>> No really sure. The source tree contains a COPYING file containing "GN=
U GENERAL PUBLIC LICENSE Version 2, June 1991".
>>
>> So it's "GPLv2" or "GPLv2+"?
>=20
> The COPYING file isn't what you want to be looking at, really.  That
> will just be a copy of one particular version of the GPL and doesn't
> necessarily mean that the package can't be distributed under other
> licenses.
>=20
> According to the copyright file from Debian's epiphany-browser package,
> it's GPLv2+.  Specifically:
> ...

OK, pushed with LICENSE =3D "GPLv2+"

--=20
Steffen Sledz
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str.3, D-10319 Berlin, Germany
Tel: +49 (30) 515932237 mailto:sledz@DResearch.DE
Fax: +49 (30) 515932299 http://www.DResearch.DE
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 54412;
Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642



