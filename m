Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbUdA-00020q-TI
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 12:07:42 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so4427940eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 02:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D16+Rrlg/rx/yfJrrd+HBMjxF8lGy+O8p0F7Hs5RS+k=;
	b=hlICzJ19X+0La2o6t63ZMojC6hOUr0XAVAILc6fqrcvJjJJ5h21eyirnME6NFVc2JM
	i+X1y4GNzMiQh0uBGy8cKWF73Jx4cjpCaaRl/34XbJMjU220XNJyIUORs25Tpg6NHMUs
	dycUcFgtoppHvow/5vHoIvliqnzvjef9GN/I+S0D6a0htehiOUbVGkfCN/jPxCAFHEpe
	r3u3RHhj0ICFccYO8rmfBN1BN0zj4UWrk6ItdgRXrWIWuk/KGwMIX2jn3vCMJEtvCqCq
	t2TBR+GJ2lIgxSjaMUGdm5J9n1OxnxQqbqXUZn5ObJlFGkGoAC3FoCU17PeaiMjDCebL
	yZEQ==
Received: by 10.14.203.2 with SMTP id e2mr475974eeo.20.1353581614847;
	Thu, 22 Nov 2012 02:53:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm6240311eep.5.2012.11.22.02.53.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 02:53:34 -0800 (PST)
Date: Thu, 22 Nov 2012 11:53:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121122105331.GX12637@jama.jama.net>
References: <CAHod+Gc5uO1HsJdaziyEki7vXbPJkEwXe2Zu-OKBhzgXQD47sQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHod+Gc5uO1HsJdaziyEki7vXbPJkEwXe2Zu-OKBhzgXQD47sQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Andreas M <C3@jama.jama.net>, BC@jama.jama.net, ller <schnitzeltony@gmx.de>
Subject: Re: [meta-efl] should epdfview really be under meta-efl?
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
X-List-Received-Date: Thu, 22 Nov 2012 11:07:42 -0000
X-Groupsio-MsgNum: 41632
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i6WX/W6h5xa4jqsd"
Content-Disposition: inline

--i6WX/W6h5xa4jqsd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 01:33:42AM +0100, Marko Kati=C4=87 wrote:
> epdfview is a pure gtk app, yet it's under meta-efl/efl. Is this on
> purpose or did epdfview end up there
> due to it's name similarity to epdf ?

I think so, CCing Andreas for confirmation.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i6WX/W6h5xa4jqsd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCuBCsACgkQN1Ujt2V2gBzy4wCgs02EsHxxVw0wuqePiqb2/6dR
MDwAn1z4L+1v27zR2I0CeIKMKzsIciTh
=1o6N
-----END PGP SIGNATURE-----

--i6WX/W6h5xa4jqsd--
