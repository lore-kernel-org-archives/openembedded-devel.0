Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R1yzZ-00034w-Pq
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 13:11:29 +0200
Received: by fxi1 with SMTP id 1so6510fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2011 04:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Umz6Bop67n6AtZtVuQqV3DjFVgepkIaWkagNWtGOP7c=;
	b=azzPcv6GGe9I6ynQoBFTcLcRO/3VlXBnZHuuKO+tdxvwxviVdO2f8j7ZpkBqhOHbv8
	pyagonS3lAsuGsh56qu7iA6k4oR7CB45QfHeavD1ON+/jWHBuCplsu95QPtD6YOKJEDO
	RrnAdAfNBXKxTaKinsv9QQX4LfAuYRlw97w0c=
Received: by 10.223.39.216 with SMTP id h24mr139873fae.31.1315566382204;
	Fri, 09 Sep 2011 04:06:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c2sm2711749faf.16.2011.09.09.04.06.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Sep 2011 04:06:21 -0700 (PDT)
Date: Fri, 9 Sep 2011 13:06:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110909110614.GE4124@jama.jama.net>
References: <1315434958-5042-1-git-send-email-errordeveloper@gmail.com>
	<1315539201-6902-1-git-send-email-errordeveloper@gmail.com>
	<20110909065128.GA4124@jama.jama.net>
	<CAPhDKbGcJ4sGEWPimfHqxkbZGNBf47uO7=D9RcgSjP9dCB69MQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPhDKbGcJ4sGEWPimfHqxkbZGNBf47uO7=D9RcgSjP9dCB69MQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] binutils-2.20.1: fix checksums
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
X-List-Received-Date: Fri, 09 Sep 2011 11:11:29 -0000
X-Groupsio-MsgNum: 34163
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="so9zsI5B81VjUb/o"
Content-Disposition: inline

--so9zsI5B81VjUb/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2011 at 12:03:24PM +0100, Ilya Dmitrichenko wrote:
> Hi,
>=20
> I see what happens now.
>=20
> Ok, someone has committed the right
> changes, could you please delete or
> mark my patches invalid:

that was for 2.21 not 2.20.1..

> http://patches.openembedded.org/patch/11247/
> http://patches.openembedded.org/patch/11245/
> http://patches.openembedded.org/patch/11219/
> http://patches.openembedded.org/patch/11217/

you should be able to do it yourself if you register on patchwork with
the same e-mail as used in your patches..

Regards,

>=20
> Regards,
> --=20
> Ilya
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--so9zsI5B81VjUb/o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5p8yYACgkQN1Ujt2V2gBxEDACbBX4JE9zaQ3NGESX72XBxbsF6
tm4AoJDifrGD9McpUcoZBrDossbpr+DY
=Qij+
-----END PGP SIGNATURE-----

--so9zsI5B81VjUb/o--
