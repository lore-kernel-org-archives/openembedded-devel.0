Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Trpai-00054j-CX
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 13:44:41 +0100
Received: by mail-pa0-f52.google.com with SMTP id fb1so10095893pad.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 04:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cMKR+klo+/wOA5cgpNUBlaH/inbcYcdl0IQBxQY5xQI=;
	b=xFk8yDOgIsieEqrv0MwWDRi6uKMMcybU1JnZjK94ByuWKAYZYzMe37LvpZd4Se+9qV
	0I2NV2pSSoLNHXPpr2aO3cJdoJcTjwzQiBTt/YAhfgIfST7g0OpVv+WHuL+Ro/Uv+ui9
	GilOxCe6kEfbJOUVzdpuvtlemJq2Z4N/SAOYmFHP4109isfAsIcq/CAvJerNtEnqZtzu
	LGsQaHUMkkJpDiovdjzESBBJqYr1DSI/5q4/mMI9gVQ8NSsVC912jwfq6ZhtD+gtLcZQ
	CV16DQVCnUw2o8OlmNQaQ5o7BOXABSrX0PP9TDnW18S53lS8t/Wki7yncgAxGStr5DWF
	YDDA==
X-Received: by 10.68.242.3 with SMTP id wm3mr178573878pbc.44.1357475371967;
	Sun, 06 Jan 2013 04:29:31 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id j8sm36771733paz.30.2013.01.06.04.29.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 04:29:30 -0800 (PST)
Date: Sun, 6 Jan 2013 13:29:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130106122930.GH3272@jama>
References: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-xfce/meta-gnome/V2 00/10] various updates
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
X-List-Received-Date: Sun, 06 Jan 2013 12:44:48 -0000
X-Groupsio-MsgNum: 42535
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h3LYUU6HlUDSAOzy"
Content-Disposition: inline

--h3LYUU6HlUDSAOzy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 02, 2013 at 04:16:04PM +0100, Andreas M=FCller wrote:
> V1->V2:
>=20
> * mousepad: add gtksourceview2 to depends
> * exo: correct version 0.10.2 in commit message
> * xfce4-terminal: V1 was 0.6.0 / V2 is 0.6.1

Merged, thanks!


--h3LYUU6HlUDSAOzy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDpbioACgkQN1Ujt2V2gBzRMwCfa3CN7lC4j6b/bbjLFkRPtp6A
vwYAni7aHb82TWIRbrY7SQRYdk2hEC1L
=DT+o
-----END PGP SIGNATURE-----

--h3LYUU6HlUDSAOzy--
