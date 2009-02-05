Received: from [83.222.24.107] (helo=smtp-7.masterhost.ru)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1LV8oa-00054t-6h
	for openembedded-devel@openembedded.org; Thu, 05 Feb 2009 19:19:04 +0100
Received: (qmail 17066 invoked from network); 5 Feb 2009 18:18:29 -0000
Received: from unknown (HELO mate.hex) (rik@osrc.info@84.17.11.114)
	by smtp1.masterhost.ru with SMTP; 5 Feb 2009 18:18:29 -0000
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@openembedded.org
Date: Thu, 5 Feb 2009 21:18:26 +0300
User-Agent: KMail/1.9.9
References: <200902051836.25770.roman@khimov.ru> <gmf4nv$lmm$1@ger.gmane.org>
In-Reply-To: <gmf4nv$lmm$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200902052118.26879.roman@khimov.ru>
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH] New package: byacc
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
X-List-Received-Date: Thu, 05 Feb 2009 18:19:04 -0000
X-Groupsio-MsgNum: 7563
Content-Type: multipart/signed; boundary="nextPart2383080.yzIpJYBfcA";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2383080.yzIpJYBfcA
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Koen Kooi:
> On 05-02-09 16:36, Roman I Khimov wrote:
> > Hello everyone.
> >
> > The package is mostly intended to be built as native and then used to
> > build other packages. It's trivial and I thought it might be useful for
> > someone else too, hence, trying to push.
>
> Does 'ftp://invisible-island.net/byacc/byacc.tar.gz' change from time to
> time?

=46rom what I see, unfortunately, yes. There is a non-volatile tarball in=20
Debian (see http://packages.debian.org/sid/byacc), but it's a bit older.=20
So, I don't actually know, how to better handle this. Any ideas are=20
welcome.

=2D-=20
                            Roman
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2383080.yzIpJYBfcA
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmLLXIACgkQXJ70z+XgVcMgEQCfae37jMnL2/LAxAzbhRjDGWY8
FxsAoI6RiPx9nUlDG51VJKfAbXRkmfSm
=IewS
-----END PGP SIGNATURE-----

--nextPart2383080.yzIpJYBfcA--
