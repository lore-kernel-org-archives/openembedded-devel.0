Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOPUa-0000kr-KO
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 11:00:44 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so4327848wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2012 01:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cp9kMXBjgwaCNZqIYxRxVz5RjzCoGNfWZWnYWuEHkk0=;
	b=YNpu7+ebVnET3PPzr/rJOGvpMgfhiTnd01aXbPWMLhWrmdT65QK7vmstmvILkvX0zM
	WPObXo+Pi+sD59qb1PHz5DTv1426I3cB8H3SVX2ecx80+l2Wuy6b082L0z5Tkec1PSvh
	JXhdtWMfhi0Zt/ds1XZD7w2r6bOmux3i1fTWHa/ripIuLQC/pQ2fx+2Wes6gR690uwFE
	rsbHJetUv12YDz/PhalWKKcngwuCsmF0cIb+UUZXnNsFy09S6i/YBcZPK08b9+wZRSLN
	BIgOW/O4QIsWh6Kl9IVnfIzEM+t8ru/QUWuA9mgZI5HOvGZRhFbnXK13zI1IfcWsZDgn
	cRHA==
Received: by 10.180.93.8 with SMTP id cq8mr2494625wib.16.1350463647011;
	Wed, 17 Oct 2012 01:47:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gm7sm26505811wib.10.2012.10.17.01.47.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 01:47:25 -0700 (PDT)
Date: Wed, 17 Oct 2012 10:47:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121017084734.GG3405@jama.jama.net>
References: <1350462767-3772-1-git-send-email-s.stirtzel@googlemail.com>
	<CAGiJk9dEMv0bUAm2SpjWscpsGV6j1C+q9UzwQ5bdiha2oCoKFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9dEMv0bUAm2SpjWscpsGV6j1C+q9UzwQ5bdiha2oCoKFg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] Maliit: Add initial recipes
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
X-List-Received-Date: Wed, 17 Oct 2012 09:00:44 -0000
X-Groupsio-MsgNum: 41112
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yZnyZsPjQYjG7xG7"
Content-Disposition: inline

--yZnyZsPjQYjG7xG7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 17, 2012 at 10:36:37AM +0200, Samuel Stirtzel wrote:
> 2012/10/17 Samuel Stirtzel <s.stirtzel@googlemail.com>:
>=20
> Strange, I've sent it with
> git send-email --to openembedded-devel@lists.openembedded.org
> --subject-prefix=3Dmeta-oe][PATCH 0001-Maliit-Add-initial-recipes.patch
>=20
> But it still lacks the prefix on patchwork ->
> http://patches.openembedded.org/patch/38195/

--subject-prefix works when you provide git hash of commit you want to
send, not with patches already on disk (then use it for git
format-patch).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yZnyZsPjQYjG7xG7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlB+cKYACgkQN1Ujt2V2gBwMBACgiF2WUG3D9/uVvrheNlc/YNHH
8S4AnA6k5z0gh805/cCITp8GwBDxY7uN
=Zki/
-----END PGP SIGNATURE-----

--yZnyZsPjQYjG7xG7--
