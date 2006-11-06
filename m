Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gh1hZ-00012o-3e
	for openembedded-devel@openembedded.org; Mon, 06 Nov 2006 11:27:37 +0100
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kA6AQILr003520 for <openembedded-devel@openembedded.org>;
	Mon, 6 Nov 2006 11:26:18 +0100
Message-ID: <454F0DCA.7040202@dominion.kabel.utwente.nl>
Date: Mon, 06 Nov 2006 11:26:18 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200611061111.13491.valentin.longchamp@epfl.ch>
In-Reply-To: <200611061111.13491.valentin.longchamp@epfl.ch>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Problem in building compiler
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
X-List-Received-Date: Mon, 06 Nov 2006 10:27:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Valentin Longchamp schreef:
> Hello,

[snip problem]

> Anyone has an idea, according to my config files regarding the cross-compiler, 
> of what is wrong here ?

Does the same error happen with MACHINE=mx31ads and DISTRO=angstrom-2007.1 ? I recommend
using that configuration and adding 'branding' later on when it's proven to work.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFTw3JMkyGM64RGpERAmyeAKCyqifnJi7eCyjbQZGEQ/afwK99IQCfdMkE
azRiNMiBSckUi4Tetr33tEI=
=U1jz
-----END PGP SIGNATURE-----


