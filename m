Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JFU5c-0007HE-65
	for openembedded-devel@openembedded.org; Thu, 17 Jan 2008 13:43:25 +0100
Received: from Powerbook-2.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m0HChJ0k008390 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2008 13:43:19 +0100
Message-ID: <478F4D66.6060608@student.utwente.nl>
Date: Thu, 17 Jan 2008 13:43:18 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <4783557F.5060603@student.utwente.nl>
In-Reply-To: <4783557F.5060603@student.utwente.nl>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: CIA disabled
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
X-List-Received-Date: Thu, 17 Jan 2008 12:43:31 -0000
X-List-Received-Date: Thu, 17 Jan 2008 12:43:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
| Hi,
|
| I disabled the monotone cia client because CIA keeps returning:
|
| xmlrpclib.Fault: <Fault <type 'exceptions.OSError'>: '[Errno 28] No
| space left on device'>
|
| (no space on the cia.vc server, the mtn cia client server still has
| 50GiB or so to spare)
|
| Which makes the client retry to push the commit message till no more
| errors appear, which leads CIA spam. Once the CIA people fix their
| server it will be enabled again.
|
| This does NOT affect commit mails to oe-commits.

Cia now graces us with:

xmlrpclib.ProtocolError: <ProtocolError for cia.vc/RPC2: 500 Internal
Server Error>

So it's offline again till the cia dudes fix their server.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHj01mMkyGM64RGpERAndlAKCTB0UdnOPKFAnH/FaKkOW5kGLi1wCfc7n7
uxLXsSOOcvylEXobm+osRLY=
=Bvpc
-----END PGP SIGNATURE-----


