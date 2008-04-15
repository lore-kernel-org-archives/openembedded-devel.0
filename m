Received: from [209.85.132.241] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JlnkI-0004if-R5
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Apr 2008 18:10:58 +0200
Received: by an-out-0708.google.com with SMTP id b33so563678ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2008 09:10:52 -0700 (PDT)
Received: by 10.100.210.14 with SMTP id i14mr15198765ang.45.1208275850604;
	Tue, 15 Apr 2008 09:10:50 -0700 (PDT)
Received: from ?10.235.23.2? ( [71.146.14.115])
	by mx.google.com with ESMTPS id c29sm1920635elf.9.2008.04.15.09.10.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 15 Apr 2008 09:10:37 -0700 (PDT)
Message-ID: <4804D346.50809@gmail.com>
Date: Tue, 15 Apr 2008 09:09:42 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080415122902.GA13726@deadlock.dhs.org>
In-Reply-To: <20080415122902.GA13726@deadlock.dhs.org>
X-Enigmail-Version: 0.95.6
OpenPGP: id=A57A7A6E
Subject: Re: How to properly enforce an ARM OABI build?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Apr 2008 16:10:59 -0000
X-Groupsio-MsgNum: 4966
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig911D0D71D956725438630E75"

--------------enig911D0D71D956725438630E75
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Sergey 'Jin' Bostandzhyan wrote:
> Hi,
>=20
> I want to build Angstrom for ARM OABI and I'm struggling to get the set=
tings
> right.
>=20
> I'm using org.openembedded.stable and I tried this in my local conf:
>=20
> MACHINE=3D"armv4t"
> DISTRO=3D"angstrom-2007.1"
> TARGET_OS :=3D"linux"
> ARM_ABI :=3D "oabi"

may be use '=3D' instead of ':=3D'


--------------enig911D0D71D956725438630E75
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIBNNJHnJKy6V6em4RAmOWAJ9WhF9JWSLSehHf2Gp+8OVTk8qblQCfaXqv
NBXh7UFUUktrW7E+1Rv9Ysc=
=pide
-----END PGP SIGNATURE-----

--------------enig911D0D71D956725438630E75--
