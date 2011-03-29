Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q4WNe-0008N5-Na for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 12:42:34 +0200
Received: from f053045115.adsl.alicedsl.de ([78.53.45.115]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q4WLn-0008Iu-3l for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 10:40:39 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D90EFC2.4060003@mentor.com>
References: <4D7E3B34.5050100@mentor.com> <4D90E2FA.7020603@mentor.com>
	<20110328201541.GA32128@denix.org>  <4D90EFC2.4060003@mentor.com>
Date: Tue, 29 Mar 2011 12:40:37 +0200
Message-ID: <1301395237.15348.28.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: =?UTF-8?B?T1Q6IFRvbeKAmXMgR1BHIGtleSAod2FzOiBEaXNjdXNzaW9uOiBWZXJzaW9uIHJldGVudGlvbiBwb2xpY3kgaW4gb2UtY29yZSk=?=
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
X-List-Received-Date: Tue, 29 Mar 2011 10:42:34 -0000
X-Groupsio-MsgNum: 30690
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-/nWAJpvq9X5ZJG4D+vCq"

--=-/nWAJpvq9X5ZJG4D+vCq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 28.03.2011, 13:29 -0700 schrieb Tom Rini:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 03/28/2011 01:15 PM, Denys Dmytriyenko wrote:
> > On Mon, Mar 28, 2011 at 12:35:22PM -0700, Tom Rini wrote:
> >> On 03/14/2011 08:58 AM, Tom Rini wrote:
> >>> Hi all,
> >>>
> >>> The TSC has discussed this item at the request of the community and h=
as
> >>> come up with the following recommendation which we are looking for
> >>> feedback (positive/negative/neutral) before putting this up on the wi=
ki.
> >>
> >> Based on feedback I have placed this into
> >> http://wiki.openembedded.org/index.php/Version_Retention_Policy
> >>
> >> Tom Rini
> >> Mentor Graphics Corporation
> >=20
> > Tom,
> >=20
> > A slight offtopic: you started signing your emails, but where is the=
=20
> > corresponding public key DCDE7271 - I cannot find it on any of the=20
> > keyservers, although there are plenty of your old keys...
>=20
> Blah, I didn't realize gpg2 --send-keys didn't work anymore.  It should
> be on keyserver2.pgp.com in however long it takes for it to populate (I
> can't find it in search just now but I also just clicked the
> verification link).

With `keyserver x-hkp://pool.sks-keyservers.net` in `~/.gnupg/gpg.conf`
Tom=E2=80=99s key is found.

        $ gpg --search-key DCDE7271
        gpg: suche nach "DCDE7271" auf hkp-Server pool.sks-keyservers.net
        (1)	Thomas Rini (work) <tom_rini@mentor.com>
        	  2048 bit RSA key DCDE7271, erzeugt: 2011-03-27


Thanks,

Paul

--=-/nWAJpvq9X5ZJG4D+vCq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2RtyUACgkQPX1aK2wOHVg8SACeKYJtoEztqsF51/+BOfZmbmJG
zp8An1r9/n2hrc/zp23gl4h/opQ6IXR3
=HMt2
-----END PGP SIGNATURE-----

--=-/nWAJpvq9X5ZJG4D+vCq--
