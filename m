Received: from [152.78.68.129] (helo=owl.ecs.soton.ac.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mas@ecs.soton.ac.uk>) id 1JxrH4-0000D1-64
	for openembedded-devel@openembedded.org; Mon, 19 May 2008 00:22:41 +0200
X-ECS-MailScanner-Watermark: 1211754027.13708@QNGWa07lFIsJ5g41cRmTKw
Received: from gander.ecs.soton.ac.uk
	([IPv6:2001:630:d0:f102:21d:9ff:fe22:9fc])
	by owl.ecs.soton.ac.uk (8.13.1/8.13.1) with ESMTP id m4IMKMUO032290
	for <openembedded-devel@openembedded.org>;
	Sun, 18 May 2008 23:20:22 +0100
X-ECS-MailScanner-Watermark: 1211754008.41978@9gl6Ls0UucURNQxy7BejJQ
Received: from Macintosh-2.local (mattaw.plus.com [212.56.102.26])
	(authenticated bits=0)
	by gander.ecs.soton.ac.uk (8.13.8/8.13.8) with ESMTP id m4IMJwul016114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 18 May 2008 23:20:08 +0100
Message-ID: <4830AB85.80406@ecs.soton.ac.uk>
Date: Sun, 18 May 2008 23:19:49 +0100
From: Matthew Swabey <mas@ecs.soton.ac.uk>
User-Agent: Thunderbird 2.0.0.14 (Macintosh/20080421)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20080516214710.GA21911@rhein.zuhause.netz>
	<200805182358.50192.mickey@vanille-media.de>
In-Reply-To: <200805182358.50192.mickey@vanille-media.de>
X-Enigmail-Version: 0.95.6
X-ECS-MailScanner: Found to be clean, Found to be clean
X-Spam-Status: No
X-ECS-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: m4IMKMUO032290
X-ECS-MailScanner-From: mas@ecs.soton.ac.uk
Subject: Getting a tested patch into Angstrom stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 18 May 2008 22:22:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I have developed a backport for 2.6.24-rp to fix the zaurus' pxa2xx-udc
clock bug.

If I want it to get into the current angstrom stable who do I bug
(chortle, pun :) )?

I am correct in thinking that Angstrom stable is part of OE aren't I?

Cheers, nice to be working with OE again after all this time! I haven't
used it since I owned a SL-5600 and bitbake didn't exist. Neither did
OE, just OZ.

Impressive, impressive work.

- --
Dr Matthew Swabey
Rm3229, Bldg59 New Zepler
School of ECS
University of Southampton
University Road
Southampton, SO17 1BJ
England

Tel: 02380 597381

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.8 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkgwq4UACgkQsoSsB2Ynk1AJfgCeIgR2W4RY7BlZfNku+IZGBeNn
ABsAoLXIRwUe28q3HFdF/McDkhRJl1RN
=xqoW
-----END PGP SIGNATURE-----


