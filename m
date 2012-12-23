Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tms4C-0002Qw-Py
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 21:22:36 +0100
Received: by mail-ea0-f178.google.com with SMTP id k11so2728659eaa.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 12:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=mx7aTULNiXS3iZ5JMSnUXcoup3+36fBGVYS9YGIWD4g=;
	b=WcFC4Gf2/FWsgjWEPzO9S7Wt21JRTmQDYD9ffrejOabBKZ5TEOIBEeFEfI2IbfK4Td
	81XMM5FTcOSXJC+Z2tqRmC6neMp9JvHyvTQvHVFhfAImcaczXwnQ524gw3SmVjM/veA5
	bmKdn1VxSk33uwwlEll6V9LNbElfnAq+E8FoJtpeO491iILdDg4JXk0VdUC12yl+2klt
	fkIsOQYVy1QktkH2TaSt4N4IrNe9nwwNe8C9lmflgRjenG5g0bkLmcFqoxrshLPiGH3F
	gqPTUZptJsn39zCWyW+tjH2kQy3XTUoaLoah9TJfYkwAKCwxWA5FlD7MnPSz21cR+Lad
	qjIA==
X-Received: by 10.14.213.134 with SMTP id a6mr50043306eep.45.1356293267852;
	Sun, 23 Dec 2012 12:07:47 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 43sm36811538eed.10.2012.12.23.12.07.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 12:07:47 -0800 (PST)
Date: Sun, 23 Dec 2012 21:07:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20121223200748.GM8988@jama.palm1.palmone.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
	<d4bafb35d0dff694a16e40856448eeb12a0fd05e.1356264861.git.Martin.Jansa@gmail.com>
	<1399407.2onAcIL7L6@helios>
MIME-Version: 1.0
In-Reply-To: <1399407.2onAcIL7L6@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 16/30] hddtemp: apply hddtemp-db.patch to our hddtemp.db
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
X-List-Received-Date: Sun, 23 Dec 2012 20:22:36 -0000
X-Groupsio-MsgNum: 42385
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4ybNbZnZ8tziJ7D6"
Content-Disposition: inline

--4ybNbZnZ8tziJ7D6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 23, 2012 at 08:03:59PM +0000, Paul Eggleton wrote:
> The only problem with doing this is that it might make it harder to updat=
e=20
> from Fedora's patchset later...

True, but better then failing do_patch, right?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4ybNbZnZ8tziJ7D6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDXZJQACgkQN1Ujt2V2gBykWwCfThiVXsMxZdD1ztQ75uFZC5Yo
hT0AoLQzdjmMBq7UJYhAMSCTtqsJpe/r
=ygtU
-----END PGP SIGNATURE-----

--4ybNbZnZ8tziJ7D6--
