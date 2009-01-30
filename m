Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LSoC0-0001QW-KR
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jan 2009 08:53:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id B2AA42C8F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2009 07:45:24 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlcRWRTi-g-9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2009 07:45:23 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id 120912C8A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2009 07:45:22 +0000 (UTC)
Message-ID: <4982B02D.2030109@gmail.com>
Date: Fri, 30 Jan 2009 08:45:49 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1233274325.4147.72.camel@elrond.atmel.com>
In-Reply-To: <1233274325.4147.72.camel@elrond.atmel.com>
Subject: Re: Review of ulf/atmel branch
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
X-List-Received-Date: Fri, 30 Jan 2009 07:53:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ulf Samuelsson ha scritto:
> Myybe someone can look into this.
>=20
> I have added=20
>=20
> * at91bootstrap-2.10
> * u-boot-2009.01
> * linux-2.6.28.2
>=20
> focusing on at91sam9263ek
>=20
> at91bootstrap is my own version of the
> official at91bootstrap-1.11 from Atmel
> A key difference is that at91bootstrap can
> now be configured using Kconfig.
>=20
> U-Boot has some extra patches, including at91sam9g20
> It also fixed a problem with AVR32.
> Due to a miss, a patch was not pulled from Haavards
> git, so 2009.01 is broken for all AVR32 withotu this patch.
>=20
> linux-2.6.28.2 has the Atmel 2.6.27 patches
> forward ported to 2.6.28.2.
>=20
> Stuff builds, but I have only tested
> a few of the multiple combinations
> on real H/W.
>=20
> Hope to start adding the latest 2.6.27 patchees for AVR32 as well
> but time is short...
>=20
> BR
> Ulf Samuelsson

I'll test them on my hardware.
Thank you

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com


