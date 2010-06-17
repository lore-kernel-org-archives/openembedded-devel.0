Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OPKJ2-0008CV-IZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 20:59:22 +0200
Received: from p5b033b22.dip.t-dialin.net ([91.3.59.34] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OPKEf-0006kk-OZ by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 20:54:48 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OPKEO-0002Qj-Ji
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 20:54:28 +0200
Date: Thu, 17 Jun 2010 20:54:18 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100617185418.GA8121@excalibur.local>
References: <4C187CF6.5010401@gmx.net>
	<20100616090200.5c23b895@xora-desktop.xora.org.uk>
	<AANLkTilul0-HFnIkW2eJ7lTzZ7EMzq6qBzLYZhUVxyhZ@mail.gmail.com>
	<20100616175640.4d7795ff@xora-desktop.xora.org.uk>
	<AANLkTimFM0nCDuT-eMOJRvolhw06Q6uoHwmbnebIIFjL@mail.gmail.com>
	<4C19CA2D.4@gmx.net>
MIME-Version: 1.0
In-Reply-To: <4C19CA2D.4@gmx.net>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] add ubuntu patch which adds atomic builtin support to gcc 4.3.[3 but also other microversions]
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
X-List-Received-Date: Thu, 17 Jun 2010 18:59:24 -0000
X-Groupsio-MsgNum: 20241
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2010-06-17 at 09:09, Robert Schuster wrote:
>
> first of all. As Stefan pointed out the change was needed while working
> for Buglabs on OpenJDK support. So it was decided that the introduction
> of the mentioned GCC change is handled by Stefan Schmidt now.

And this dude is on a vacation starting tomorrow. How perfect. :) I will be back
at 27th and start to look into this. Testing with angstrom and catchup with
discussions here.

regards
Stefan Schmidt

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: http://www.datenfreihafen.org/contact.html

iEYEARECAAYFAkwab1oACgkQbNSsvd31FmWIuQCeIhm40d4Sfv0MKVmJeBqD9NdC
d2sAn27rKgJVc1UwWB1hciuRWm4aLljn
=P0Pb
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
