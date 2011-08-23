Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qvk5p-0007kY-Ai
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 08:04:09 +0200
Received: by fxg11 with SMTP id 11so24055fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 22:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=me/30iWZbMaPMG8lKHhYY8aJ/Mmg/QrEcrzulCjeiVo=;
	b=EAuMlhZTu+wGhxXVzejvrPwK1heMCczUK+hyRWZP6k0GKtAmxnHypuS06RO4M0ozJj
	zMcFoKU1YYSfHPgCScYoMFyy93Sz7RGe8N+mm/1lz+MVq1bckHHOxVvOEUUibXAlsnZK
	TUhacKxkEd0yNWnGzooB+vXv98UmegUcVWtaM=
Received: by 10.223.28.89 with SMTP id l25mr3149522fac.34.1314079164651;
	Mon, 22 Aug 2011 22:59:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c7sm5675296fac.12.2011.08.22.22.59.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Aug 2011 22:59:23 -0700 (PDT)
Date: Tue, 23 Aug 2011 07:59:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110823055911.GA25052@jama.jama.net>
References: <201101310012.51498.schnitzeltony@gmx.de>
	<1296461709.3922.4.camel@mattotaupa>
	<20110131090826.149890@gmx.net>
	<989A078976CDAD4CB2DC976EEF70E2A5068A53EB@eu2-mail.mgc.mentorg.com>
	<1314003805.12202.14.camel@mattotaupa>
	<j2ucb2$fdd$4@dough.gmane.org>
	<CABcZANne7vwE+OnP4hEkkvCHo=3mo0g8egWe2_S-vPV5PFd-hA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANne7vwE+OnP4hEkkvCHo=3mo0g8egWe2_S-vPV5PFd-hA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] need to add some verfication package recipes
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
X-List-Received-Date: Tue, 23 Aug 2011 06:04:09 -0000
X-Groupsio-MsgNum: 33783
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2011 at 05:59:11PM -0700, Chris Larson wrote:
> On Mon, Aug 22, 2011 at 12:57 PM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
> > Op 22-08-11 11:03, Paul Menzel schreef:
> >
> >> It would be nice if the oe-core folks can comment too in case these re=
cipes should go into oe-core some day.
> >
> > OE-core needs to get smaller, not bigger.
>=20
> Regarding where recipes go, am I the only one that finds the
> recipes-*/ directories just annoying for day to day use? The breakdown
> might make sense from a categorical viewpoint, but as someone looking
> to modify a recipe, it's a crapshoot trying to find anything. I resort
> to shell globbing or find commands, every time.

Me too, first I try to recipes-* where I guess it should be, then find
it with find somewhere else :/. And the same sometimes twice or more
times when I'm not sure if it's oe-core/meta-oe or even meta-gnome or
whatever :/.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEUEARECAAYFAk5TQa8ACgkQN1Ujt2V2gBxt2wCXSTPfMw/AxOcdMbmTXGJoE8u5
aQCguxV8YGOQd9781qkRklIr9p6O6x0=
=EKLa
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
