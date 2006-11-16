Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gkn11-0001t9-EA
	for openembedded-devel@openembedded.org; Thu, 16 Nov 2006 20:35:15 +0100
Received: from [172.20.0.22] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kAGJWrLr026226 for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2006 20:32:54 +0100
Message-ID: <455CBCE4.6030003@dominion.kabel.utwente.nl>
Date: Thu, 16 Nov 2006 20:32:52 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200611162023.23012.openembedded@hrw.one.pl>
In-Reply-To: <200611162023.23012.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: KERNELORG_MIRROR variable
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
X-List-Received-Date: Thu, 16 Nov 2006 19:35:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> We have several mirrors defined in base.bbclass like SourceForge mirror, 
> GNU mirror etc. There are also mirrors defined for few popular sources 
> (gnutls for example).
> 
> I want to introduce kernel.org mirror variable: KERNELORG_MIRROR because 
> currently we use:
> 
> http://ftp.kernel.org/
> ftp://ftp.kernel.org/
> http://kernel.org/
> 
> and only second one is listed in base.bbclass
> 
> I would push changeset with it during weekend.

Good idea!


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFXLzkMkyGM64RGpERAoZBAJ46RkB5TESBA68j3JP1dXPpp8OclQCfVfq9
DnjgcuIbrFRcquk2dqecpNw=
=KWAB
-----END PGP SIGNATURE-----


