Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1QwbvC-0004AZ-Mj
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Aug 2011 17:32:47 +0200
Received: by eyb7 with SMTP id 7so1685242eyb.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Aug 2011 08:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-type:message-id
	:content-transfer-encoding:cc:from:subject:date:to:x-pgp-agent
	:x-mailer; bh=v8BXMuffcMIWS3JpAdIve5XQ9Mm2CVKmnQS6yP5d9vE=;
	b=upNMXJnkBFtSI9R8YeJYvKSOYzrJqM2JyS4T00if/mVlaLuMKgywngBsy6NiOkx2kw
	zPMYfnwZF4KKsEE3dFtq0pQoejIe8K+GerBFpE8gkiXZPDItabo3p+6TgMQPB4/Zm9uI
	2fhraun3H+jb7TwAzRCy7tQ5VM84eQo9RW5lM=
Received: by 10.142.135.10 with SMTP id i10mr1655460wfd.134.1314286078495;
	Thu, 25 Aug 2011 08:27:58 -0700 (PDT)
Received: from [192.168.0.5] (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id z1sm292921pbz.6.2011.08.25.08.27.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 25 Aug 2011 08:27:37 -0700 (PDT)
References: <4E4AA7B7.7020006@dresearch-fe.de>
	<CA+M6bX=9E0c-hRCnyZ-7+WWX+NP_MeE_zLP8xtLH9EYqMVRDjA@mail.gmail.com>
	<4E51F52B.4040304@dresearch-fe.de>
In-Reply-To: <4E51F52B.4040304@dresearch-fe.de>
Mime-Version: 1.0 (Apple Message framework v1084)
Message-Id: <ED92F4F3-FAEF-4537-97A6-D5654BEA8DD8@gmail.com>
From: Tom Rini <tom.rini@gmail.com>
Date: Thu, 25 Aug 2011 08:27:15 -0700
To: Steffen Sledz <sledz@dresearch-fe.de>
X-Pgp-Agent: GPGMail 1.3.3
X-Mailer: Apple Mail (2.1084)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Pull request (live555 update)
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
X-List-Received-Date: Thu, 25 Aug 2011 15:32:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Aug 21, 2011, at 11:20 PM, Steffen Sledz wrote:

> Hi Tom,
>=20
> Please pull one commits from here:
>=20
> URI: git://git.openembedded.org/openembedded
> Branch: sledz/maintenance
>=20
> Andrea Adami (1):
>      live555: catch up with upstream habits of upgrading and removing =
tarballs
>=20
> This updates the live555 version and is already in oe-dev master.
>=20

This is now applied, thanks!  And sorry for the delay.

- --=20
Tom

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.17 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk5WadMACgkQdZngf2G4WwMQawCfUXmo0UGh3Q4PAstp5nnvYt9M
THIAnjA1o8z6HEDUx5JjtHLQJNj1fsIQ
=3DD5eR
-----END PGP SIGNATURE-----


