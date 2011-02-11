Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PnsQv-00016D-Nf for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 13:49:09 +0100
Received: from f053036141.adsl.alicedsl.de ([78.53.36.141]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PnsPu-0001cD-CJ for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 12:48:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110211091602.GA3508@rhein.zuhause.netz>
References: <1297363922.3877.24.camel@mattotaupa>
	<20110211091602.GA3508@rhein.zuhause.netz>
Date: Fri, 11 Feb 2011 13:48:04 +0100
Message-ID: <1297428484.3785.27.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [solved] libsdl-mixer_1.2.11: task compile fails with `/bin/sed: can't read =/usr/lib/libts.la: No such file or directory`
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
X-List-Received-Date: Fri, 11 Feb 2011 12:49:09 -0000
X-Groupsio-MsgNum: 29039
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-5S6WWBkDH38yBdlpwsVV"

--=-5S6WWBkDH38yBdlpwsVV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Henning,


Am Freitag, den 11.02.2011, 10:16 +0100 schrieb Henning Heinold:

> should be fixed now in master.

your commit eae7de30 [1] indeed solved this problem.

Could you add a reference to the mailing list thread or copy the error
message to the commit message next time please? That would be awesome.


Thanks a lot for your quick response,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Deae7de3=
042a099edc762d01ba62a161af6a1a934

--=-5S6WWBkDH38yBdlpwsVV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1VMAQACgkQPX1aK2wOHVgtSQCgjVUb4bnDluz1nY+Hhpnd5c3Z
lWcAn3mJdDn4F5wg3gG2AZaGRUweGqR3
=mR3g
-----END PGP SIGNATURE-----

--=-5S6WWBkDH38yBdlpwsVV--
