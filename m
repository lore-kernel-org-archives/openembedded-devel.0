Received: from [134.169.172.64] (helo=thebe.totalueberwachung.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <daniel@totalueberwachung.de>) id 1LN5pv-0001Ky-W1
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jan 2009 14:31:12 +0100
Received: from adrastea.totalueberwachung.de
	(adrastea.dyn.totalueberwachung.de [192.168.0.8])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by thebe.totalueberwachung.de (Postfix) with ESMTP id 65FBFD8323
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2009 14:24:37 +0100 (CET)
Date: Wed, 14 Jan 2009 14:24:31 +0100
From: Daniel Willmann <daniel@totalueberwachung.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090114142431.7db4b26e@adrastea.totalueberwachung.de>
In-Reply-To: <5ED84125-2736-489A-94F0-1E385661D7BA@student.utwente.nl>
References: <20090113203242.4D378189331@amethyst.openembedded.net>
	<20090114124842.32a3241e@adrastea.totalueberwachung.de>
	<5ED84125-2736-489A-94F0-1E385661D7BA@student.utwente.nl>
X-Mailer: Claws Mail 3.6.1 (GTK+ 2.12.11; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [oe-commits] Koen Kooi : mtd-utils-native: remove default-preference from 1.20+git, it shows now errors in my tests
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
X-List-Received-Date: Wed, 14 Jan 2009 13:31:12 -0000
X-Groupsio-MsgNum: 7226
Content-Type: multipart/signed; boundary="Sig_/M674TQi=/PmimBOrNDdVqhk";
	protocol="application/pgp-signature"; micalg=PGP-SHA1

--Sig_/M674TQi=/PmimBOrNDdVqhk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Jan 2009 13:08:34 +0100
Koen Kooi <k.kooi@student.utwente.nl> wrote:

>=20
> Op 14 jan 2009, om 12:48 heeft Daniel Willmann het volgende
> geschreven:
>=20
> > mtd-utils-native fails here with:
> >
> > | /home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils-=20
> > native-1.2.0+git-r2/git/
> > mkfs.ubifs/mkfs.ubifs.o: In function `write_super':
> > | /home/alphaone/oe-dev/tmp/work/x86_64-linux/mtd-utils-=20
> > native-1.2.0+git-r2/git/mkfs.ubifs/mkfs.ubifs.c:1866: undefined =20
> > reference to `uuid_unparse_upper'
> > | collect2: ld returned 1 exit status
>=20
> Which e2fsprogs-libs-native do you have installed? Also, oe-devel is =20
> subscriber only, enough with the CC:!

It's building e2fsprogs-libs-native-1.35-r0
Thanks for reverting it in the mean time.

Regards,
Daniel Willmann

--Sig_/M674TQi=/PmimBOrNDdVqhk
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAklt55QACgkQZ2fhlIqbZ1jnNQCgynWOLWabdXIUZZl/DzaAypFj
9YsAnjnk87LT3dIqpZ1d8pYgv7sCc9aT
=t1Av
-----END PGP SIGNATURE-----

--Sig_/M674TQi=/PmimBOrNDdVqhk--
