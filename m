Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1R49Ji-00011H-Ms for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 12:37:14 +0200
Received: from f053044184.adsl.alicedsl.de ([78.53.44.184]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1R49Er-0003dZ-5E for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 10:32:13 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 12:32:04 +0200
X-Mailer: Evolution 3.0.3- 
Message-ID: <1316082725.4523.67.camel@mattotaupa>
Mime-Version: 1.0
Subject: Do we need a patch queue (Patchwork)?
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
X-List-Received-Date: Thu, 15 Sep 2011 10:37:14 -0000
X-Groupsio-MsgNum: 34259
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-RpSs04vqncBtXgGCwbEW"

--=-RpSs04vqncBtXgGCwbEW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


(This is the last organizational message I will write today.)

We currently have a patch queue/tracker called Patchwork [1][2] which
should be used according to the documentation in the Wiki.

The current situation though is that nobody seems to use it anymore, i.
e. does not update the patch state. (Also because of some problems with
registration.)

Before the move to oe-core and meta-oe there were some people caring
about Patchwork and going through the uncommitted each quarter or so.
Currently this is not the case anymore.

Should the system be shut down or do we still need it?

### benefits ###

1. Patches are easy to apply from Patchwork when not having access to
the email program with the list inbox.
2. Old patches are not forgotten.
3. Patch state can be tracked and the thread representation is more
concise then the list archive.
4. Searching for patches on the Web most of the time the first hits
point to the threads in Patchwork.

### downsides ###

1. It is a lot of work to update the patch state manually.
2. A lot of people refuse to use it.


We could also say that the current installation will stay at is and that
it is only used to import patches easily and for getting the discussion
overview. I am fine with that, but the documentation needs to be
updated!


Thanks,

Paul


[1] http://patches.openembedded.org/project/oe/list/
[2] http://openembedded.org/index.php?title=3DPatchwork

--=-RpSs04vqncBtXgGCwbEW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5x1CQACgkQPX1aK2wOHVjTigCeJ9yPYS/youv0pa23MMCqI1Ft
MuUAn15iOm88qNhpkdrQREl1B6q+Ocbr
=+mnq
-----END PGP SIGNATURE-----

--=-RpSs04vqncBtXgGCwbEW--
