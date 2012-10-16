Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TO2Vq-0003pV-Cd
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Oct 2012 10:28:30 +0200
Received: by mail-wi0-f169.google.com with SMTP id hq4so498087wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2012 01:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rTey7ykdKpONP989VIlfWMI3xw98zFT9Tn2bBCwkM0s=;
	b=uXsyO/2WleficUG8AfULLOkvEjw1TF1jgAzXazVesKb3chgvcEMiOpC+TDbEvtq8oz
	8crSIEO1JVBIB4cgbe9BhTCbJv9lBvgw9MDL0XgtQAHAsozorfQkWvJxDvNfgoYlwlIY
	LQaxA1ni2r51OXTugLcbs6qmPeOPLlImkIwm91Al6XNKvEwa5fIcB53XUIkEUi1L3vA1
	qcwFiRwDWKPAJb/9OCzuxq6DbOqEsmCMGVfqbq56oaG2L7Ft8cDabhmTqiJZ54jIfUD9
	PEEKB82zXGw5iEKi2E6MsU8xEbyfb4P3jMF2PFYFXqNhIdwxbOQ4cg8qBI+XDGoPxdRB
	sokw==
Received: by 10.216.211.106 with SMTP id v84mr9303333weo.145.1350375313875;
	Tue, 16 Oct 2012 01:15:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ay10sm20513205wib.2.2012.10.16.01.15.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Oct 2012 01:15:12 -0700 (PDT)
Date: Tue, 16 Oct 2012 10:15:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121016081518.GA3796@jama.jama.net>
References: <1349166535-14325-1-git-send-email-s.stirtzel@googlemail.com>
	<CAGiJk9d6WTiaxG5Y=6MLQ0Wh+C+oXLPFV0h7buB+GtBPhcZfJA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9d6WTiaxG5Y=6MLQ0Wh+C+oXLPFV0h7buB+GtBPhcZfJA@mail.gmail.com>
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
X-List-Received-Date: Tue, 16 Oct 2012 08:28:30 -0000
X-Groupsio-MsgNum: 41091
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline

--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2012 at 10:10:37AM +0200, Samuel Stirtzel wrote:
> 2012/10/2 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> Ping,
>=20
> anything wrong with this patch, or is it just a general "before
> release stagnation"?

It's probably because of general "before submit read README".

Read README and send with right subject prefix.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlB9F5YACgkQN1Ujt2V2gByyUACfQ29y4IiYlGCB7iF7FnNt7LRP
0zwAnjm8Xrtovu1fx4d31vAcvs2H0rag
=qTgW
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
