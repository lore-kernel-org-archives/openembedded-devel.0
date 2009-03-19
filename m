Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LkLkA-0004gm-HX
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 18:09:22 +0100
Received: from andromeda.vanille.de (e180149050.adsl.alicedsl.de
	[85.180.149.50])
	by drlauer-research.com (Postfix) with ESMTP id 202B85843DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2009 18:34:22 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Mar 2009 18:08:23 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.27-11-generic; KDE/4.2.0; x86_64; ; )
References: <200903051232.09899.marcin@juszkiewicz.com.pl>
	<200903191751.28927.marcin@juszkiewicz.com.pl>
In-Reply-To: <200903191751.28927.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <200903191808.23689.mickey@vanille-media.de>
Subject: Re: [PATCH] gtk+: make 2.14.2 default version instead of 2.10.14
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
X-List-Received-Date: Thu, 19 Mar 2009 17:09:22 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 19 March 2009 17:51:28 Marcin Juszkiewicz wrote:
> Dnia czwartek, 5 marca 2009 o 12:32:07 Marcin Juszkiewicz napisa=C5=82(a):
> > commit 67d5b4c8f0283225eab0408099d0d3cf440c0fd0
> > Author: Marcin Juszkiewicz <hrw@openembedded.org>
> > Date: =C2=A0 Thu Mar 5 11:03:13 2009 +0100
> >
> > =C2=A0 =C2=A0 gtk+: make 2.14.2 default version instead of 2.10.14
> >
> > =C2=A0 =C2=A0 =C3=85ngstr=C3=B6m uses this version and many components =
of metadata
> > depends on at least 2.12.
>
> No one objects?

I think we can safely dump some of these old Gtk+ versions. The only reason=
=20
some of us stayed so long on 2.6 was the performance, with the optimized=20
patches 2.10 was ok, so unless there are performance regressions in later=20
versions, I don't think anyone will object. Same goes for glib btw., 2.18 h=
as=20
proven to be solid for quite a while.

Cheers,
=2D-=20
:M:



