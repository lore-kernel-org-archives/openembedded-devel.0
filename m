Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1R289I-00044a-A4
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 22:58:08 +0200
Received: by pzk2 with SMTP id 2so3761021pzk.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2011 13:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-type:message-id
	:content-transfer-encoding:from:subject:date:to:x-pgp-agent:x-mailer;
	bh=Cxkt6RDAgN6KBmePpFd8ZyfIIwsdVO5s70ZeVQd3t9Y=;
	b=l4w+FTepM0VjCJ98hjvvb7FReqSNA+bDVeMLkQhqlhf9OOWvutyyao9aqIy2HvTsEY
	RALljsqcnK43vbeEuNItVN8GLfqspJTzSScYZnYC6Ni+kxjIXjmst8Hglp6yMvh2i+gT
	VdI0heUvxNNwBltXiX4q2zvPKeWp+gVOujiKk=
Received: by 10.68.4.105 with SMTP id j9mr397704pbj.72.1315601580230;
	Fri, 09 Sep 2011 13:53:00 -0700 (PDT)
Received: from [192.168.0.5] (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id e8sm22323064pbc.8.2011.09.09.13.52.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Sep 2011 13:52:56 -0700 (PDT)
References: <cover.1315478126.git.obi@opendreambox.org>
In-Reply-To: <cover.1315478126.git.obi@opendreambox.org>
Mime-Version: 1.0 (Apple Message framework v1084)
Message-Id: <597FEEE8-22A8-4438-A8CC-150A94179138@gmail.com>
From: Tom Rini <tom.rini@gmail.com>
Date: Fri, 9 Sep 2011 13:52:50 -0700
To: openembedded-devel@lists.openembedded.org
X-Pgp-Agent: GPGMail 1.3.3
X-Mailer: Apple Mail (2.1084)
Subject: Re: [2011.03-maintenance] libdca build fix
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
X-List-Received-Date: Fri, 09 Sep 2011 20:58:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sep 8, 2011, at 3:43 AM, Andreas Oberritter wrote:

> Hi Tom,
>=20
> please apply this build fix, which was cherry-picked from master
> 4f4ed88bc7caa3d2b0b44ae2f51907aa9e68fc1b.
>=20
> The following changes since commit =
bc8ddbf7944f82383936d88379619aa46c3954a2:
>=20
>  binutils-2.18: fix checksums (2011-09-05 17:43:27 +0200)
>=20
> are available in the git repository at:
>  git://git.opendreambox.org/git/obi/openembedded.git =
2011.03-maintenance
>  =
http://cgit.opendreambox.org/obi/openembedded.git/log/?h=3D2011.03-mainten=
ance
>=20
> Andreas Oberritter (1):
>  libdca: fix sed failing on unpack
>=20


Applied, thanks.

- --=20
Tom

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.17 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk5qfKQACgkQdZngf2G4WwO+OACgmejikB/2DAP4U76pH5ImbTUC
vvwAnRQoXekD+4UCpA0syAtiusO9UUJW
=3DNrMS
-----END PGP SIGNATURE-----


