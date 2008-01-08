Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JCC9T-0007SB-CG
	for openembedded-devel@openembedded.org; Tue, 08 Jan 2008 11:57:47 +0100
Received: from Powerbook-2.local (vpn006061.vpn.utwente.nl [130.89.6.61])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m08Aoe0k011728 for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Jan 2008 11:50:44 +0100
Message-ID: <4783557F.5060603@student.utwente.nl>
Date: Tue, 08 Jan 2008 11:50:39 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: CIA disabled
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
X-List-Received-Date: Tue, 08 Jan 2008 10:57:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I disabled the monotone cia client because CIA keeps returning:

xmlrpclib.Fault: <Fault <type 'exceptions.OSError'>: '[Errno 28] No
space left on device'>

(no space on the cia.vc server, the mtn cia client server still has
50GiB or so to spare)

Which makes the client retry to push the commit message till no more
errors appear, which leads CIA spam. Once the CIA people fix their
server it will be enabled again.

This does NOT affect commit mails to oe-commits.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHg1V/MkyGM64RGpERAlsZAJwInceOE3ET+2fp51Mj8SqdcFOuqwCgr0Hx
YvtbOrLT9zT4l3EH78LHxdE=
=DFXd
-----END PGP SIGNATURE-----


