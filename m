Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TRlp0-0000x0-66
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 17:27:42 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so1814964pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 08:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=8POVJNsc2truWXqcqzy/up6yyztpKHgy43nPSJkgt/U=;
	b=Cr1B6ZeoYUiHQaDgmuE0hx7Wk0kKEDEViFPmaHv7X4D3X4DFOdstDRvbwynlsX0e8E
	7/EteLsu10KNM2uLN5328Cqk25zLh9hwfspGsU3pTT9VlD0ohwdkEuL5bUstzpA2OyWv
	vK/sIjwgyMD64/ab3SD5kbdFZdk69Ni35ldI4OcIinIb1kjJERpH6zlNbbU5+StsizPf
	7EDxWomKVDyOayyrYq8NhSIqajlq2EAa+rKILzv4BMo8Gn6Lt7zNatm3WHvgoPlf+229
	diPTLdNWGze1HA9sR9hK9O6e1IWWhNGM18wssC555XI3iXtviQWXiZhPwXjOWUqnwbv7
	YyyA==
Received: by 10.66.86.65 with SMTP id n1mr62759376paz.48.1351264451383;
	Fri, 26 Oct 2012 08:14:11 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id j8sm1141049paz.30.2012.10.26.08.14.05
	(version=SSLv3 cipher=OTHER); Fri, 26 Oct 2012 08:14:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <k6b5r8$edu$1@ger.gmane.org>
Date: Fri, 26 Oct 2012 08:14:06 -0700
Message-Id: <18D1BDE4-CCB3-4105-8C64-BD843CB75FA6@gmail.com>
References: <k6b5r8$edu$1@ger.gmane.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1499)
Subject: Re: yocto 1.3 branch for meta-openembedded layers, RFC wanted.
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
X-List-Received-Date: Fri, 26 Oct 2012 15:27:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Koen

I can take care of danny=20

Thanks
-Khem

On Oct 25, 2012, at 3:55 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi,
>=20
> We need a branch to track oe-core 'danny' and I am swamped till ELC-E
> happens, so I would like to hold off on patches that make meta-oe =
layers
> incompatible with oe-core 'danny'.
>=20
> As for branch maintenance: any volunteers for managing the =
meta-openembedded
> 'danny' branches? There doesn't need to be a single maintainer, but it =
would
> be nice to have one person coordinating everything, even if it's just
> pulling in danny-next branches from the layer maintainers every week =
or so.
>=20
> As I said above, I'm swamped for the next 3 weeks, so can people who =
have
> used or are using the 'denzil' branch weigh in with =
feedback/anecdotes/etc?
> I have such a document for oe-core 'denzil', which I keep failing to =
send
> out, but it boils down to "better predictability for merge windows". =
Please
> share your experience for meta-oe here.
>=20
> regards,
>=20
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFQiRqzMkyGM64RGpERAschAJ98yscNYLI9qNGRviDm+drBquLttACgoa0X
> /YhGdFr+iYLy8n99sXb4zKE=3D
> =3DahtL
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



