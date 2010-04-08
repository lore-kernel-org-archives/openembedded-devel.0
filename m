Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Nzo7F-0004Dk-W8
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 11:33:40 +0200
Received: from w0952.wlan.rz.tu-bs.de ([134.169.203.190] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Nzo3z-0006ZJ-1V by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 11:30:17 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1Nzo3y-0005fC-Nn
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 11:30:14 +0200
Date: Thu, 8 Apr 2010 11:30:14 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100408093014.GD27376@excalibur.local>
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
	<1268415992-19603-3-git-send-email-rep.dot.nop@gmail.com>
	<201004052349.55933.roman@khimov.ru>
MIME-Version: 1.0
In-Reply-To: <201004052349.55933.roman@khimov.ru>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] sane-toolchain: add PREFERRED_UCLIBC_VERSION
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
X-List-Received-Date: Thu, 08 Apr 2010 09:33:44 -0000
X-Groupsio-MsgNum: 18475
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline

--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

On Mon, 2010-04-05 at 23:49, Roman I Khimov wrote:
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0 12 =D0=BC=D0=B0=D1=80=D1=82=
=D0=B0 2010 20:46:31 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Bernhard Reutner-Fische=
r=20
> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> > ---
> >  conf/distro/include/sane-toolchain-uclibc.inc |    7 +++++++
> >  conf/distro/include/sane-toolchain.inc        |    3 +--
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> >=20
>=20
> Acked-by: Roman I Khimov <khimov@altell.ru>

Looks fine for me as well. Khem, Henning any comments from the uclibc side?
(Askign because you two have ulibc as interest in the MAINTAINERS file)

regards
Stefan Schmidt

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: http://www.datenfreihafen.org/contact.html

iEYEARECAAYFAku9oiYACgkQbNSsvd31FmUzrACgk0Cg+yXOIHCwxlgmWKf9kHL+
YHcAnj+rtyUN1dHYSW/hBL7c0w8S9Tu8
=/tLP
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
