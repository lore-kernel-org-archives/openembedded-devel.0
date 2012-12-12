Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eren@hambedded.org>) id 1TirHH-0002oO-Aq
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2012 19:43:31 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so338872eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2012 10:28:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent
	:x-gm-message-state;
	bh=U/zysnxFApZrlIJLbg4E0FeNOQSjjYd7R8KT4j8FaBE=;
	b=UR+XQl3ccgGWJ3iw7LTwyMzrzL2o9hrd15XMSUlhf8CxQqzwvwX2WibRGEXTvH6KB5
	dGog1GImIxpydIpcUjHWuz6+KmusLd/iiRJxqK79rCphxTSmpvSzv6oZ+5gbv3MBu2be
	bAlBiSSkd7RDJNBCKwpuDLcFbqgngvtqF/8cIeSnrWcbSlFan2bL6XcQxoZm8nG2rFb5
	rl/MVbMBguLDPX171qUmmjvmd5tf3ChMee8aNGrmswRhe0y1GeIKVG0yh3RqpC+5I+rY
	X7X7f5QXNIVnXGn2qJnvIzO1qzqd1H8dty6tkPUUvLI69HRaAL5rOVX1mtZBowVk2IS1
	F6Rg==
Received: by 10.14.184.131 with SMTP id s3mr4935092eem.38.1355336937491;
	Wed, 12 Dec 2012 10:28:57 -0800 (PST)
Received: from gmail.com ([46.196.117.99])
	by mx.google.com with ESMTPS id k4sm51090127eep.15.2012.12.12.10.28.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 10:28:56 -0800 (PST)
Date: Wed, 12 Dec 2012 20:28:47 +0200
From: Eren =?iso-8859-1?Q?T=FCrkay?= <eren@hambedded.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20121212182847.GB20975@gmail.com>
References: <20121212173707.GA20975@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20121212173707.GA20975@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Gm-Message-State: ALoCoQljiPLxKWIglfFmXJExiU5jMY9T3U/ISZe6Mv6JG84vGb8bKJOoqF67v9cKezreHDbO+CFj
Subject: Re: [meta-oe][bitbake-devel][PATCH] bitbake.vim: detect *.bbappend files in ftdetect automatically
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
X-List-Received-Date: Wed, 12 Dec 2012 18:43:31 -0000
X-Groupsio-MsgNum: 42107
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline

--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 12, 2012 at 07:37:07PM +0200, Eren T=FCrkay wrote:
> Currently, *.bb and *.bbclass files are automatically highlighted and
> detected as a bitbake file. Since *.bbappend files are also bitbake
> files, vim plugin should automatically detect and highlight it as well.

Sorry! Wrong mailing list. Please ignore it.

Regards,
Eren

--=20
    . 73! DE TA1AET
      http://linkedin.com/in/erenturkay

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (Darwin)

iQIcBAEBAgAGBQJQyMzfAAoJEOM7bMm6HhcThf8QAJm679whOezo4S9D+wiaMc/A
tXieg6qWOZOyCrJpRNPp+WzCcMVq2Y8Eva9T4HjhJfWhAP9WJ93xbmB7VEJZyDD8
5d0YI7uLsdvYlwllI4GbvrTi0RV6FWeA6ari6T9gYqPgNKM6t4077R4PyfiGORp8
sqjsqsQp0sxfQXAO0prqkRWCLlpdW7c9kwSBLiAKcx6OKwp2E3qqG9YEY/TU1kI5
VRebqCOQJMoitkrQtNygx88YyxYt0+bhmqX3rXPEE8flIPtxpo6q1aPZZaRe7f0Z
f3GcPhzQXFWRQH8Gp29RKIhK7J0lSLZPWRTh66QU9m3Ecml2KjDAc9R16KLOASkf
xE7Y+85hC2j5xeP8JUkBrVS1C4cySTuvd3pL2MhSalty6LYX6GNw/PduM+4G05m3
u+5x27hNPzUryqzwa0VZOhHSdE+8YJ15l7IMLMtryt4zKqzJHvfM3vNJkiCHizez
npIJBHR0n4MejcBwQkjO6PsntWP90uGOGYM6B5mhVRi4hbSCIOaHkxRKF0PpHnC5
tnhU78iEljq9Dai+d/2a7nbHoubYKIXa3LIS1QCGPjAS+RftEN7oufsK6cLJV2o3
rFYCLW3cS73+YLPebaBdNzO6bRels+OlREHKQYF2WpOr0WfeKj+4dpRpn5ygrt/G
wuByGbOgBCaf6EIZS5Ty
=7fz6
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
