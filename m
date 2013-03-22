Received: from mail-pd0-f174.google.com ([209.85.192.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIyPS-0007Up-Gw
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 10:37:16 +0100
Received: by mail-pd0-f174.google.com with SMTP id 10so1501030pdi.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 02:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y34eaT9llxHRCUm5Lglxxs6JofV1sSGDF8P0prMy+3o=;
	b=ry/frbwThkppV4hnsWYVbd014/8lJ2JlWMzpwb60DV+v9ONCWQF7iif7KRm0V9zoGd
	YY4zdFVsrfOHuQS+oO/Bp3Q03PRtsXnFiOJOR+VlnxGsq8nlc/adCTMzFpipG9wdBP7/
	iIWc/KJTyzhXOikqER61DTu4oLWMgKKgWaP4KPKwm3Y+tl6frezqNjtrMr8oqeEzjqtz
	r/H0xB4CC+9pnEL0gql6d74qPt/ChrWfwkgYlwlPhDlqqRvwJGOQzDYgdGezz8sR9UXl
	jmetWfQSvtMIbUYYRfz4JystXm69KhMobrKHLDa7r1W8E7i5qDLHP5Gu3Qzn0wX8Woa+
	55Uw==
X-Received: by 10.68.179.67 with SMTP id de3mr1490823pbc.130.1363944020301;
	Fri, 22 Mar 2013 02:20:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pg7sm1754629pbc.5.2013.03.22.02.20.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:20:19 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:20:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322092017.GI3219@jama>
References: <1363770728-21218-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1363770728-21218-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-browser][PATCH] libxi: Rename bbappend to match oe-core
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
X-List-Received-Date: Fri, 22 Mar 2013 09:37:17 -0000
X-Groupsio-MsgNum: 43650
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3eH4Qcq5fItR5cpy"
Content-Disposition: inline

--3eH4Qcq5fItR5cpy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2013 at 02:12:08AM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../{libxi_1.6.1.bbappend =3D> libxi_1.7.bbappend}   |    0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-graphics/libxi/{libxi_1.6.1.bbappend =3D> libxi_1.7.bbapp=
end} (100%)
>=20
> diff --git a/recipes-graphics/libxi/libxi_1.6.1.bbappend b/recipes-graphi=
cs/libxi/libxi_1.7.bbappend
> similarity index 100%
> rename from recipes-graphics/libxi/libxi_1.6.1.bbappend
> rename to recipes-graphics/libxi/libxi_1.7.bbappend

Same patch was already applied, but thanks.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3eH4Qcq5fItR5cpy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMIlEACgkQN1Ujt2V2gBz9yACcDMcF5sGu69/qyFiiqAEsal+T
5WEAoJ9Luo/OHiFw0yXFvqxW+kQxNimo
=1YZU
-----END PGP SIGNATURE-----

--3eH4Qcq5fItR5cpy--
