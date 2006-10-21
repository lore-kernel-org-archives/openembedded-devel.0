Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GbPW3-000808-DR
	for openembedded-devel@openembedded.org; Sun, 22 Oct 2006 00:40:32 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9LMWxFh002611 for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Oct 2006 00:33:01 +0200
Message-ID: <453AA01B.5040300@dominion.kabel.utwente.nl>
Date: Sun, 22 Oct 2006 00:32:59 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: [Fwd: [oe-commits] org.oe.dev package.bbclass: Fix split_locales to	remove spurious references to -dbg packages. The way it	selects the principle package name needs totally reworking as	the current code is flawed but apply a workaround for now	(this is unrelated to other changes to package.bbclass)]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Oct 2006 22:40:34 -0000
Content-Type: multipart/mixed; boundary="------------050805080800080809060400"

--------------050805080800080809060400
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Should we bump PR on affected packages if this fix works?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFOqAbMkyGM64RGpERAgfsAJ4ikdEB49SiHUvsj1YNlUaZ1ahnuQCfSLcg
ZemD5f12rZ9CmXTO47MFibU=
=UWrB
-----END PGP SIGNATURE-----

--------------050805080800080809060400--
