Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 103AE60144
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 15:58:00 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z10so2788466ead.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 07:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dVwnYjFm1by++ac+CPFnwkQeT1d05TgxrMxY6mBRY6A=;
	b=Yk5Uww4L+n47lXd0W0W/9MpeI6Y9US0Knvv+4GWUN9C5xxNGJG/cwOSxpgrlKt8JDw
	FVsbLmDPpMWJktRXD8ZU2dXpUFh0Ey3YwLbh3ldOGOH5ZRyIG+NHCHZ8OKIYS++eHHLT
	q4unKVTl3r9xzR4caN+QMy9sOyxxoY/N/A7mnXrOxUZ9R8KtQpamRwxLbaAh2a7LW3SC
	yQIE+Atuef3kxNAB6JrHGOqpRXDR370RvY97WP4zGvOU/tN+87T2wZKtKmIZMmfjNEgs
	E+ur/J4H0OehEU6W8Jy0VRJtF6BAxjekdnHsg22GEi/K79CKlQsdz9bvnlXREurlNQ54
	1zBA==
X-Received: by 10.14.205.130 with SMTP id j2mr17804055eeo.76.1393603081160;
	Fri, 28 Feb 2014 07:58:01 -0800 (PST)
Received: from localhost ([89.176.104.3])
	by mx.google.com with ESMTPSA id 46sm11976119ees.4.2014.02.28.07.57.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Feb 2014 07:57:59 -0800 (PST)
Date: Fri, 28 Feb 2014 16:57:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140228155754.GK26981@jama>
References: <1393592670-3088-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B57545378@COSNADEXC13.usr.ingenico.loc>
	<20140228144532.GJ26981@jama>
	<8822299.R2rVXokoOe@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <8822299.R2rVXokoOe@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 28 Feb 2014 15:58:03 -0000
X-Groupsio-MsgNum: 48455
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cxpasEumJqkFnF/n"
Content-Disposition: inline

--cxpasEumJqkFnF/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2014 at 03:43:56PM +0000, Paul Eggleton wrote:
> On Friday 28 February 2014 15:45:32 Martin Jansa wrote:
> > On Fri, Feb 28, 2014 at 02:21:58PM +0000, Matthieu CRAPET wrote:
> > > Thanks Martin for your great help!
> > >=20
> > > Concerning shell function & tabs, maybe a line may be added in wiki:
> > > http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core
> >=20
> > Updated there and in
> > http://www.openembedded.org/wiki/Styleguide
>=20
> IMO, I think four spaces for multi-line indentation is not ideal. The=20
> indentation is there for readability; it should line up with the opening =
quote=20
> on the first line if there is one. IIRC we only ended up with these after=
 your=20
> search and replace in meta-oe because it was too hard to do otherwise.

http://lists.openembedded.org/pipermail/openembedded-core/2013-August/08266=
3.html
http://lists.openembedded.org/pipermail/openembedded-core/2013-August/08266=
5.html
http://lists.openembedded.org/pipermail/openembedded-core/2013-August/08286=
8.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cxpasEumJqkFnF/n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMQsgIACgkQN1Ujt2V2gBwGvACbBjJ3JQBfphijRIjmbt/Q/k+S
EuoAn1OTo2nLrVpzfcFCYpfKZ2r1f9Ld
=kkcd
-----END PGP SIGNATURE-----

--cxpasEumJqkFnF/n--
