Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjTIk-0002PY-Ao
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 12:19:34 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1272113dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 03:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XZF+rJcNnU60SVBCvLXHWp0ZOCeWqXD6rbGWxs2GQqQ=;
	b=GvPGrKS7MfeD9C1F+s5wscJDP75/UW5BDc6Xz5Nko3hQuxFyI6ij6o7CBAc1HVmiMf
	JClRdqGoEkojv9ps9DWL8RFz/4TjdYggmwg7CSxpb4Q2YPsYNWKoY+0qgp1OANoP2K7P
	tKGPxvvHoDUW2/9lwT1LtdC5Ai7yMage97wpvKvb8de5k6AEFOp46s/Y7qiB0lWD7i9P
	/42riKL5CL31fepzAzRg5/vQI5pTAdtOL9nCKPbuF+nzWEVEmFibiiwO2JFnY5h0hTol
	hTIvkpox5QHZ6drtknZ5X28OoTOnyuqAkx1tgCyVjSDxvl0Xh0ZctwzjLnfrds0Borhi
	aCNA==
Received: by 10.68.235.2 with SMTP id ui2mr14386329pbc.163.1355483097215;
	Fri, 14 Dec 2012 03:04:57 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id rk17sm2777506pbb.3.2012.12.14.03.04.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 03:04:54 -0800 (PST)
Date: Fri, 14 Dec 2012 12:05:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121214110507.GB8699@jama.jama.net>
References: <3145293.jEgb7vZ7zI@helios> <20121213232058.GA5567@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20121213232058.GA5567@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: OE-Classic patches in patchwork
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
X-List-Received-Date: Fri, 14 Dec 2012 11:19:34 -0000
X-Groupsio-MsgNum: 42164
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline

--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2012 at 12:20:58AM +0100, Martin Jansa wrote:
> On Tue, Dec 04, 2012 at 06:11:22PM +0000, Paul Eggleton wrote:
> > Hi all,
> >=20
> > There is a significant volume of patches in the OE patchwork [1] that a=
re=20
> > intended to apply to OE-Classic. Apart from the 2011.3-maintenance bran=
ch, OE-
> > Classic is no longer maintained in favour of OE-Core + layers, so the q=
uestion=20
> > is what should we do with these patches? At the moment I'm thinking we =
should=20
> > just mark them as "archived" so that they disappear from the queue; peo=
ple can=20
> > still get access to them if needed.
> >=20
> > Thoughts?
>=20
> There is also 70 patches from chase maupin just updating LICENSE to
> contain also version.
>=20
> I'm not using oe-classic anymore, but I believe he prepared them
> carefully and it's worth merging.
>=20
> I'll create bundle from it and apply it tomorrow if nobody objects.

Can we fix patchwork to show bundles marked as public to public users?

I've few bundles
Name	Project	Public Link	Patches	Download	Delete
in-test		oe	http://patches.openembedded.org/bundle/jama/in-test/	21	=09
oe-classic	oe 	http://patches.openembedded.org/bundle/jama/oe-classic/	61	=
=09
oe-classic-lic	oe 	http://patches.openembedded.org/bundle/jama/oe-classic-l=
ic/	70	=09
2011.03-maintenance oe	http://patches.openembedded.org/bundle/jama/2011.03-=
maintenance/	1	=09
denzil		oe	http://patches.openembedded.org/bundle/jama/denzil/	6	=09
danny		oe	http://patches.openembedded.org/bundle/jama/danny/	5	=09
meta-handheld	oe	http://patches.openembedded.org/bundle/jama/meta-handheld/=
	1	=09
meta-java	oe	http://patches.openembedded.org/bundle/jama/meta-java/	15	=09
meta-opie	oe	http://patches.openembedded.org/bundle/jama/meta-opie/	1	=09

But without sharing link to bundle, nobody will find it (AFAIK) maybe
there is newer version of Patchwork which shows public bundles
somewhere?

oe-classic bundle is now marked as archived - so not listed by default.
oe-classic-lic also marked as archived and I'll apply it later today.

It would be great if we agree to mark patches as archived when they get ass=
igned=20
to some bundle to keep main patchwork list relatively clean and layer/relea=
se=20
maintainers can still see all patches with "New" state in corresponding bun=
dle.

I've also marked some patches with review comments without reply as
"Changes requested" + archived. Pity that some patches had rather
trivial issues, but submitter never responded with v2..

And there were some patches for oe-core already applied in oe-core.. so
marked as "Not applicable" + archived.

I'm testing few more patches from PW in world build, some with small modifi=
cations:
pick ba53658 udev: remove from meta-oe
pick 04c9cd0 modemmanager: update to 0.6.0.0
pick 00d02ae samba: added gnu-configize for AArch64 support
pick e793760 dialog: added gnu-configize for AArch64 support
pick c1d541c xterm: added gnu-configize for AArch64 support
pick 1bc2922 florence: added gnome-doc-utils and libnotify to dependencies
pick 66b86e2 meta-oe: Fix erroneous use of "startline" in LIC_FILES_CHKSUM
pick 0caaf89 meta-networking: Fix erroneous use of "startline" in LIC_FILES=
_CHKSUM
pick 36d093e libnl: remove
pick a8f4d0c gtk+3: add libxi dependency
pick 7506e1c libsdl-image: update to upstream version 1.2.12
pick 0480f25 samba: Fix build on Fedora 17
pick 437acf3 fakeroot: update to upstream version 1.18.4
pick 852e1cf python-numpy: add missing runtime dependencies
pick c538fa9 geos: add recipe
pick 56fe334 libspatialite: add recipe
pick f0f428e wpa-supplicant, gcc-common-4.6, packagegroup-qte-toolchain-tar=
get: use correct PRINC form
pick a254473 lua: update to upstream version 5.1.5
pick a89eaca postgresql: disable spinlocks for AArch64
pick 5f1b851 libgcc: s/virtclass/class/ to make it up-to-date
pick 62895de gcc-cross-canadian 4.6: fix dependencies to be nativesdk-* not=
 *-nativesdk
pick e0f0453 Add recipe for krb5

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDLB+MACgkQN1Ujt2V2gBzI5ACeId3/OWl8HhnLE8hIn5TYnTuk
k84AnjiB0hT/NbXRshziAoXhBxvFemEn
=JaAn
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
