Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RCCki-0000U4-De
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 17:54:25 +0200
Received: by pzd13 with SMTP id 13so10425256pzd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2011 08:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-type:message-id
	:content-transfer-encoding:from:subject:date:to:x-pgp-agent:x-mailer;
	bh=vVOxbmngGwdrOX9ezvzRgxDsA5r5fJ378xz1v1zctRQ=;
	b=C2/Pgg86FfSCrvnXbc+ugep2+ia8kNW/deeyu2WR9uuNwQF/FJAMxY2akRcynI1BKG
	v73l/AQcCg+b60FJo/Yr1WIsAKmOFkD2T5A5MzSvg1j1H1wn8YLOViesl/wkanW0s2HZ
	NcuC8vFNfRoHmCYWHQdJm0f53fM1JWEC9VYbI=
Received: by 10.68.8.195 with SMTP id t3mr14790995pba.107.1318002526348;
	Fri, 07 Oct 2011 08:48:46 -0700 (PDT)
Received: from [192.168.0.5] (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id e7sm32484130pbq.1.2011.10.07.08.48.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 08:48:45 -0700 (PDT)
References: <20111007041336.GC26170@denix.org>
In-Reply-To: <20111007041336.GC26170@denix.org>
Mime-Version: 1.0 (Apple Message framework v1084)
Message-Id: <5C7B4134-3E21-41DF-867B-CD8C305A9C30@gmail.com>
From: Tom Rini <tom.rini@gmail.com>
Date: Fri, 7 Oct 2011 08:48:38 -0700
To: openembedded-devel@lists.openembedded.org
X-Pgp-Agent: GPGMail 1.3.3
X-Mailer: Apple Mail (2.1084)
Subject: Re: [2011.03-maintenance] Pull request 20111006
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
X-List-Received-Date: Fri, 07 Oct 2011 15:54:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Oct 6, 2011, at 9:13 PM, Denys Dmytriyenko wrote:

> Tom,
>=20
> Please pull these 3 commits, that update wireless stuff and are quite
> trivial - new version for iw and updated SRCREVs for wpa_supplicant =
and
> hostapd. All are cherry-picked from oe.dev.
>=20
> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>  Branch: 2011.03-maintenance
>  Browse: =
http://arago-project.org/git/people/?p=3Ddenix/openembedded.git;a=3Dshortl=
og;h=3Drefs/heads/2011.03-maintenance

Applied, thanks.

- --=20
Tom

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.17 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk6PH1cACgkQdZngf2G4WwOkkQCfbCMP7eSByI3bw7C/ntmdx9HM
1UgAn2u+ylHlfX7XCnyWlDHwn0bkZTRd
=3Dcb0u
-----END PGP SIGNATURE-----


