Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J0dZ4-0006Gg-Jw
	for openembedded-devel@openembedded.org; Fri, 07 Dec 2007 14:48:26 +0100
Received: from Powerbook-2.local (vpn006063.vpn.utwente.nl [130.89.6.63])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lB7DiVnk030455 for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Dec 2007 14:44:31 +0100
Message-ID: <47594E40.2090201@student.utwente.nl>
Date: Fri, 07 Dec 2007 14:44:32 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: [Angstrom-devel] RFC: ipv6 support in angstrom
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2007 13:48:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

The following RFC was accepted by all angstrom developers, so moving it
to OE now:


I want to propose the following:

* enabling the ipv6 kernel module on all network capable devices
angstrom wants to support.
* enabling the mip6 kernel module on capable kernels (afaik vanilla
2.6.23 or patches 2.6.x)
* have ipv6 support enabled in the c library and busybox

Some machines already do all this, but afaik we don't have a policy for
it yet.



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHWU5AMkyGM64RGpERAsh/AJ9VUBvUDeHrDuxiDvh/s07k9kToCgCeNZNJ
pBcIC8RShN/oZwwsEYvHq2g=
=EKF4
-----END PGP SIGNATURE-----


