Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYcsQ-0000lT-FB for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 11:06:01 +0100
Received: from f053033135.adsl.alicedsl.de ([78.53.33.135]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYcqE-00016q-4v for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 10:03:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <op.u6zcfwramn1qzu@guohr-laptop-ubuntu>
References: <> <1264239785-28226-1-git-send-email-camelguo@gmail.com>
	<201001231050.38823.holger+oe@freyther.de>
	<op.u6zcfwramn1qzu@guohr-laptop-ubuntu>
Date: Sat, 23 Jan 2010 11:03:40 +0100
Message-ID: <1264241020.3630.14.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux-storcenter: add fw-and-powerpc-install.patch
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
X-List-Received-Date: Sat, 23 Jan 2010 10:06:01 -0000
X-Groupsio-MsgNum: 16067
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-+hG5bKZZn7OzoMmyIkNT"

--=-+hG5bKZZn7OzoMmyIkNT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 23.01.2010, 17:53 +0800 schrieb Guo Hongruan:
> the building of linux-storcenter_2.6.27.7 failed due to lack of this patc=
h

I think Holger meant, what the patch is doing. Maybe it is not needed
and you can remove it from `SRC_URI`.

That said, firstly Holger probably did not see that the patch is copied
from somewhere else in the repository. The question is if it is
recommended to note in the commit message from where it is copied or if
Git should be used to determine this.

The second thing is, that the patch from `SRC_URI` is missing a header
with the description of its purpose [1]. But since it is copied it has
been so before.


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Push_patches_upstream

--=-+hG5bKZZn7OzoMmyIkNT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktayXwACgkQPX1aK2wOHVhljACdFdeLW3vsDRCE+BkvV4L9reIC
NqAAn0j7rcueZEv8WtixtZ7PNXZCIDos
=eera
-----END PGP SIGNATURE-----

--=-+hG5bKZZn7OzoMmyIkNT--
