Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tn9o9-0004Jo-OZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Dec 2012 16:19:14 +0100
Received: by mail-ee0-f49.google.com with SMTP id c4so3521720eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2012 07:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=mNrL6tYhaoxyh71V38Cb+baDBzkuyxAAZFEkqqZU40g=;
	b=0VXBVLrRTMB4IRL55mn26V8Af5dP2RA8njgkuTcvL3iG7RyPn50RSmuGw/vVfWJUQO
	+l3NsBlD7cMlZmSuLsAIKIMq9OrOk3Gxz5OcNxWe9sq0adwe9GqP7JwSoFZBB8VmnOI9
	jzreAixuIpaqraug1wFm2RdHnr3hqpD/CJzqZbiaueNeCKOvDy/n1HvyW6GdTO8stRiH
	ZcwKUQQKi8RtQaPa8wt/Aa5pyp6u+DGc5lOyEdAS6yxtnvtQCskcsdiy3A7jy9yj6MX6
	wTmd//qTaYXCnr6mSEW4E5MPvSv3+4ew1DfNAa534eyNLaJIn9fPDuXcb8V1kArocNIG
	d2cw==
X-Received: by 10.14.221.65 with SMTP id q41mr56016758eep.30.1356361463631;
	Mon, 24 Dec 2012 07:04:23 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 43sm41804159eed.10.2012.12.24.07.04.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Dec 2012 07:04:23 -0800 (PST)
Date: Mon, 24 Dec 2012 16:04:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
Message-ID: <20121224150422.GT8988@jama.palm1.palmone.com>
References: <20121220133018.GJ14543@jama.palm1.palmone.com>
	<20121224134637.GJ5270@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20121224134637.GJ5270@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking] patches on patchwork
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
X-List-Received-Date: Mon, 24 Dec 2012 15:19:23 -0000
X-Groupsio-MsgNum: 42407
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wYXww9TlNKyqAMAe"
Content-Disposition: inline

--wYXww9TlNKyqAMAe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 24, 2012 at 08:46:37AM -0500, Joe MacDonald wrote:
> [[meta-networking] patches on patchwork] On 12.12.20 (Thu 14:30) Martin J=
ansa wrote:
>=20
> > Hi, can you check and update patches in meta-networking bundle?
> > http://patches.openembedded.org/bundle/jama/meta-networking/?archive=3D=
both
>=20
> Hmm.  Seems like I don't have access to do anything with patchworks
> except download bundles.  All three currently in the meta-networking
> queue should be rejected.  My old junk from September aren't relevant

OK, I've marked them as rejected.

> now, there's a better approach coming along, and this:
>=20
> http://patches.openembedded.org/patch/38813/

I've noticed this and moved it to meta-webservers bundle, but forgot to
remove it from meta-networking, removed now.

> has simply been miscategorized.  Who can clean up the queue for me?  Or
> can help me figure out how to clean up the queue?

Someone should give maintainer status to your account, not show who has
needed permissions (khem?).

But at least patches which came from the same e-mail as you register
patchwork account should allow you to change status etc.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wYXww9TlNKyqAMAe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDYbvYACgkQN1Ujt2V2gBysRACgiWfrtamjspQasX77gHyKKIsX
ysYAn16NBYQYVDg5oYL+nV3UplcIHDyZ
=GnqS
-----END PGP SIGNATURE-----

--wYXww9TlNKyqAMAe--
