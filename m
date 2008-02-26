Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1JTvTO-0003Jv-Ku
	for openembedded-devel@openembedded.org; Tue, 26 Feb 2008 09:47:43 +0100
Received: from Powerbook-2.local (vpn006021.vpn.utwente.nl [130.89.6.21])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m1Q8l13x004408 for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2008 09:47:01 +0100
Message-ID: <47C3D204.9090908@dominion.kabel.utwente.nl>
Date: Tue, 26 Feb 2008 09:47:00 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-SA-Exim-Connect-IP: 130.89.2.9
X-SA-Exim-Mail-From: koen@dominion.kabel.utwente.nl
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: commit 9b9a2409c7e2ddb2caf0a5aba74549f65c52b503
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
X-List-Received-Date: Tue, 26 Feb 2008 08:47:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

- --- packages/netsurf/netsurf_svn.bb 
c00865f4500c29a5271184c5babd7fc2a83ef465
+++ packages/netsurf/netsurf_svn.bb	c00865f4500c29a5271184c5babd7fc2a83ef465
@@ -0,0 +1,43 @@

+PV = "1.1+svn${SRCDATE}"

That's bogus, svn repos must use SRCREV with an entry in
sane-srcrevs.inc in OE.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHw9IDMkyGM64RGpERAuAsAJ9s6CrUywbxOMF7JE6EAWErtiOgsACbB7eg
YmqcwR+y7Xgok/7S1PewElE=
=Ep46
-----END PGP SIGNATURE-----


