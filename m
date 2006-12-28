Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GzsEi-0003lM-Qn
	for openembedded-devel@openembedded.org; Thu, 28 Dec 2006 11:11:44 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBSAB6Lr001805 for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2006 11:11:06 +0100
Message-ID: <45939836.4050900@dominion.kabel.utwente.nl>
Date: Thu, 28 Dec 2006 11:11:02 +0100
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
Subject: monotone 0.32 release
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
X-List-Received-Date: Thu, 28 Dec 2006 10:11:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

FYI, Monotone 0.32 has been released today which includes massive speedups for 'mtn log'
and 'mtn annotate <file>', but it requires a bit of information to be added to your database.

See http://venge.net/monotone/UPGRADE for details on how to do that.

This means that people with a bleeding edge distro will have to spend a while regenerating
the db caches till someone adds a db snapshot for mtn 0.32 to openembedded.org.

This email is just some documentation we can point people to, who have problems reading
what's on their screen and start complaining about broken snapshots.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFk5g2MkyGM64RGpERAo95AKCvuarQTJIUPPyNKJ+VjgMBjy8RnQCfQ05n
p49SZa4WWRNneRqzWVhZ0ho=
=LrcX
-----END PGP SIGNATURE-----


