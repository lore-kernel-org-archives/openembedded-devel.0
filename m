Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OiPBv-0000tF-2C for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 12:02:47 +0200
Received: from f053041140.adsl.alicedsl.de ([78.53.41.140]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OiPBl-00064A-R3 for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 10:02:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E3E@deimsg40.de.net.world>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E17@deimsg40.de.net.world>
	<1281346042.3767.6.camel@mattotaupa>
	<0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E3E@deimsg40.de.net.world>
Date: Mon, 09 Aug 2010 12:02:33 +0200
Message-ID: <1281348153.3767.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox: fix defconfig handling problems triggered by "configure according to {MACHINE, DISTRO}_FEATURES"; added inetd handling (resent)
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
X-List-Received-Date: Mon, 09 Aug 2010 10:02:47 -0000
X-Groupsio-MsgNum: 21982
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-vAOVqh2Kj1gnJp01V8cZ"

--=-vAOVqh2Kj1gnJp01V8cZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 09.08.2010, 11:40 +0200 schrieb Hauser, Wolfgang (external):
> I'll try it again, it's not easy to send out something in a proper way fr=
om the "restricted area" here. (git-send-email is impossible for example)

Thanks.

> But by the way, it may be very useful for newbees like me to have an HowT=
o to create a patch in a proper way, including the necessary git commands a=
nd a complete example for subject and header data.

There is a Wiki link in [1] pointing to an example [3]. Do you have any
suggestions to improve this Wiki page? Since it is a Wiki you could also
do this yourself.


Thanks,

Paul


> [1] http://wiki.openembedded.net/index.php/Commit_Policy
> [2] http://wiki.openembedded.net/index.php/Patchwork
[3] http://wiki.openembedded.net/index.php/Commit_log_example

--=-vAOVqh2Kj1gnJp01V8cZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxf0jkACgkQPX1aK2wOHViO6wCeKIRT4yqVsM68+2eOYCzgQddS
PYcAnAjTGDt2TjwXEd4Nl2EKQTxpza6Y
=mRbK
-----END PGP SIGNATURE-----

--=-vAOVqh2Kj1gnJp01V8cZ--
