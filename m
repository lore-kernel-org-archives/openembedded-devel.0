Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R1z8K-0003YG-3Z
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 13:20:32 +0200
Received: by fxi1 with SMTP id 1so13001fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2011 04:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=b3L2JXZgQBFjROVCjqvTL4kQFJBYUXdfkw5i7yKULUQ=;
	b=W0881OFfO8yuZ7n9O8xDcrMwJx5bFsLzNqbbzbd7jGHxe1eyrAQasL+B+SnMcx1Ddq
	3Up7h5zu3f7s3TPDHK0huAI3I8pVNUb/lu8DID+158U2/ZAvugUss9TJGeWEz9KwmoPm
	i16t/0agivIY8sf5u/1ObimVlPTZLUcyXRsMQ=
Received: by 10.223.101.90 with SMTP id b26mr636012fao.15.1315566927766;
	Fri, 09 Sep 2011 04:15:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a1sm2718018fae.23.2011.09.09.04.15.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Sep 2011 04:15:26 -0700 (PDT)
Date: Fri, 9 Sep 2011 13:15:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110909111519.GG4124@jama.jama.net>
References: <1315434958-5042-1-git-send-email-errordeveloper@gmail.com>
	<1315539201-6902-1-git-send-email-errordeveloper@gmail.com>
	<20110909065128.GA4124@jama.jama.net>
	<CAPhDKbGcJ4sGEWPimfHqxkbZGNBf47uO7=D9RcgSjP9dCB69MQ@mail.gmail.com>
	<20110909110614.GE4124@jama.jama.net>
	<CAPhDKbHT0-HCfGeexqY05W-kd8xx8rMuRcwQRN-uZcM+K2JSUA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPhDKbHT0-HCfGeexqY05W-kd8xx8rMuRcwQRN-uZcM+K2JSUA@mail.gmail.com>
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
X-List-Received-Date: Fri, 09 Sep 2011 11:20:32 -0000
X-Groupsio-MsgNum: 34165
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vJguvTgX93MxBIIe"
Content-Disposition: inline

--vJguvTgX93MxBIIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2011 at 12:09:53PM +0100, Ilya Dmitrichenko wrote:
> On 9 September 2011 12:06, Martin Jansa <martin.jansa@gmail.com> wrote:
> > you should be able to do it yourself if you register on patchwork with
> > the same e-mail as used in your patches..
>=20
> Well, I wish I could. It just doesn't let me with a error message:
> * "This email address is already in use. Please supply a different
> email address."
> * "This username is already taken. Please choose another."
>=20
> Perhaps it did register me by itself, but I just need the password to
> be reset ...

I see, I cannot reset it too for you.. so I will change status of those 4,
but please send updated patch as suggested.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vJguvTgX93MxBIIe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5p9UcACgkQN1Ujt2V2gBysZgCgppim9IY+1LhGNFBribEwoOnz
oGEAn37zp4Z9/1wPPXHVnfsK4/C69Y6U
=mou4
-----END PGP SIGNATURE-----

--vJguvTgX93MxBIIe--
