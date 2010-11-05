Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PEMPm-0006ub-I4 for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 14:33:10 +0100
Received: from f053040076.adsl.alicedsl.de ([78.53.40.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PEMOx-0004Yq-LQ for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 13:32:19 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CD3D68A.9040704@eukrea.com>
References: <AANLkTikEvXr_vz+_uy871SM1B5SS=e6kb62sPyt-4GaD@mail.gmail.com>
	<20101104220649.GE28852@denix.org> <4CD3349D.6060904@eukrea.com>
	<20101104224752.GH28852@denix.org> <20101105065240.GI3440@jama>
	<4CD3CCDE.3080306@eukrea.com> <20101105094915.GM3440@jama>
	<4CD3D68A.9040704@eukrea.com>
Date: Fri, 05 Nov 2010 14:32:18 +0100
Message-ID: <1288963938.3826.20.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded Release 2010.12 --- needs your help!
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
X-List-Received-Date: Fri, 05 Nov 2010 13:33:11 -0000
X-Groupsio-MsgNum: 25905
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-76EXjTXoBr9jz58VEtwp"

--=-76EXjTXoBr9jz58VEtwp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


Am Freitag, den 05.11.2010, 11:03 +0100 schrieb Eric B=C3=A9nard:

> Le 05/11/2010 10:49, Martin Jansa a =C3=A9crit :
> >>> I know it could lower number of people using this future release bran=
ch
> >>> during testing period before release, but still seems better then pus=
hing 3
> >>> weeks of commits from my local branch as soon as release is branched =
and
> >>> master open for new recipes again.
> >
> >> That's the way linux, u-boot&  co are running and when the new merge w=
indow
> >> opens several thousand of patches can be merged in a few days.
> >
> > And also why there is linux-next, but I agree that in our scale we can =
keep new
> > recipes and features in local checkouts/out-of-tree branches without to=
o
> > much pain in merging them after 3 weeks.
>
> a temporary next branch could be open to host new big patches and then me=
rged=20
> to master once stable is out.

I certainly would encourage to push your changes to the OE repository as
soon as possible to share your work so other can use it or improve it.
Be it `master` or some different branch.

> This way most peoples getting oe during the stabilization period will get=
=20
> master and will test it and developers will be able to follow their=20
> development in the next branch.
> I think that during this stabilization weeks, developers have to do the e=
ffort=20
> to checkout the next branch if they want to work on it and user must get =
the=20
> master branch being stabilized as a default, but not the reverse.

I guess both sides have good arguments. I would decide on what the
documentation suggests to beginners and new contributors. If it suggests
that `master` is the development branch new contributions should be
based on, I suggest to create a new branch for the next stable release.
If the documentation suggests something different, then the next stable
release can be based on the master branch.

In either case the documentation has to be correct or needs to be
updated to reflect the changes.


Thanks,

Paul

--=-76EXjTXoBr9jz58VEtwp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzUB2IACgkQPX1aK2wOHVjvuACgjTTpRYrGqaPcEdVDT58bSEeW
TTgAnRRpLD06oluv45nCxAO60FBzKnmI
=VdKT
-----END PGP SIGNATURE-----

--=-76EXjTXoBr9jz58VEtwp--
