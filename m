Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8A8A86E9EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 14:33:25 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h10so280322eak.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 06:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=C1fdwerExunB1N/KhZQuYDzD1SK7OGlrNjv+RMJ5ssg=;
	b=cswrNU98xyOjrXoOXb0IdI8a4xjwKhJ4yoK2fjxxjQ0XgCFs/F0aEo+v3aVkqHthfJ
	ppgiIrzEt7X+7mF5BX52H+oLQd00AM7kPv3pvnwb8GpC90zmV2N5zBNdSsgWDfO3xDmJ
	kn2kzpoxysOf+8A3Fa0sox72o33HYMRwPnPLZV2WpraeDQkSkuK3AtO31PL4XQuNYOh4
	OyCXaSTnSUnY9j4kyf73Hqrsbi3r8p5wCc8AMQyvDfya27kRF3ENjWcenKvMgtwstOW6
	4fUHHW9xm5CHyqmwjFhVeIw8kxLr+F9m6HEB6/fSSrwsrPKkw4QUacv2pFWkUjSuztl0
	IbvQ==
X-Received: by 10.14.175.2 with SMTP id y2mr2057814eel.75.1390919605761;
	Tue, 28 Jan 2014 06:33:25 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 46sm56323620ees.4.2014.01.28.06.33.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jan 2014 06:33:23 -0800 (PST)
Date: Tue, 28 Jan 2014 15:33:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20140128143329.GK3718@jama>
References: <20140122190949.GX4100@jama>
	<1390918587-16260-1-git-send-email-obi@opendreambox.org>
	<52E7BD5C.70309@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <52E7BD5C.70309@opendreambox.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] libconnman-qt: update to 1.0.46, add recipe for qte
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
X-List-Received-Date: Tue, 28 Jan 2014 14:33:26 -0000
X-Groupsio-MsgNum: 47924
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+278g007AL/ykmV8"
Content-Disposition: inline

--+278g007AL/ykmV8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2014 at 03:23:24PM +0100, Andreas Oberritter wrote:
> Hello Martin,
>=20
> I noticed that you've already applied v1 to master-next. Do you want me
> to send an incremental patch?

hello,

please do, somehow it slipped through patchwork when merging too many
changes after long delay..

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+278g007AL/ykmV8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLnv7kACgkQN1Ujt2V2gBw99wCeK8hz5Z7L2XaLMFAPTVhehEDg
T5AAnja8gsAFAtO2NByx9bkY5XHbLQg9
=ln8l
-----END PGP SIGNATURE-----

--+278g007AL/ykmV8--
