Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1Ppoml-0008WP-AV for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 22:19:43 +0100
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 6B7DD188A17E;
	Wed, 16 Feb 2011 22:10:30 +0100 (CET)
X-Auth-Info: HZZSlJgQV/tZnR4jWKJr9jaD085UVMawAm2S9Zj7u2Q=
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 5A3731C0019C;
	Wed, 16 Feb 2011 22:10:30 +0100 (CET)
Received: from gemini.denx.de (unknown [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 421DD3096C20;
	Wed, 16 Feb 2011 22:10:30 +0100 (CET)
Received: from gemini.denx.de (localhost.localdomain [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id 2CF731539C5;
	Wed, 16 Feb 2011 22:10:30 +0100 (CET)
To: "Sledz, Steffen" <sledz@dresearch.de>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <DB561678F08F554EB0D9F21B70E268A505AFA8@exchange.intern.dresearch.de>
References: <DB561678F08F554EB0D9F21B70E268A5056575@exchange.intern.dresearch.de>
	<20110216183403.763A31539C5@gemini.denx.de>
	<DB561678F08F554EB0D9F21B70E268A505AFA8@exchange.intern.dresearch.de>
Comments: In-reply-to "Sledz, Steffen" <sledz@dresearch.de>
	message dated "Wed, 16 Feb 2011 21:19:04 +0100."
Date: Wed, 16 Feb 2011 22:10:30 +0100
Message-Id: <20110216211030.2CF731539C5@gemini.denx.de>
Cc: "Schuknecht, Mario" <m.schuknecht@DResearch.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] u-boot-2009.03: Fix sector table direction for AMIC (hipox machine only)
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
X-List-Received-Date: Wed, 16 Feb 2011 21:19:43 -0000
Content-type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Dear "Sledz, Steffen",

In message <DB561678F08F554EB0D9F21B70E268A505AFA8@exchange.intern.dresea=
rch.de> you wrote:
>
> > No, it has NOT been applied in mainline yet.
> > See http://patchwork.ozlabs.org/patch/82763/ - status is still NEW.
>=20
> Your right. I'm sure that Mario meant "suggested" instead of "applied".
>=20
> BTW@Wolfgang: Any chance that it will be applied? We had no feedback
> (good or bad) in the u-boot ml for nearly a week.

No news is usually good news.

It would have been a good idea to Cc: the responsible maintainer,
though.

Best regards,

Wolfgang Denk

--=20
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
The thing is, as you progress in the Craft,  you'll  learn  there  is
another rule... When you break rules, break 'em good and hard.
                                    - Terry Pratchett, _Wyrd Sisters_


