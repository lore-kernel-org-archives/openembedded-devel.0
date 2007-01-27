Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HAolU-0002MQ-Df
	for openembedded-devel@openembedded.org; Sat, 27 Jan 2007 15:42:50 +0100
Received: from [130.89.6.106] (vpn006106.vpn.utwente.nl [130.89.6.106])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l0REgcLr027853 for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2007 15:42:38 +0100
Message-ID: <45BB64DC.1080601@dominion.kabel.utwente.nl>
Date: Sat, 27 Jan 2007 15:42:36 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: RFC: diet-x11, small-x11 and fat-x11
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
X-List-Received-Date: Sat, 27 Jan 2007 14:42:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I'd like to propose to split diet-x11 and libx11 into the following:

diet-x11: as small as possible, without stuff like cms and xkb
small-x11: small, but with cms and xkb, usefull for highend palmtops and small settop-boxes
fat-x11: biggest version, usefull for big-bad-workstation images.

what do you think about it?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFu2TcMkyGM64RGpERAhNpAJ9IkgRiU747JFiNqaRu7nGIbhh2UACfd+RQ
9wOPv/sei/R/hz/p4C1YCtM=
=EPN3
-----END PGP SIGNATURE-----


