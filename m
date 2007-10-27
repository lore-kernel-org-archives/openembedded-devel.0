Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Iln5R-0005wV-TN
	for openembedded-devel@openembedded.org; Sat, 27 Oct 2007 16:56:32 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9REmlUx016714 for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Oct 2007 16:48:48 +0200
Message-ID: <47234FCF.4010204@student.utwente.nl>
Date: Sat, 27 Oct 2007 16:48:47 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1Ilkzv-0004qZ-Aq@linuxtogo.org>
In-Reply-To: <E1Ilkzv-0004qZ-Aq@linuxtogo.org>
X-Enigmail-Version: 0.95.4
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev conf/machine/include/tune-ppc405.inc : Move	TARGET_FPU = "soft" to the tune file so its
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
X-List-Received-Date: Sat, 27 Oct 2007 14:56:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

ifaistos commit schreef:
> conf/machine/include/tune-ppc405.inc : Move TARGET_FPU    =  "soft" to the tune file so its 
> get used by all machines that have a amcc405 cpu

If the ppc kernel has a floating point emulator, this setting should be
moved to the distrobution, since it's policy.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHI0/OMkyGM64RGpERAhaJAJ45iudeERW/KCWNIDG8trBIp0rFvgCfSb86
XUXK0oRevc8E/wMXQPaRiRg=
=O3km
-----END PGP SIGNATURE-----


