Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ2Zu-0007Jc-5x for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 14:32:37 +0100
Received: from g229060220.adsl.alicedsl.de ([92.229.60.220]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ2Xh-0002sa-6C for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 13:30:17 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201001241145.53503.holger+oe@freyther.de>
References: <1263047335.14620.17.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263059728.14620.64.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263895058.10980.39.camel@mattotaupa.wohnung.familie-menzel.net>
	<201001241145.53503.holger+oe@freyther.de>
Date: Sun, 24 Jan 2010 14:30:15 +0100
Message-ID: <1264339815.3810.82.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] vdr: Put common information in separate file and require it in the recipe.
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
X-List-Received-Date: Sun, 24 Jan 2010 13:32:37 -0000
X-Groupsio-MsgNum: 16158
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-CZr1iU42ovt5e0hQ82f0"

--=-CZr1iU42ovt5e0hQ82f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Holger,


Am Sonntag, den 24.01.2010, 11:45 +0100 schrieb Holger Hans Peter Freyther:
> On Tuesday 19 January 2010 10:57:38 Paul Menzel wrote:
> > Am Samstag, den 09.01.2010, 18:55 +0100 schrieb Paul Menzel:
>=20
> >=20
> > Could someone please commit this patch.
>
> two things. If you have a mail where 99.9% of text is quoted and only 0.1=
=20
> percent is new, you are doing it wrong. Please throw away stuff when quot=
ing.

Sorry, I will try to do so next time. Sometimes I am unsure about the
correct way. My intention was, if someone already had deleted my old
message s/he could still review my patch.

> The second part... could you please resend the patch?

I did.

> When I look here[1] patchwork is getting your patch totally wrong...

Actually it is almost correct in my opinion. What is displayed as the
patch is the needed mbox format for `git am`. Only that on the Web there
is always an extra line added and the items with UTF-8 bullets (=E2=80=A2) =
were
stripped. I will check that later, because the Patchwork git log
mentioned something about UTF-8.

What `pwclient get 1438` retrieves is not useful though. :(

> This means this and all the=20
> patches based on it are not in my new staging branch and I'm not able to=20
> review them.

Probably I will have to resend the others too. I will check later.

On the other hand, I always attached my patches. But that does not fit
your workflow does it?


Thanks,

Paul


> [1] http://patchwork.openembedded.org/patch/1438/

--=-CZr1iU42ovt5e0hQ82f0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktcS2cACgkQPX1aK2wOHVgFbQCfaPuQXwxWFhIRYAhFatStRpmQ
/lkAn3+aXhfbVl1BziKLgg7dDS9qHiGO
=Sceh
-----END PGP SIGNATURE-----

--=-CZr1iU42ovt5e0hQ82f0--
