Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PoBF2-0001YB-M4 for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 09:54:08 +0100
Received: from f053043157.adsl.alicedsl.de ([78.53.43.157]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PoBE0-0003Sc-5W for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 08:53:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110211091602.GA3508@rhein.zuhause.netz>
References: <1297363922.3877.24.camel@mattotaupa>
	<20110211091602.GA3508@rhein.zuhause.netz>
Date: Sat, 12 Feb 2011 09:53:03 +0100
Message-ID: <1297500783.6433.10.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: libsdl-mixer_1.2.11: task compile fails with `/bin/sed: can't read =/usr/lib/libts.la: No such file or directory`
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
X-List-Received-Date: Sat, 12 Feb 2011 08:54:08 -0000
X-Groupsio-MsgNum: 29116
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-+RNAWMSP1U0RFhdxIhDE"

--=-+RNAWMSP1U0RFhdxIhDE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Henning,


Am Freitag, den 11.02.2011, 10:16 +0100 schrieb Henning Heinold:

> should be fixed now in master.

another issues I noticed is, that the library `SDL_mixer` is not found
when compiling `xbmc_svn.bb` with `angstrom-2008.1` for `MACHINE =3D
"beagleboard"`.

        | checking for main in -lsmbclient... yes
        | checking for main in -lSDL_mixer... no
        | configure: error: Could not find a required library. Please see t=
he README for your platform.
        | ERROR: Function do_configure failed
        NOTE: package xbmc-10.05-r11+gitr0+e2ab481ebe964321c358ab9d6402088c=
714adcbe: task do_configure: Failed


Thanks,

Paul

--=-+RNAWMSP1U0RFhdxIhDE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1WSm8ACgkQPX1aK2wOHViQsACeNhx9Ag1QN1wkmL37ig9IEDgP
vPIAmgPtzWL09dZf9ujqBc9u/hIhz/5L
=WN7m
-----END PGP SIGNATURE-----

--=-+RNAWMSP1U0RFhdxIhDE--
