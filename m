Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MIpgH-0001bp-SG
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 21:59:54 +0200
Received: (qmail 20258 invoked by uid 813007); 22 Jun 2009 19:48:54 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jun 2009 19:48:54 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jun 2009 21:47:54 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.30-00002-g9396b7b; KDE/4.2.4; x86_64; ; )
References: <1245692685-21173-1-git-send-email-denis@denix.org>
	<h1oimu$5gd$2@ger.gmane.org>
In-Reply-To: <h1oimu$5gd$2@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200906222148.14411.marcin@juszkiewicz.com.pl>
Subject: Re: RFC: [PATCH] /etc/profile: stricter root PATH - require absolute pathname for bins in cwd
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
X-List-Received-Date: Mon, 22 Jun 2009 19:59:55 -0000
X-Groupsio-MsgNum: 11525
Content-Type: multipart/signed; boundary="nextPart2060085.DZe5vsQNzJ";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2060085.DZe5vsQNzJ
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=C5=82ek, 22 czerwca 2009 o 20:31:58 Koen Kooi napisa=C5=82(a=
):
> > Having current directory (either '.' or empty string) in PATH is
> > considered dangerous for root.
> >
> > Signed-off-by: Denys Dmytriyenko<denis@denix.org>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart2060085.DZe5vsQNzJ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAko/3/oACgkQeQ6MlGH/2qtXMwCfbWRwSujt3jDST7M5caIyCzFa
VWEAnj8uguadPoWmaE1pAszgE22Ke8IQ
=I6XF
-----END PGP SIGNATURE-----

--nextPart2060085.DZe5vsQNzJ--
