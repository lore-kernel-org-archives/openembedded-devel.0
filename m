Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RIX4o-0003ij-3E
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Oct 2011 04:49:18 +0200
Received: by ggnj1 with SMTP id j1so37750ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2011 19:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-type:message-id
	:content-transfer-encoding:from:subject:date:to:x-pgp-agent:x-mailer;
	bh=JiTjHACasRSexpKsU9uvj7C1sJIPKBVXEsF7nlJFKEo=;
	b=SiXHiLUQgW2j19q+91aBCC57iPvJ2ytdqPMqiIGHoCAKjgwXFcR5zEgw8nutNhhjtK
	6RrByQ6DrF4NBFIA2/+tP1wk4zHtF7e41hYXegqhNjlgK/uinRt4jxxcivolX/sE487F
	s0NcqRaR6l7nXh4t8erStWOOm3syxDStHFUy8=
Received: by 10.68.12.105 with SMTP id x9mr19457008pbb.109.1319510599812;
	Mon, 24 Oct 2011 19:43:19 -0700 (PDT)
Received: from [192.168.0.5] (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id jm5sm3384761pbc.1.2011.10.24.19.43.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 19:43:18 -0700 (PDT)
References: <ED3E0BCACD909541BA94A34C4A164D4C4013D181@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4013D181@post.tritech.se>
Mime-Version: 1.0 (Apple Message framework v1084)
Message-Id: <8721E570-6C63-4CC6-AC4A-854409FFF3E6@gmail.com>
From: Tom Rini <tom.rini@gmail.com>
Date: Mon, 24 Oct 2011 19:43:14 -0700
To: openembedded-devel@lists.openembedded.org
X-Pgp-Agent: GPGMail 1.3.3
X-Mailer: Apple Mail (2.1084)
Subject: Re: [2011.03-maintenance] Pull request for binutils
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
X-List-Received-Date: Tue, 25 Oct 2011 02:49:18 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Oct 21, 2011, at 1:38 PM, Mats K=E4rrman wrote:

> Hello Tom,
>=20
> Please pull this commit from here:
>=20
> URI: git://git.openembedded.org/openembedded
> Branch: org.openembedded.dev (master)
>=20
> Paul Menzel (1):
>      binutils-{canadian,cross}-sdk_2.18: Remove checksums and =
implicitly update them

Sorry if it wasn't clear on the wiki page but what I'm asking for is a =
git branch you've created somewhere (github, gitorious, whatever, is =
fine) and tested that you've got all of the changes you need =
cherry-picked in or otherwise applied.  Thanks!

- --=20
Tom

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.17 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk6mIkMACgkQdZngf2G4WwNWIwCfdDRM8w8ouqgCV4h7az5a797N
dxQAnjsK4/yvXOsbAxUJoCW95GdBQaqk
=3DSxUa
-----END PGP SIGNATURE-----


