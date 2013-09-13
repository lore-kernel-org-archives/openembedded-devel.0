Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 360686B6C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 13:58:07 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so590424eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 06:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=nhMhGU6I13TLxyrk7SjTTUqEspFytFtA9bCgTZOsL7k=;
	b=MuC3ohAqW40z3Bz8QPm28kAXdhcrYaRyuc3TrwYM8PAPE0UiFHFK9HRE8U5yV6CfZe
	2PiFLTP+ygqzqbiGSbhWLgRmL65MvvGH7wHnqjHEw2+aqwwLoa8tx7CaXrdvwyplTkF9
	CZtpV9p0n0pAckwoJJe6uvwLp6kvcTG7DM2ObqOTdIwpfuMLGDJk8TTxII4YaJqo90he
	BKLjpZMIxoWl1imdJXnwxXplCYIOqBNtjovyn44RLVyK2BFAWSBjLTpLnvyHKZm6OKN6
	v2FxjavsymGFhyjMEtbDmaJJm3Kg9Ih51Cv1/dx/JnSXOy3aCzco7qqPxCC2F0ZhO+Iv
	X12w==
X-Received: by 10.14.4.1 with SMTP id 1mr18670698eei.21.1379080688411;
	Fri, 13 Sep 2013 06:58:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm15191046eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Sep 2013 06:58:07 -0700 (PDT)
Date: Fri, 13 Sep 2013 15:59:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20130913135936.GD11500@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: meta-perl, meta-filesystems maintenance
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
X-List-Received-Date: Fri, 13 Sep 2013 13:58:08 -0000
X-Groupsio-MsgNum: 46169
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KqIDP7BYbqnwKRO+"
Content-Disposition: inline

--KqIDP7BYbqnwKRO+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

there were some patches for meta-perl, meta-filesystems
do you want me to merge patches which looks OK without your ACK or
should I always wait for it (you're listed in meta-perl as Maintainer
and in meta-filesystems for couple of recipes + you created it)?

If you don't have write access I'm OK with pushing them for you once
they are acked on ML - or even better if you send me list of patchwork
IDs to merge or some consolidated pull request.

You can see what's in queue:
http://patches.openembedded.org/bundle/jama/meta-filesystems/?archive=3Dboth
http://patches.openembedded.org/bundle/jama/meta-perl/?archive=3Dboth

If you don't have maintainer permission for patchwork, please ask Khem
to add it for you.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KqIDP7BYbqnwKRO+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIzGkgACgkQN1Ujt2V2gBy+cgCfRkMQtGjr4LvHWsCqHYs3ISD+
LjEAoKCu4LZ1MLlfHXbMpTFYhxgWjgVP
=B2nn
-----END PGP SIGNATURE-----

--KqIDP7BYbqnwKRO+--
