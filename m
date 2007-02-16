Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HHy7y-0007WK-IY
	for openembedded-devel@openembedded.org; Fri, 16 Feb 2007 09:07:51 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1G87Sox007609 for <openembedded-devel@openembedded.org>;
	Fri, 16 Feb 2007 09:07:29 +0100
Message-ID: <45D5663E.5080909@dominion.kabel.utwente.nl>
Date: Fri, 16 Feb 2007 09:07:26 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HHusH-0003vr-5o@linuxtogo.org>
In-Reply-To: <E1HHusH-0003vr-5o@linuxtogo.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev libxslt: add native package. Closes 1839.
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
X-List-Received-Date: Fri, 16 Feb 2007 08:07:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tom commit schreef:
> libxslt: add native package.  Closes 1839.

> +require libxslt_${PV}.bb

ERROR: Could not include required file libxslt_1.1.17.bb while parsing
/home/koen/OE/monotone/org.openembedded.dev/packages/libxslt/libxslt-native_1.1.17.bb

could someone please fix that?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF1WY+MkyGM64RGpERAstVAJsENci4+arZVCTXwT1mrqBNu7zKwQCdG8Cc
XCqNRnp00TBRjPdukc17NSY=
=pHmk
-----END PGP SIGNATURE-----


