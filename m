Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id DE2A86CE97
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 13:58:31 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so4036531eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 06:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=snNiQpIuMGvGPFhMc84hNFAtA1qRnqFbdTtHl4Zbsm0=;
	b=o7OP+nPtj0OPjMZWzpYsBlHej/5hcrrBRYSMVoSM1JYlZ74M8XjTP8d4qk2PvHeUjP
	/KVdrrJOXl/osA13t41kq9yWgPBlqHRr6PKTX78Qkk3AC7JX18oBmSOeunDifIznmD85
	Bd78nidYB3DghRzA9AVD/BjosYAr7ysjsyfAyhM3ozF8zT6JWMQxV8P02PdjoAoZSXUg
	fUAiDDNuNXxHd+HlpknorWOZWnlj0vSv/OpK8OFZ/vraOVMPR9K5vO6BKSmU692e04GO
	llJ2K8LuiAa0ZqYVigl9wy3yfXSWZR7cKHG2vEe4XANgH7z0ZrOiqkKZ2+NoR0CdjGSy
	sQWA==
X-Received: by 10.15.100.198 with SMTP id bn46mr2570127eeb.11.1381240713120;
	Tue, 08 Oct 2013 06:58:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm76243544eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 06:58:32 -0700 (PDT)
Date: Tue, 8 Oct 2013 15:58:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20131008135842.GD2872@jama>
References: <20131007202336.GF18775@denix.org>
	<CAOMwXhMpx8KjDyq_4fD949owFWE8r1O61E7D085+U31=fR5kNg@mail.gmail.com>
	<20131007203527.GG18775@denix.org>
	<CAOMwXhORbuT7J8B6evLhcJSx2Z8BUCoAeXKGDe=twQsuY-wtOQ@mail.gmail.com>
	<20131008132109.GA22340@denix.org>
	<CAOMwXhN4C=Lob8ow9utU6hnqDOUjpt=PGj+Rp6W-pbnY5uky1g@mail.gmail.com>
	<20131008132609.GB22340@denix.org>
	<CAOMwXhP_EobkzYT91BQGLjqWWOtsvTwzYSPk9MJHsMRm1q7otQ@mail.gmail.com>
	<20131008133918.GB2872@jama>
	<CAOMwXhOwkTL7KbGcvDrtaBru7Se4hpQpVZ91L2yj7Q15xZcg7g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMwXhOwkTL7KbGcvDrtaBru7Se4hpQpVZ91L2yj7Q15xZcg7g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] Update to 5.1.1?
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
X-List-Received-Date: Tue, 08 Oct 2013 13:58:34 -0000
X-Groupsio-MsgNum: 46555
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FFoLq8A0u+X9iRU8"
Content-Disposition: inline

--FFoLq8A0u+X9iRU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2013 at 02:50:59PM +0100, Laszlo Papp wrote:
> On Tue, Oct 8, 2013 at 2:39 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>=20
> > On Tue, Oct 08, 2013 at 02:30:05PM +0100, Laszlo Papp wrote:
> > > On Tue, Oct 8, 2013 at 2:26 PM, Denys Dmytriyenko <denis@denix.org>
> > wrote:
> > > > Since Dora is a branch of meta-qt5, I don't understand your stateme=
nts
> > > > about
> > > > being orthogonal and not integrated...
> > > >
> > >
> > > You will be able to use *any* meta-qt5 on top of Dora, just as you can
> > use
> > > meta-qt5 on top of denzil nowadays. The "dora branching" sounds like =
red
> > > herring to me. The dependencies in Dora will be good enough for 1-2
> > years,
> > > if not much more.
> >
> > That's not true, we were just lucky that there weren't any incompatible
> > changes in oe-core, but as soon as 1.6. brings e.g. new cmake, master
> > branch will work only with master and dora only with dora (because of
> > .bbappend).
> >
>=20
> I am not sure who it is not true. Qt has been working for me, and even if
> there are small quirks, they community can and will provide changes. Even
> if they could not, they can use .bbappend, and custom changes for any
> recipes. That is the strength of open embedded after all. It is very
> unlikely that everyone will always like every package.

That's basically what I said, if they use unsupported combination, they
can expect that they will maybe need to resolve some quirks on their
own.

>  So the same branch names are the only supported combination, if you want
>=20
> > to use meta-qt5/master with oe-core/dylan then you're on your own. It
> > works now, but only because we're lucky.
> >
>=20
> IMO, this is unreasonable. It will cause additional overhead and looking =
at
> the manpower behind this layer, I am not really sure it is worth it.
> Quality should be over quantity. Maintaining several branches rather than
> just having one and well-qualified branch for starter would be more
> fruitful in my opinion.

Everything goes to master first, bugfixes can go also to release
branches which track older oe-core releases, the same rules which apply
to meta-oe and other layers apply here.

> > > 5.2 comes with several fundamental improvements. I would not personal=
ly
> > > recommend Qt 5.1 to anyone in about two months time when the release =
can
> > > happen. :)
> >
> > There are companies still using 5.0.0 just because they fear to upgrade
> > or because newer qt versions were released to late for their release
> > cycle of real hw products. I agree that it would be nice for everybody
> > to just use latest, but there are still meta-qt5 users which cannot do
> > that.
> >
>=20
> So what? They can always use bbappend, own packages, old branches, etc.
> That should be in no way obstacle for new innovation.

Yes, that's why meta-qt5 will exist in "old branch" for each oe-core
release and such branches will get only bug fixes, because people who
cannot upgrade oe-core to latest probably don't want to upgrade qt5 to
latest as well.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FFoLq8A0u+X9iRU8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJUD5IACgkQN1Ujt2V2gBxoTACfUJHxT2FuQBrxOfaUZQN/yPF+
QJsAnjfn7UJ4960oeIMaGbcIkwG0I7xR
=Q3Ji
-----END PGP SIGNATURE-----

--FFoLq8A0u+X9iRU8--
