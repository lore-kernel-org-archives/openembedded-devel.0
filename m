Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1PaRuT-0002qj-HH
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 12:52:09 +0100
Received: (qmail 24684 invoked by uid 2404007); 5 Jan 2011 11:51:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89-73-120-20.dynamic.chello.pl (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@89.73.120.20)
	by host4.kei.pl with ESMTPA; 5 Jan 2011 11:51:47 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 5 Jan 2011 12:52:07 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.37-11-generic; KDE/4.5.90; x86_64; ; )
References: <AANLkTink9h1dkjww1+Vi3arnTagSF2yCwygSHnPLcTdU@mail.gmail.com>
In-Reply-To: <AANLkTink9h1dkjww1+Vi3arnTagSF2yCwygSHnPLcTdU@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201101051252.07668.marcin@juszkiewicz.com.pl>
Subject: Re: [RFC] linux 2.6.36: upgrade to 2.6.36.2
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
X-List-Received-Date: Wed, 05 Jan 2011 11:52:09 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 4 stycznia 2011 o 22:12:29 Frans Meulenbroeks napisa=C5=82(a):
> Hi,
>=20
> I'm in the process of upgrading the sheevaplug kernel to 2.6.36. I
> noticed the current version of 2.6.36 is at patch 1 but 2.6.36.2 is
> already out.
> Guess this needs some coordination with the other users. Currently the
> recipe says:
>=20
> DEFAULT_PREFERENCE =3D "-1"
> DEFAULT_PREFERENCE_mx31ads =3D "1"
> DEFAULT_PREFERENCE_ts72xx =3D "1"
>=20
> Seems Petr, Eric and Robert are involved in these two machines.
> Care to comment on moving to 2.6.36.2 (or give it a stab)?

Long time ago (July 2009) I had similar RFC. In October 2009 I did mass upd=
ate=20
for all versions.

I think that stable kernel updates should be applied without asking - but i=
f=20
there are some patches for some machines in recipe then it needs to be chec=
ked=20
does it patch/build before pushing update.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz


