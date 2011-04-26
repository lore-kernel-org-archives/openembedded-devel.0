Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEe91-00084a-2E for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 11:01:19 +0200
Received: from f053033081.adsl.alicedsl.de ([78.53.33.81]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEe7L-0004Sw-PH for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 08:59:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201104252052.53197.sgh@sgh.dk>
References: <201104251704.03324.sgh@sgh.dk>
	<1303745160.15311.36.camel@mattotaupa> <201104252052.53197.sgh@sgh.dk>
Date: Tue, 26 Apr 2011 10:58:49 +0200
Message-ID: <1303808329.4073.32.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] python-scons_1.3.0: add `python-native` to `DEPENDS_virtclass-native`
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
X-List-Received-Date: Tue, 26 Apr 2011 09:01:19 -0000
X-Groupsio-MsgNum: 31464
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-zrHVq1ledLT2qCCRYDAc"

--=-zrHVq1ledLT2qCCRYDAc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 25.04.2011, 20:52 +0200 schrieb S=C3=B8ren Holm:
> Signed-off-by: S=C3=B8ren Holm <sgh@sgh.dk>

I used Acked-by instead and pushed it [3]. I think policy in
OpenEmbedded does not differentiate between both versions anyway, but I
am used to [1]. I used Signed-off-by in your commits, because I adapted
the patches or the commit message slightly.

[=E2=80=A6]

> What does DEPENDS_virtclass do ?

If I am not mistaken, these are the dependencies for the native package
when `BBCLASSEXTEND` is used [2].

> Mandag den 25. april 2011 17:26:00 skrev Paul Menzel:

[=E2=80=A6]

Please do not top post, i. e. please rather remove these full text quote
altogether.


Thanks,

Paul


[1] http://www.kernel.org/doc/Documentation/SubmittingPatches
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/classes/native.=
bbclass?id=3Dc3604894c130a6596b16abb945d3c57fbf40ef39
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D9fb55ee=
61735ef420e468d9a84dee86e16a0480b

--=-zrHVq1ledLT2qCCRYDAc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk22iUkACgkQPX1aK2wOHViMdQCfSiyt4cHL1LVtPAtWsp+rNVP7
gyoAnAtDKKVMJ+4hHR6eRi3iec8i/DnL
=71dq
-----END PGP SIGNATURE-----

--=-zrHVq1ledLT2qCCRYDAc--
