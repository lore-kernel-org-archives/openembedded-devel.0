Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qvn6L-0004p5-6a for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 11:16:53 +0200
Received: from f053042082.adsl.alicedsl.de ([78.53.42.82]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qvn1p-0000Dz-5I for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 09:12:13 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Aug 2011 11:12:08 +0200
In-Reply-To: <1314088478-8681-1-git-send-email-noor_ahsan@mentor.com>
References: <1314088478-8681-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314090730.3688.9.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH v2][meta-oe] lmbench: Added new recipe for 3.0-a9 version
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
X-List-Received-Date: Tue, 23 Aug 2011 09:16:53 -0000
X-Groupsio-MsgNum: 33789
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-/qQWV3Bu/tkaXyudC8SF"

--=-/qQWV3Bu/tkaXyudC8SF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Noor,


Am Dienstag, den 23.08.2011, 13:34 +0500 schrieb Noor, Ahsan:
> From: Noor Ahsan <noor_ahsan@mentor.com>
>=20
> * Added new recipe for 3.0-a9 version.
>=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  .../lmbench/lmbench-3.0-a9/lmbench-run             |   23 +++
>  .../lmbench/lmbench-3.0-a9/obey-ranlib.patch       |   25 +++
>  .../lmbench-3.0-a9/rename-line-binary.patch        |   11 ++
>  .../lmbench-3.0-a9/update-results-script.patch     |  155 ++++++++++++++=
++++++
>  .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |   75 ++++++++++
>  5 files changed, 289 insertions(+), 0 deletions(-)

[=E2=80=A6]

NACK. I am sorry, but neither Tom=E2=80=99s nor mine review comments are
included.


Thanks,

Paul

--=-/qQWV3Bu/tkaXyudC8SF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5TbukACgkQPX1aK2wOHVg7UwCfQAAxX37dOXxN2y8b5/sA9ZXi
OLMAn1J+7AyvAHAwsNE1UL/eztHQmGZH
=lwRC
-----END PGP SIGNATURE-----

--=-/qQWV3Bu/tkaXyudC8SF--
