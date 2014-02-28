Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 494446EFBE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 14:45:32 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z10so2732906ead.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 06:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HtjE0anUOOJYGBopVvhng4K4R56QNHT4qHipJeUn4Sc=;
	b=fyOWoZIow/BT4AhbzH7t1m3N36zNE/EE9Ri+e1tiF45k9GNQwrY22c2RGLg+XYxB1E
	i6T2IDu85RRo6hY/tdmAZ5y7/xqwEP4uJG2Ig2I96LIhM8nJKe6T9OPGHI+kINjjzlUe
	NclrqdHutQB1pIYl9iXrHSfPaUjDgjUx/oxjmTWA7nU61TBdWtB/77RJW04EKoWmzCq0
	IQQQkIQYkQ81UEBAp1vNSoHV8Yp5s7ieSbpRMVCLCkOoZFmEEIHlRU3jvcY3Ek4sCJqY
	slMJnJeYux5L2u5msmb6wD7gf1G9Bta2/Pqii18O2SWof73RE73l4h60czfLI9wPFT4z
	hkGA==
X-Received: by 10.14.109.201 with SMTP id s49mr3542248eeg.88.1393598733227;
	Fri, 28 Feb 2014 06:45:33 -0800 (PST)
Received: from localhost ([89.176.104.3])
	by mx.google.com with ESMTPSA id i1sm11237304eeo.16.2014.02.28.06.45.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Feb 2014 06:45:31 -0800 (PST)
Date: Fri, 28 Feb 2014 15:45:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140228144532.GJ26981@jama>
References: <1393592670-3088-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<1393594900-16092-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<20140228140004.GI26981@jama>
	<8672BB614B4CCA40A6B3BDD6FD82050B57545378@COSNADEXC13.usr.ingenico.loc>
MIME-Version: 1.0
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B57545378@COSNADEXC13.usr.ingenico.loc>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH v2] fbida 2.09: cleanups and use PACKAGECONFIG
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Feb 2014 14:45:34 -0000
X-Groupsio-MsgNum: 48453
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AfkfStYJxYILZKr"
Content-Disposition: inline

--7AfkfStYJxYILZKr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2014 at 02:21:58PM +0000, Matthieu CRAPET wrote:
> Thanks Martin for your great help!
>=20
> Concerning shell function & tabs, maybe a line may be added in wiki:
> http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core

Updated there and in
http://www.openembedded.org/wiki/Styleguide

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7AfkfStYJxYILZKr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMQoQwACgkQN1Ujt2V2gBwjBwCcCYstnv67q2DOAYLhB7e/G8YQ
ZSIAoJF00yGa/JYuGVaCwWMlHIZZ5H2U
=C3Ss
-----END PGP SIGNATURE-----

--7AfkfStYJxYILZKr--
