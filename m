Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id ED0C072392
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 08:25:24 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w62so655874wes.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 00:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DR0vES5gZRI0fGkKKW6uycRwG63i3P+IYZhOsL2Eg9Y=;
	b=IGuomNwFeI2kbTdutSnEqBAdVokBFY1v3a/10/xbTEVKKncxm0nyQImUwwJHvyD5zd
	Wu+fHq3fSSo3LWowgb0bFuEJ6k5ZsWHpyhrLtIrDRXVQXoRF6CITk2ZlLkO4sjFormNw
	An0f9uwG0N++HifoDU2RyuDgkrPTnlWZs97XelOO8T352N7YGalw2nSKS2UNydoAIA+p
	Hc8NpAFYk2iWC1ZBJJ3iYOCcwh/7DGVzATCeZABtXHm/GZBiwgxmy4J58QUbKZgdYbh1
	sniYh0692bD9C5aC9ocY1tnQKZKv1yP1Q1DCznGlPfYME4YYD4AQfPpa6B9c9FUd3KqM
	DhKQ==
X-Received: by 10.180.107.70 with SMTP id ha6mr4169029wib.71.1419927924531;
	Tue, 30 Dec 2014 00:25:24 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u13sm50102758wjr.26.2014.12.30.00.25.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 00:25:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 30 Dec 2014 09:25:24 +0100
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20141230082524.GA2469@jama>
References: <BLU437-SMTP103211CFEBAA0286655746D6560@phx.gbl>
	<CAL0pqZ3JaOtsf7O3949Covz+eML93WWyHG4YkNZY+NkXA60XYg@mail.gmail.com>
	<20141229185352.GM2465@jama> <20141229185920.GA4672@mentor.com>
	<20141229192727.GN2465@jama> <20141229194103.GB4672@mentor.com>
	<20141229234522.GA6662@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20141229234522.GA6662@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Tue, 30 Dec 2014 08:25:29 -0000
X-Groupsio-MsgNum: 53524
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2014 at 06:45:23PM -0500, Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH v2] cyassl: add version 3.3.0, remove v=
ersion 3.1.0] On 14.12.29 (Mon 14:41) Joe MacDonald wrote:
>=20
> > [Re: [oe] [meta-networking][PATCH v2] cyassl: add version 3.3.0, remove=
 version 3.1.0] On 14.12.29 (Mon 20:27) Martin Jansa wrote:
> >=20
> > > On Mon, Dec 29, 2014 at 01:59:21PM -0500, Joe MacDonald wrote:
> > > > Hey Martin,
> > > >=20
> > > > [Re: [oe] [meta-networking][PATCH v2] cyassl: add version 3.3.0, re=
move version 3.1.0] On 14.12.29 (Mon 19:53) Martin Jansa wrote:
> > > >=20
> > > > > On Mon, Dec 29, 2014 at 11:50:30AM -0700, Leah wrote:
> > > > > > I was just wondering if this commit was recieved and/or approve=
d?
> > > > >=20
> > > > > Received and not yet approved, look at master-next branch.
> > > >=20
> > > > I generally try to send out a message when I merge anything to
> > > > master-next so as to let the submitter know it's been merged.  I do=
 seem
> > > > to be in the minority, but if possible it would also help me out if=
 you
> > > > could send an ack when you merge something for meta-networking into
> > > > master so I know I can remove it from my working queue.  That usual=
ly
> > > > only pops up when I've been offline for a few weeks, but it would r=
eally
> > > > help with managing the mail queue.
> > >=20
> > > You mean when you merge it to master not master-next, right?
> >=20
> > Yeah, of course.  master-next gets so many updates I don't think mail
> > about integration there would be really useful for anyone nor a
> > particularly good use of your time.
> >=20
> > > I usually merge meta-networking changes to master-next only to include
> > > them in next jenkins build and then leave them to you to merge them to
> > > master when you want (unless I'm reporting build failures caused by
> > > them).
> >=20
> > Yep, I know.  It's very infrequent I run into any new recipes in master.
> > That is why I have the occasional 'huh' moment when I'm walking through
> > the mail queue, see something new, check master-next for something to
> > cherry-pick and find it's already in master.  If I'm trying to clear out
> > a backlog, though, just knowing which threads I don't even need to look
> > at is a win, for sure.
> >=20
> > > All merges to master-next are indicated by master-next bundle on
> > > patchwork (and Archived status)
> > > http://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing_th=
e_same_oe_project_on_patchwork
> > >=20
> > > I would like more people updating status of their patches on patchwor=
k,
> > > that includes you marking merged meta-networking patches. After updat=
ing
> > > 6 cyassl patches on patchwork I don't want to also send another batch=
 of
> > > e-mails for the amount of patches going into meta-oe, meta-smartphone,
> > > meta-qt5 repos.
> >=20
> > Understood.  I haven't looked at patchworks in quite some time because I
> > was frequently seeing patches on the mailing list that weren't showing
> > up there and that didn't seem particularly efficient if everything was
> > in my mailbox but some smaller set were in my patchworks queue.  I'll
> > make more of an effort to pay attention to it and update status there as
> > well.
>=20
> So I took a bit of time this evening and cleaned out the meta-networking
> patch queue here:
>=20
> http://patchwork.openembedded.org/project/oe/list/?state=3D1&q=3Dmeta-net=
working&archive=3Dboth
>=20
> I didn't touch the 'dizzy' patches, but other than that I think it now
> accurately reflects the state of "not-yet-merged"-ness for master.
> There's four patches outstanding there will probably be merged (or
> otherwise processed) in the next day or so.

Thanks, now I can add meta-networking patches to meta-networking bundle
instead of master-next (even when I will also include them in
master-next branch).

> > -J.
> >=20
> > >=20
> > > Regards,
> > >=20
> > > > > > On Mon, Dec 22, 2014 at 2:29 PM, lchristina26 <lchristina26@hot=
mail.com>
> > > > > > wrote:
> > > > > >=20
> > > > > > > Signed-off-by: Leah <lchristina26@hotmail.com>
> > > > > > > ---
> > > > > > >  .../cyassl/{cyassl_3.1.0.bb =3D> cyassl_3.3.0.bb}           =
         | 7
> > > > > > > ++++---
> > > > > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > > > >  rename meta-networking/recipes-connectivity/cyassl/{cyassl_3=
=2E1.0.bb =3D>
> > > > > > > cyassl_3.3.0.bb} (74%)
> > > > > > >
> > > > > > > diff --git a/meta-networking/recipes-connectivity/cyassl/cyas=
sl_3.1.0.bb
> > > > > > > b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> > > > > > > similarity index 74%
> > > > > > > rename from meta-networking/recipes-connectivity/cyassl/cyass=
l_3.1.0.bb
> > > > > > > rename to meta-networking/recipes-connectivity/cyassl/cyassl_=
3.3.0.bb
> > > > > > > index e3edab6..b6f852d 100644
> > > > > > > --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.=
0.bb
> > > > > > > +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.=
0.bb
> > > > > > > @@ -1,4 +1,4 @@
> > > > > > > -SUMMARY =3D "CyaSSL Embedded SSL Library"
> > > > > > > +SUMMARY =3D "CyaSSL Lightweight, Embedded SSL Library"
> > > > > > >  DESCRIPTION =3D "CyaSSL is a lightweight SSL library written=
 in C and \
> > > > > > >                 optimized for embedded and RTOS environments.=
 It can be \
> > > > > > >                 Up to 20 times smaller than OpenSSL while sti=
ll supporting
> > > > > > > \
> > > > > > > @@ -11,7 +11,8 @@ LIC_FILES_CHKSUM =3D
> > > > > > > "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> > > > > > >
> > > > > > >  SRC_URI =3D "http://www.yassl.com/${BP}.zip"
> > > > > > >
> > > > > > > -SRC_URI[md5sum] =3D "72477eb50697e759d309c49cb1aef18a"
> > > > > > > -SRC_URI[sha256sum] =3D
> > > > > > > "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2adc16d2507b5d0=
b03e"
> > > > > > > +SRC_URI[md5sum] =3D "0303eb0f2f9065a1207d9104ab0eba7c"
> > > > > > > +SRC_URI[sha256sum] =3D
> > > > > > > "e51583ea1e4d64537553922d67a96360312811dffef58d4c05506aa98a29=
6fe3"
> > > > > > >
> > > > > > >  inherit autotools
> > > > > > > +
> > > > > > > --
> > > > > > > 1.9.1
> > > > > > >
> > > > > > > --
> > > > > > > _______________________________________________
> > > > > > > Openembedded-devel mailing list
> > > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-d=
evel
> > > > > > >
> > > > > > >
> > > > > >=20
> > > > > >=20
> > > > > > --=20
> > > > > >=20
> > > > > > Leah Thompson
> > > > > > www.wolfssl.com
> > > > > > leah@wolfssl.com
> > > > > > 406-570-1389
> > > > > > Skype: lchristina26
> > > > > > --=20
> > > > > > _______________________________________________
> > > > > > Openembedded-devel mailing list
> > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-dev=
el
> > > > >=20
> > > > > --=20
> > > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > >=20
> > > >=20
> > > >=20
> > > > --=20
> > > > -Joe MacDonald.
> > > > :wq
> > >=20
> > >=20
> > >=20
> > --=20
> > -Joe MacDonald.
> > :wq
>=20
>=20
>=20
> --=20
> -Joe MacDonald.
> :wq



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSiYXQACgkQN1Ujt2V2gBw7OACgoc5E5nM/BOxcqz/9BVslbfYf
ufsAnjncGuoBVeNowzc0dDiIvKBF/sbM
=rqI4
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
