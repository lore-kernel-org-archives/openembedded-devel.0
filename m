Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PupNH-0006fq-UC for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 17:58:11 +0100
Received: from f053041235.adsl.alicedsl.de ([78.53.41.235]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PupLp-0003Uq-By for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 16:56:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110302154001.GA13969@mi.fu-berlin.de>
References: <1299076864.3857.46.camel@mattotaupa>
	<20110302154001.GA13969@mi.fu-berlin.de>
Date: Wed, 02 Mar 2011 17:56:35 +0100
Message-ID: <1299084995.3857.68.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: minimal-uclibc: alsa-utils_1.0.24.2: task compile fails with `warning: incompatible implicit declaration of built-in function 'exp10'`
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
X-List-Received-Date: Wed, 02 Mar 2011 16:58:11 -0000
X-Groupsio-MsgNum: 29868
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-SAiYPaXBS7xJ/AWf+3MY"

--=-SAiYPaXBS7xJ/AWf+3MY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 02.03.2011, 16:40 +0100 schrieb Henning Heinold:
> You didnt tell us your uclibc version. Try git.

I have nothing in my `conf/local.conf` and therefore uclibc_git is used
by default. A line from the build log.

    NOTE: package uclibc-initial-git-r35.8+gitr0+094d82d3b3e8f8c8460a802b7a=
9548f3ae4fda46


Thanks,

Paul

--=-SAiYPaXBS7xJ/AWf+3MY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk1udsMACgkQPX1aK2wOHVgbxQCdG569W/hApsigFyUBnvz4uYQT
nD8AmwYzBhTJtDA6RKM0yMOqAMjCDzee
=UtiB
-----END PGP SIGNATURE-----

--=-SAiYPaXBS7xJ/AWf+3MY--
