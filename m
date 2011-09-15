Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R48vF-0008Es-52 for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 12:12:02 +0200
Received: from f053044184.adsl.alicedsl.de ([78.53.44.184]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R48q8-0003PA-7H for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 10:06:40 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 12:06:31 +0200
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316081192.4523.52.camel@mattotaupa>
Mime-Version: 1.0
Subject: meta-oe: Patch review/quality and new and new commit policy
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
X-List-Received-Date: Thu, 15 Sep 2011 10:12:02 -0000
X-Groupsio-MsgNum: 34253
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-M8E9dai5RXZR5bZ8Pilg"

--=-M8E9dai5RXZR5bZ8Pilg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


looking at the commit log of meta-oe, I see two issues.

1. A lot of these patches were never sent to *this* list like [2].
2. The commit message are not adhering to the guide lines [1] and are
therefore not as useful as they could be.

If I remember correctly one reason for the new structure was to also
improve the quality of OpenEmbedded. And as there is nobody having any
time to update documentation commit messages are the only means right
now to document things correctly. I know that a lot of you are probably
annoyed by me saying guide lines, guide lines, guide lines all over
again, but I have not seen any other suggestions yet and looking at the
current meta-oe state I doubt that the quality is that much better than
before. The only benefit I can see is that there are not so many
versions of the same recipe.

Since nobody else did so already I propose the following policy to get
patches into meta-oe. They should be in effect immediately and can be
improved/adapted over time.

1. Commits have to adhere to the Commit Patch Message Guidelines.
2. It is advisable to add to the commit message how the patch was tested
(build, run time, build system, distribution, machine).
3. Patches have to be send for review (preferably with a pull request)
to openembedded-devel. After one week without any objections they can be
pulled into the repository.
4. The state in the patch queue Patchwork=C2=B9 has to be updated.

Thanks,

Paul


=C2=B9 As soon as it works correctly again.

[1] http://openembedded.org/index.php?title=3DCommit_Patch_Message_Guidelin=
es
[2] http://www.mail-archive.com/openembedded-core@lists.openembedded.org/ms=
g08136.html

--=-M8E9dai5RXZR5bZ8Pilg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5xzicACgkQPX1aK2wOHVjCowCeIEYxrNH29m7RIhetZPucTt38
oqAAn1b+92biJp6LcWEoTMCMAHISj+KM
=ugDx
-----END PGP SIGNATURE-----

--=-M8E9dai5RXZR5bZ8Pilg--
