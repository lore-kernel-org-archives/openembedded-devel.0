Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVOfI-0005fH-LE
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Nov 2011 15:28:08 +0100
Received: by bkbzs2 with SMTP id zs2so9413849bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2011 06:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZsWpbPDoQbVz3KxuNnvQ20Ev1vYBka5Y6bkj4kS2WZA=;
	b=Gg2RfiZioLuznZ681bYfe/Z29RRw200L8+RvJQ7AN0wXhCAUQ7oGxx8qKS9HI9y/rO
	rAH+8QaprGb89ZDAI8mgCipGZ+01bxsZFH66yAlYrmZcHwNb+NrOPyTZOK+JsBBnm5A5
	ZHccHIsklXMcEA/P+DXAxjlyttXwsbDEWdZj4=
Received: by 10.204.156.218 with SMTP id y26mr49647163bkw.103.1322576489748;
	Tue, 29 Nov 2011 06:21:29 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c4sm37319502bkk.13.2011.11.29.06.21.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 06:21:26 -0800 (PST)
Date: Tue, 29 Nov 2011 15:21:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111129142114.GG7441@jama.jama.net>
References: <cover.1320860740.git.Martin.Jansa@gmail.com>
	<15e1d24dd8ceb0b5caad096f215a3ace86f6c14d.1320860740.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <15e1d24dd8ceb0b5caad096f215a3ace86f6c14d.1320860740.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe 3/4] libsdl-x11: drop from meta-oe
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
X-List-Received-Date: Tue, 29 Nov 2011 14:28:08 -0000
X-Groupsio-MsgNum: 35717
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w/VI3ydZO+RcZ3Ux"
Content-Disposition: inline

--w/VI3ydZO+RcZ3Ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2011 at 06:47:55PM +0100, Martin Jansa wrote:
> * there is libsdl in oe-core and nothing depends on libsdl-x11 here
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

finally this can go in and I'll resend updated mplayer patches with next
pull request.

Cheers,


--w/VI3ydZO+RcZ3Ux
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7U6loACgkQN1Ujt2V2gBxqYQCfeb4yrz4Nr6TwU0bWA2SbB3PU
s8EAn1+nqoJQbKXaCQc7/GP50yXI+F84
=Mwop
-----END PGP SIGNATURE-----

--w/VI3ydZO+RcZ3Ux--
