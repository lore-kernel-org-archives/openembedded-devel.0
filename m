Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OHQrM-0007DS-5G
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 02:22:05 +0200
Received: by pwi5 with SMTP id 5so1434065pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 17:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GiGcepF/M7A3cb52znpgJ/bLhAM+NTis1X8aSmVlFq0=;
	b=BqWBwvCwX7u3XLckk4Ws3RYIxG5BVlc5g0KT6WrsfbcI41yMdiliv7Mf+z5zzcs8Np
	rBNWO1cnJJNa6NUxVbLB/GPU7+8UzZAJ/yz/Dc0L3pxyRS6kDJH8xYv8TqtbTaEnkb6M
	z0W0WVyTSPNUgU5v7pZowahESwwoAiV+9WyW0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CMNarRAAtRzQXarCw12tG1S1AIoUh0RwyIxpvOVYsRm23gtiTAJ+68QwvivRwnyoID
	s24EQL146G5wTgXSg1lEuCDioK/KAsU1JEjznNON9rVcGrfIvgyrRb1l+RotXjOCZ63I
	wEp0OFRoAvlubUyC2Ggtfz1l675HWqcFi0IU0=
MIME-Version: 1.0
Received: by 10.140.87.40 with SMTP id k40mr7238104rvb.251.1274919474479; Wed, 
	26 May 2010 17:17:54 -0700 (PDT)
Received: by 10.141.51.17 with HTTP; Wed, 26 May 2010 17:17:54 -0700 (PDT)
In-Reply-To: <20100526200901.GB10091@gmail.com>
References: <AANLkTikuptIZDURk9aJb5xqB22op3_cnR1OU7iQ0JfY0@mail.gmail.com>
	<hso7dv$2lh$1@dough.gmane.org>
	<AANLkTinzfd9OTFGIFxcCCdaxgXZ3lJm1OorWVxg0njNG@mail.gmail.com>
	<AANLkTimLcmTnl-zjJR9SVHRaX7GlKjhYT_IMiOy-eQtJ@mail.gmail.com>
	<20100526200901.GB10091@gmail.com>
Date: Wed, 26 May 2010 21:17:54 -0300
Message-ID: <AANLkTilpT2VyDEtNwqqNvvbJTWGw3EPCJAB0wsBXafuG@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add lksctp tools
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
X-List-Received-Date: Thu, 27 May 2010 00:22:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

>
> same as cgreen. but it builds. I get these warnings. Are they ok ?

Yes, they are. Thanks.

--=20
-----------------------------------------------------------
Jo=C3=A3o Henrique Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil
BSD051283
LPI 1
http://www.joaohfreitas.eti.br


