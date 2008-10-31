Received: from [147.32.96.3] (helo=hades.mk.cvut.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Martin.Jansa@mk.cvut.cz>) id 1Kvq55-0001iT-9I
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Oct 2008 10:14:11 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by hades.mk.cvut.cz (Postfix) with ESMTP id BB7BF2E7EB7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2008 10:13:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mk.cvut.cz
Received: from hades.mk.cvut.cz ([127.0.0.1])
	by localhost (hades.mk.cvut.cz [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6uIB4Kc7qbcO
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2008 10:13:04 +0100 (CET)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by hades.mk.cvut.cz (Postfix) with ESMTPSA id 98F3E2E7EB6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2008 10:13:04 +0100 (CET)
Date: Fri, 31 Oct 2008 10:13:04 +0100
From: Martin Jansa <Martin.Jansa@mk.cvut.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081031091304.GA6818@jama>
References: <20081031013837.F2AD4189330@amethyst.openembedded.net>
	<200810310749.55874.openembedded@haerwu.biz>
MIME-Version: 1.0
In-Reply-To: <200810310749.55874.openembedded@haerwu.biz>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [oe-commits] Carsten Haitzler (Raster) : qemu: seems the	move to the svn rev of qemu broke as there are compiler bugs
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
X-List-Received-Date: Fri, 31 Oct 2008 09:14:11 -0000
X-Groupsio-MsgNum: 6450
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2008 at 07:49:53AM +0100, Marcin Juszkiewicz wrote:
> Can you send me error output? I built that qemu version on Ubuntu 8.04=20
> many times.
>=20
> Regards,=20

Same problem here. Gentoo ~amd64

error output:
http://rafb.net/p/xJyljp35.html

Regards,

--=20
uin:136542059                jid:JaMa@jabber.mk.cvut.cz
Jansa Martin                 sip:jamasip@voip.wengo.fr=20
JaMa                        =20

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkkKzB8ACgkQN1Ujt2V2gBzj+gCeI6tp1iaXrd9LkOdl9l90QFCa
6bsAn2k5TcFeXVuQ68cedQI65kn2ielU
=u9rL
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
