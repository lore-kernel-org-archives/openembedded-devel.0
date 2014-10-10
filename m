Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id A20206AC7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 21:42:42 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hi2so5400617wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 14:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MwB5RdlKR/bH6oFhcHqq5r+d559MlSrgYfdJ4BVmHLM=;
	b=wGf2o/+X9GHW0oFLlBQ7B66YxjzDA8/GZIikcCqldURaI3Yk00rb2PycZeDLaMQ+1v
	CGW5cwgj3bmanseUbCKOuO0vkUwW12YXnGMssmqgNA3FkFB6XH927nxC9i2RCE0BB61q
	8sXySYaypH04bAxqPTNbt0pFttybPyotJeEv5BFj0Pl1XiXb+ZhVF1B3fvXviAlWFhzq
	Kp5GzJBsRjUAORkJpavHlF57IfR9V9NDdi2E7Q4J+TNk6GMjpyDcFEO/Mf21Qeb9z+Gy
	b8h2bUz8s3VsPG2IzyOVHMebeWHFNnJjuGpUHBquoxqTiJaFaYbsiByEimpg7uDgnpjC
	HJ9w==
X-Received: by 10.194.83.67 with SMTP id o3mr7037982wjy.31.1412977363936;
	Fri, 10 Oct 2014 14:42:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	he2sm3895167wib.4.2014.10.10.14.42.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Oct 2014 14:42:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 10 Oct 2014 23:44:24 +0200
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20141010214424.GA3000@jama>
References: <543810C5.9030502@windriver.com>
MIME-Version: 1.0
In-Reply-To: <543810C5.9030502@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: When will the meta-openembedded have a dizzy branch, please ?
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
X-List-Received-Date: Fri, 10 Oct 2014 21:42:44 -0000
X-Groupsio-MsgNum: 52443
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 11, 2014 at 01:00:53AM +0800, Robert Yang wrote:
> Hello,
>=20
> When will the meta-openembedded have a dizzy branch, please ?

It would be nice to get at least some of QA issues fixed before we
branch. Currently we have more than 438 issues.

But other than that, it's almost ready (thanks Otavio + Armin for
stepping up to maintain it), please send the READMEs update again when
you can, so that I can create the branch together with right READMEs.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ4UzgACgkQN1Ujt2V2gBzgsQCcCKgXmh+BOO0WNaRIUnpC0HTA
9OUAn0W2Zw22BXLAxNOoq1UPDMIlIR7C
=kE1O
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
