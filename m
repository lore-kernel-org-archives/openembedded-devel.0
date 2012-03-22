Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SAeil-0005gQ-UL
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 10:54:16 +0100
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 5F2F6A617D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 10:45:19 +0100 (CET)
Date: Thu, 22 Mar 2012 10:45:17 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120322104517.0600295f@eb-e6520>
In-Reply-To: <jkes69$nt2$1@dough.gmane.org>
References: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
	<jkdg34$om0$1@dough.gmane.org>
	<CAGiJk9cG0mySg454zxYS8VJLc9etr2jAAxxtBSMbN9boq0EnRg@mail.gmail.com>
	<20120322092859.GE4010@jama.jama.net>
	<CAGiJk9ex0qxUQrxyCSjH33dpH_sg40MmLj+Gq5SSgW2AkyoL_w@mail.gmail.com>
	<20120322104009.6a4ed04e@eb-e6520> <jkes69$nt2$1@dough.gmane.org>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [PATCH] [meta-oe] giflib: Move to OE-Core
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
X-List-Received-Date: Thu, 22 Mar 2012 09:54:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Thu, 22 Mar 2012 10:42:33 +0100,
Koen Kooi <koen@dominion.thruhere.net> a =E9crit :

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 22-03-12 10:40, Eric B=E9nard schreef:
> > Le Thu, 22 Mar 2012 10:35:31 +0100, Samuel Stirtzel
> > <s.stirtzel@googlemail.com> a =E9crit :
> >> 2012/3/22 Martin Jansa <martin.jansa@gmail.com>:
> >>> why not add meta-oe dependency to meta-kde/README?
> >>=20
> >> It is already listed as dependency [1]. But somehow it seems like that
> >> there are users, interested in testing this layer, with an use case
> >> which excludes the meta-oe layer.
> >>=20
> >>=20
> > can you describe this use case so that meta-oe gets a chance to adapt.
> >=20
> > One problem I can see with meta-oe is the fact that it makes changes to=
=20
> > the oe-core toolchain : that would be great to put all the toolchain=20
> > changes in a meta-toolchain (but I think that's what is scheduled with=
=20
> > meta-linaro).
>=20
> In the mean time I bet Khem would love to have people sending patches to
> move the toolchain bits to a meta-toolchain layer inside the
> meta-openembedded repo.
>=20
ok so expect patches by this weekend for this point.

Eric


