Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9594665DA3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 23:45:30 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y5k0A-00035s-LE from Joe_MacDonald@mentor.com ;
	Mon, 29 Dec 2014 15:45:30 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Dec 2014 15:45:30 -0800
Received: by burninator (Postfix, from userid 1000)	id 4F726580F6D; Mon, 29
	Dec 2014 18:45:23 -0500 (EST)
Date: Mon, 29 Dec 2014 18:45:23 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20141229234522.GA6662@mentor.com>
References: <BLU437-SMTP103211CFEBAA0286655746D6560@phx.gbl>
	<CAL0pqZ3JaOtsf7O3949Covz+eML93WWyHG4YkNZY+NkXA60XYg@mail.gmail.com>
	<20141229185352.GM2465@jama> <20141229185920.GA4672@mentor.com>
	<20141229192727.GN2465@jama> <20141229194103.GB4672@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20141229194103.GB4672@mentor.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] cyassl: add version 3.3.0, remove version 3.1.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Dec 2014 23:45:40 -0000
X-Groupsio-MsgNum: 53521
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline

--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH v2] cyassl: add version 3.3.0, remove ver=
sion 3.1.0] On 14.12.29 (Mon 14:41) Joe MacDonald wrote:

> [Re: [oe] [meta-networking][PATCH v2] cyassl: add version 3.3.0, remove v=
ersion 3.1.0] On 14.12.29 (Mon 20:27) Martin Jansa wrote:
>=20
> > On Mon, Dec 29, 2014 at 01:59:21PM -0500, Joe MacDonald wrote:
> > > Hey Martin,
> > >=20
> > > [Re: [oe] [meta-networking][PATCH v2] cyassl: add version 3.3.0, remo=
ve version 3.1.0] On 14.12.29 (Mon 19:53) Martin Jansa wrote:
> > >=20
> > > > On Mon, Dec 29, 2014 at 11:50:30AM -0700, Leah wrote:
> > > > > I was just wondering if this commit was recieved and/or approved?
> > > >=20
> > > > Received and not yet approved, look at master-next branch.
> > >=20
> > > I generally try to send out a message when I merge anything to
> > > master-next so as to let the submitter know it's been merged.  I do s=
eem
> > > to be in the minority, but if possible it would also help me out if y=
ou
> > > could send an ack when you merge something for meta-networking into
> > > master so I know I can remove it from my working queue.  That usually
> > > only pops up when I've been offline for a few weeks, but it would rea=
lly
> > > help with managing the mail queue.
> >=20
> > You mean when you merge it to master not master-next, right?
>=20
> Yeah, of course.  master-next gets so many updates I don't think mail
> about integration there would be really useful for anyone nor a
> particularly good use of your time.
>=20
> > I usually merge meta-networking changes to master-next only to include
> > them in next jenkins build and then leave them to you to merge them to
> > master when you want (unless I'm reporting build failures caused by
> > them).
>=20
> Yep, I know.  It's very infrequent I run into any new recipes in master.
> That is why I have the occasional 'huh' moment when I'm walking through
> the mail queue, see something new, check master-next for something to
> cherry-pick and find it's already in master.  If I'm trying to clear out
> a backlog, though, just knowing which threads I don't even need to look
> at is a win, for sure.
>=20
> > All merges to master-next are indicated by master-next bundle on
> > patchwork (and Archived status)
> > http://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing_the_=
same_oe_project_on_patchwork
> >=20
> > I would like more people updating status of their patches on patchwork,
> > that includes you marking merged meta-networking patches. After updating
> > 6 cyassl patches on patchwork I don't want to also send another batch of
> > e-mails for the amount of patches going into meta-oe, meta-smartphone,
> > meta-qt5 repos.
>=20
> Understood.  I haven't looked at patchworks in quite some time because I
> was frequently seeing patches on the mailing list that weren't showing
> up there and that didn't seem particularly efficient if everything was
> in my mailbox but some smaller set were in my patchworks queue.  I'll
> make more of an effort to pay attention to it and update status there as
> well.

So I took a bit of time this evening and cleaned out the meta-networking
patch queue here:

http://patchwork.openembedded.org/project/oe/list/?state=3D1&q=3Dmeta-netwo=
rking&archive=3Dboth

I didn't touch the 'dizzy' patches, but other than that I think it now
accurately reflects the state of "not-yet-merged"-ness for master.
There's four patches outstanding there will probably be merged (or
otherwise processed) in the next day or so.

-J.

>=20
> -J.
>=20
> >=20
> > Regards,
> >=20
> > > > > On Mon, Dec 22, 2014 at 2:29 PM, lchristina26 <lchristina26@hotma=
il.com>
> > > > > wrote:
> > > > >=20
> > > > > > Signed-off-by: Leah <lchristina26@hotmail.com>
> > > > > > ---
> > > > > >  .../cyassl/{cyassl_3.1.0.bb =3D> cyassl_3.3.0.bb}             =
       | 7
> > > > > > ++++---
> > > > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > > >  rename meta-networking/recipes-connectivity/cyassl/{cyassl_3.1=
=2E0.bb =3D>
> > > > > > cyassl_3.3.0.bb} (74%)
> > > > > >
> > > > > > diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl=
_3.1.0.bb
> > > > > > b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> > > > > > similarity index 74%
> > > > > > rename from meta-networking/recipes-connectivity/cyassl/cyassl_=
3.1.0.bb
> > > > > > rename to meta-networking/recipes-connectivity/cyassl/cyassl_3.=
3.0.bb
> > > > > > index e3edab6..b6f852d 100644
> > > > > > --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.=
bb
> > > > > > +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.=
bb
> > > > > > @@ -1,4 +1,4 @@
> > > > > > -SUMMARY =3D "CyaSSL Embedded SSL Library"
> > > > > > +SUMMARY =3D "CyaSSL Lightweight, Embedded SSL Library"
> > > > > >  DESCRIPTION =3D "CyaSSL is a lightweight SSL library written i=
n C and \
> > > > > >                 optimized for embedded and RTOS environments. I=
t can be \
> > > > > >                 Up to 20 times smaller than OpenSSL while still=
 supporting
> > > > > > \
> > > > > > @@ -11,7 +11,8 @@ LIC_FILES_CHKSUM =3D
> > > > > > "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> > > > > >
> > > > > >  SRC_URI =3D "http://www.yassl.com/${BP}.zip"
> > > > > >
> > > > > > -SRC_URI[md5sum] =3D "72477eb50697e759d309c49cb1aef18a"
> > > > > > -SRC_URI[sha256sum] =3D
> > > > > > "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2adc16d2507b5d0b0=
3e"
> > > > > > +SRC_URI[md5sum] =3D "0303eb0f2f9065a1207d9104ab0eba7c"
> > > > > > +SRC_URI[sha256sum] =3D
> > > > > > "e51583ea1e4d64537553922d67a96360312811dffef58d4c05506aa98a296f=
e3"
> > > > > >
> > > > > >  inherit autotools
> > > > > > +
> > > > > > --
> > > > > > 1.9.1
> > > > > >
> > > > > > --
> > > > > > _______________________________________________
> > > > > > Openembedded-devel mailing list
> > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-dev=
el
> > > > > >
> > > > > >
> > > > >=20
> > > > >=20
> > > > > --=20
> > > > >=20
> > > > > Leah Thompson
> > > > > www.wolfssl.com
> > > > > leah@wolfssl.com
> > > > > 406-570-1389
> > > > > Skype: lchristina26
> > > > > --=20
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >=20
> > > > --=20
> > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >=20
> > >=20
> > >=20
> > > --=20
> > > -Joe MacDonald.
> > > :wq
> >=20
> >=20
> >=20
> --=20
> -Joe MacDonald.
> :wq



--=20
-Joe MacDonald.
:wq

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUoeePAAoJEEn8ffcsOfaW7JYH/Rv8RB4JGMNcTwGDElzDbOg9
FBLNo/5JOuydJc3Xdzw5pq5GtL6jF74VeZzRyd8g8KpWheyNePZgSAYpurdxAHH8
h/8qLW9uMuzNxB8Q5umVapLpDyUx78LVEKlw98PzymZLlTuUMi21LZiFjpcHQgc8
TpCFuUl4MCEPeV2kDeeoQZ3inrVDjWnjUNC0+WFtQTbAB/Zx/AuJX3BiDyCQn5Ea
lqGliEjNTYLCcKQSxOZzBvJkbw8IdxkLlcW546GD9Ca1Zv0uiVVu7fJ2IxLZ615n
TEX8OgpBBjVSnoY0vZWglv56CEq6QnhRwLJt2bvuhDH8zkrevadnGdAoM+/piac=
=Xgum
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
