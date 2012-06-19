Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SgzzH-0000pJ-K6
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 17:04:59 +0200
Received: by dalh21 with SMTP id h21so8138077dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2012 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=fdCz6LhoTv0USL36MqGWsjoEbXd/HAmJX8u8O7iIJDw=;
	b=lxzilX4r8/K+8Qo4i+F8MlJc4D5KfJ/ZAp/QghBZOF6jODpu/kG5SJO8uJBX9RydWJ
	kw2ok0vxaIiU7Oj4D12e55K9syrS5BNzbMFyXOvHUqA94uat2ymD4LajxBoka3Kzu/xS
	C5BqpLSt1ZE4eo+mYtWIA4IummV/jxfJ1eNo440+SK6/w4mNcxL3YAzfthLDmU1+6ePu
	QTddjZ+XGP+xi8niKZJ40ZGO5qNn/BeP1ADrt24MP4878HqpYcTVaUJwtV6H/7agBNcx
	5jjD/ikqoWLFZ+pFdBA8GjBh2XRxFiAfQu8ssgIBbGqRuoDgfoffdfqROPYDlz6eOuB6
	0zuw==
Received: by 10.68.230.68 with SMTP id sw4mr5598581pbc.142.1340117655206;
	Tue, 19 Jun 2012 07:54:15 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:edf1:1f5b:c35b:5dbc])
	by mx.google.com with ESMTPS id os1sm28138155pbb.49.2012.06.19.07.54.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jun 2012 07:54:14 -0700 (PDT)
Date: Tue, 19 Jun 2012 07:54:13 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120619145413.GD22301@bill-the-cat>
References: <1339553354-14747-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1339553354-14747-1-git-send-email-raj.khem@gmail.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH 1/3] openssl-1.x.x: Backport patches from OE-Core
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
X-List-Received-Date: Tue, 19 Jun 2012 15:04:59 -0000
X-Groupsio-MsgNum: 39297
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline

--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 12, 2012 at 07:09:12PM -0700, Khem Raj wrote:

> These patches are needed for getting 2011.03
> branch building on ubuntu 12.04 LTS

Sorry for the delay, this (along with 2 and 3) are now applied, thanks.

--=20
Tom

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk/gkpUACgkQdZngf2G4WwP9rwCfdsR5Kb8ob3rvabKXK38IF786
No4An3BehW+H9PaWmJ2rMSRTxbRJLfUU
=rxbr
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
