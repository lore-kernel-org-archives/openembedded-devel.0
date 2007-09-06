Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1ITBJX-0001vb-HG
	for openembedded-devel@openembedded.org; Thu, 06 Sep 2007 08:58:08 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l866tRgq010729 for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Sep 2007 08:55:29 +0200
Message-ID: <46DFA451.6020006@student.utwente.nl>
Date: Thu, 06 Sep 2007 08:55:13 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46CF6903.7060703@dominion.kabel.utwente.nl>
	<20070905225908.dcyz0rbxa8wo4ows@www.bufferoverflow.ch>
In-Reply-To: <20070905225908.dcyz0rbxa8wo4ows@www.bufferoverflow.ch>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: OE website upgraded to drupal 5.2
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
X-List-Received-Date: Thu, 06 Sep 2007 06:58:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Roger Meier schreef:
> Hi Koen
> 
> Which drupal and module versions did you use before upgrade?
> 
> There are still some issues with the wiki headings.
> e.g. on page http://www.openembedded.org/wiki/GettingStarted

That is manually inserted html, so probably the content-type for wiki needs to get
cascaded or we have to patch the markup filter.

> Do you use the Liquid Wiki Engine?

Yes, the 5.2 version.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG36RQMkyGM64RGpERAhAsAKCDqSQNUr7mPUNgH++RoYNUD9vt/wCdGmx2
u7SB37hL1+0QdiYhK9pOkNw=
=j+Pn
-----END PGP SIGNATURE-----


