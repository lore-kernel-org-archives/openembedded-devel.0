Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MGz9C-0007OR-DE
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 19:42:06 +0200
Received: (qmail 30225 invoked by uid 813007); 17 Jun 2009 17:31:39 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 17 Jun 2009 17:31:39 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 19:31:27 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.30-00002-g9396b7b; KDE/4.2.4; x86_64; ; )
References: <1245258640-1623-1-git-send-email-clarson@mvista.com>
In-Reply-To: <1245258640-1623-1-git-send-email-clarson@mvista.com>
MIME-Version: 1.0
Message-Id: <200906171931.28562.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH] image.bbclass: remove tmp/rootfs after image creation unless you set a variable
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
X-List-Received-Date: Wed, 17 Jun 2009 17:42:06 -0000
X-Groupsio-MsgNum: 11335
Content-Type: multipart/signed; boundary="nextPart2164804.yKt9XefziN";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2164804.yKt9XefziN
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =C5=9Broda, 17 czerwca 2009 o 19:10:40 Chris Larson napisa=C5=82(a):
> Set IMAGE_KEEPROOTFS to something other than the empty string to keep
> tmp/rootfs around after image creation, otherwise it will be removed,
> as it's not a fully functional filesystem, and causes much confusion
> among users as a result.
>
> Signed-off-by: Chris Larson <clarson@mvista.com>

Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

I am also tired of explaining to users why tmp/rootfs should not be used=20
as nfsroot.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart2164804.yKt9XefziN
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAko5KHAACgkQeQ6MlGH/2qtpSQCeJwxvZskNfpW07DcF297khkfp
j30An24cunDatCaczxBn1vuPv8Sj/kDg
=Lf2z
-----END PGP SIGNATURE-----

--nextPart2164804.yKt9XefziN--
