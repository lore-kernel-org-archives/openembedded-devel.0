Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NpkoA-0002JL-Gr
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 17:00:23 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NpklH-0006Og-Js from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 07:57:23 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 11 Mar 2010 07:57:23 -0800
Received: from 172.30.33.172 ([172.30.33.172]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu, 11 Mar 2010 15:56:35 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	11 Mar 2010 08:56:32 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11003102359n42d2e94yf56b05a39decb4fd@mail.gmail.com>
References: <DB561678F08F554EB0D9F21B70E268A505AE79@exchange.intern.dresearch.de>
	<4B97C28F.2020609@dresearch.de>
	<d1ded4381003100919y125959b5m3198c8d848661187@mail.gmail.com>
	<1268246120.14566.1078.camel@mill.internal.reciva.com>
	<1268248565.16526.231.camel@trini-m4400> <4B9894F4.5@dresearch.de>
	<ac9c93b11003102359n42d2e94yf56b05a39decb4fd@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Thu, 11 Mar 2010 08:56:32 -0700
Message-ID: <1268322992.16526.266.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 11 Mar 2010 15:57:23.0043 (UTC)
	FILETIME=[89A78330:01CAC133]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Where are my patches?
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
X-List-Received-Date: Thu, 11 Mar 2010 16:00:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-03-11 at 08:59 +0100, Frans Meulenbroeks wrote:
> 2010/3/11 Steffen Sledz <sledz@dresearch.de>:
> > Tom Rini wrote:
> >>> If your patches are reaching the list then it is probably nothing wit=
hin
> >>> your control.  I think some folks have had trouble with patchwork's s=
pam
> >>> filtering in the past.
> >>>
> >>> In any case, it isn't necessary for your patch to appear in patchwork=
 in
> >>> order for it to be actioned, so there is no need to worry about it to=
o
> >>> much.
> >
> > That's clear. But when i create a patch suggestion outside my area of
> > knowledge which needs some discussion and may be some updates it
> > would be very helpful to do this within patchwork.
> >
> >> There is for people without write access.
> >
> > Do you say that patches from people with write access generally do not
> > go to the patch queue?
>=20
> They also go to the patch queue.
> What Tom probably wanted to say is that most people with write access
> commit the change themselves (unless it is a patch that affects core
> functionality)

Right.  But even then, I've re-grabbed my own patches from patchwork
just to get the Acked-by lines (since frequently I make the change, git
diff > t, insert 't' into my email and put the desc there).

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


