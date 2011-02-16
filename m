Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PpnrG-0005gE-0w
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 21:20:18 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 88ACF491283;
	Wed, 16 Feb 2011 21:19:06 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
Received: from 192.168.32.8 ([192.168.32.8]) by exchange.intern.dresearch.de
	([192.168.32.16]) with Microsoft Exchange Server HTTP-DAV ;
	Wed, 16 Feb 2011 20:19:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; de;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
Date: Wed, 16 Feb 2011 21:19:04 +0100
Message-ID: <DB561678F08F554EB0D9F21B70E268A505AFA8@exchange.intern.dresearch.de>
In-Reply-To: <20110216183403.763A31539C5@gemini.denx.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH] u-boot-2009.03: Fix sector table direction for	AMIC
	(hipox machine only)
Thread-Index: AcvOFsL2QDisNaXhRuKa9SuBTS+0nQ==
References: <DB561678F08F554EB0D9F21B70E268A5056575@exchange.intern.dresearch.de>
	<20110216183403.763A31539C5@gemini.denx.de>
From: "Sledz, Steffen" <sledz@dresearch.de>
To: <openembedded-devel@lists.openembedded.org>
Cc: "Schuknecht, Mario" <m.schuknecht@DResearch.de>
Subject: Re: [PATCH] u-boot-2009.03: Fix sector table direction for	AMIC (hipox machine only)
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
X-List-Received-Date: Wed, 16 Feb 2011 20:20:18 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message

Am 16.02.2011 19:34, schrieb Wolfgang Denk:
> Dear "Schuknecht, Mario",
>=20
> In message =
<DB561678F08F554EB0D9F21B70E268A5056575@exchange.intern.dresearch.de> =
you wrote:
>>
>>> Has this fix been applied upstream yet? What uBoot versions are
>>> affected?
>>
>> Yes, the fix has been applied
>> <http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/94465>.
>=20
> No, it has NOT been applied in mainline yet.
> See http://patchwork.ozlabs.org/patch/82763/ - status is still NEW.

Your right. I'm sure that Mario meant "suggested" instead of "applied".

BTW@Wolfgang: Any chance that it will be applied? We had no feedback =
(good or bad) in the u-boot ml for nearly a week.

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


