Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1P07WO-0007Pp-HM
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 08:49:09 +0200
Received: (qmail 12921 invoked by uid 813007); 27 Sep 2010 06:48:55 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 27 Sep 2010 06:48:55 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Sep 2010 08:50:07 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.35-22-generic; KDE/4.5.1; x86_64; ; )
References: <AANLkTinXgsJvySDfFADwQvLJSGJ3Ti_X9tJxxGs_+q2Y@mail.gmail.com>
In-Reply-To: <AANLkTinXgsJvySDfFADwQvLJSGJ3Ti_X9tJxxGs_+q2Y@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201009270850.11973.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] lremove linux-uml
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
X-List-Received-Date: Mon, 27 Sep 2010 06:49:09 -0000
X-Groupsio-MsgNum: 24034
Content-Type: multipart/signed; boundary="nextPart34763920.DJazq8N8AM";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart34763920.DJazq8N8AM
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia sobota, 25 wrze=C5=9Bnia 2010 o 19:45:39 Frans Meulenbroeks napisa=C5=
=82(a):

> Proposal is to remove recipes/linux-uml.
> There are two recipes in this, and neither fetches properly.
> Also the recipes are for very old kernels:
>=20
>  linux-uml_2.4.26.bb  linux-uml_2.6.11-rc2-mm1.bb
>=20
> It seems pointless to keep these (btw uml is nowadays in the mainline)
>=20
> Your feedback and ack/nack is appreciated.

Acked-By: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart34763920.DJazq8N8AM
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkygPqAACgkQeQ6MlGH/2qs6lQCdG1fVJHMBzvlsaXSY+IzuxsSg
XSgAn3PMXxIoUoCVedTYhNKrLDY7Ufv0
=Pmls
-----END PGP SIGNATURE-----

--nextPart34763920.DJazq8N8AM--
