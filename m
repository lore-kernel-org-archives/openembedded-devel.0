Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RGB6B-0007mc-G1 for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 16:56:59 +0200
Received: from g225081213.adsl.alicedsl.de ([92.225.81.213]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RGB0d-00075c-Al for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 14:51:15 +0000
Message-ID: <1318949469.3538.34.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 16:51:09 +0200
In-Reply-To: <c4b964c5a17f463645b3e9cb7a8351bbe62eef9a.1318946821.git.Martin.Jansa@gmail.com>
References: <359a5968f27008d6fcbaee5137c237bfcabd2579.1318946821.git.Martin.Jansa@gmail.com>
	<c4b964c5a17f463645b3e9cb7a8351bbe62eef9a.1318946821.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [meta-efl 3/3] lightmediascanner: Add version 0.4.4 (initial recipe)
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
X-List-Received-Date: Tue, 18 Oct 2011 14:56:59 -0000
X-Groupsio-MsgNum: 34869
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-pHEIjR0ttFRn8SxssI8J"

--=-pHEIjR0ttFRn8SxssI8J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 18.10.2011, 16:10 +0200 schrieb Martin Jansa:
> From: pespin <pespin.shar@gmail.com>

The name is still not correct. Although the Signed-off-by line is.
Please correct that.

> * Copied from oe-classic <http://git.openembedded.org/openembedded/commit=
/?id=3D63d3969b0f839fc4b7bf7fe836daec729d9d3c53>
> * Remove PE=3D1
> * Add LIC_FILES_CHKSUM
> * Builds fine using SHR distro
> * JaMa: removed PR

Was the recipe tested somehow?

> Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../lightmediascanner/lightmediascanner_0.4.4.bb   |   27 ++++++++++++++=
++++++
>  1 files changed, 27 insertions(+), 0 deletions(-)
>  create mode 100644 meta-efl/recipes-multimedia/lightmediascanner/lightme=
diascanner_0.4.4.bb

[=E2=80=A6]


Thanks,

Paul

--=-pHEIjR0ttFRn8SxssI8J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6dkl4ACgkQPX1aK2wOHVhm1gCfWz0jbUjGaplJjPhz0KUc6/bD
al4An0j443BxZR6tfK4FhBX1QNXuq0lm
=Lenc
-----END PGP SIGNATURE-----

--=-pHEIjR0ttFRn8SxssI8J--
