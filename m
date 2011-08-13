Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1QsJWn-0004l6-UB
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Aug 2011 21:05:50 +0200
Received: by yxi19 with SMTP id 19so2604833yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Aug 2011 12:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-type:message-id
	:content-transfer-encoding:from:subject:date:to:x-pgp-agent:x-mailer;
	bh=fNN44x3jWkMcUMm/fstkq5I2eFd5UUC1Dw+l5nlge0Y=;
	b=aHYEpjMDgu8tX7s+RC0t5T+ZYny7FZCIwyk9QjaOvcTOX3YNsjbkSY450KyMrjVRBA
	RJ+PXqnNpkEQrdGKTZBXCL8diYcktrPS84oOaRIw2oeaI+2FKBcVH+L7BZO2XHbYtFh0
	0fADPmurAD2zDZnkuG/m0PD+cr2R7EAdNDG44=
Received: by 10.90.135.8 with SMTP id i8mr2377302agd.49.1313262075240;
	Sat, 13 Aug 2011 12:01:15 -0700 (PDT)
Received: from [192.168.0.5] (ip68-230-54-74.ph.ph.cox.net [68.230.54.74])
	by mx.google.com with ESMTPS id s13sm3607197anm.32.2011.08.13.12.01.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 13 Aug 2011 12:01:10 -0700 (PDT)
References: <1313161133-8899-1-git-send-email-bengardiner@nanometrics.ca>
In-Reply-To: <1313161133-8899-1-git-send-email-bengardiner@nanometrics.ca>
Mime-Version: 1.0 (Apple Message framework v1084)
Message-Id: <57F0DA78-042C-4CC1-9011-F4D11FD307C3@gmail.com>
From: Tom Rini <tom.rini@gmail.com>
Date: Sat, 13 Aug 2011 12:01:03 -0700
To: openembedded-devel@lists.openembedded.org
X-Pgp-Agent: GPGMail 1.3.3
X-Mailer: Apple Mail (2.1084)
Subject: Re: [2011.03-maintenance] pull-request: mtd-utils
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
X-List-Received-Date: Sat, 13 Aug 2011 19:05:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Aug 12, 2011, at 7:58 AM, Ben Gardiner wrote:

> The following changes since commit =
c8f2107a4784fabf877fa6750e05655e6092da73:
>=20
>  gtk-icon-cache bbclass: only add runtime dependencies on =
hicolor-icon-theme when installing icons (2011-08-04 09:38:55 +0200)
>=20
> are available in the git repository at:
>  git://github.com/BenGardiner/openembedded.git =
2011.03-maintenance-mtdutils
>=20
> Andrea Adami (3):
>      mtd-utils: upgrade to latest 1.4.4 release (bugfix)
>      mtd-utils: remove broken 1.4.1 version
>      mtd-utils: archive obsolete old versions
>=20
> Tom Rini (1):
>      mtd-utils-native.inc: Drop lzo-native

Applied, thanks!

- --=20
Tom

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.17 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk5GyfAACgkQdZngf2G4WwMiDwCeNdAjxeRXZRnOm+DtvqBVY9qM
NSYAmwT1jKjDo5PihQaakmguBuWZUVcI
=3DUBQb
-----END PGP SIGNATURE-----


