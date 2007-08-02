Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IGbYx-0001Cn-Jj
	for openembedded-devel@openembedded.org; Thu, 02 Aug 2007 16:22:03 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l72EJwj1020467 for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Aug 2007 16:19:58 +0200
Message-ID: <46B1E812.8020706@dominion.kabel.utwente.nl>
Date: Thu, 02 Aug 2007 16:20:02 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46B1753D.1090507@dominion.kabel.utwente.nl>	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>	<46B1E063.7010407@dominion.kabel.utwente.nl>
	<1186064138.5972.259.camel@hammer.suse.cz>
In-Reply-To: <1186064138.5972.259.camel@hammer.suse.cz>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Gstreamer and rpath
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
X-List-Received-Date: Thu, 02 Aug 2007 14:22:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stanislav Brabec schreef:
> Koen Kooi wrote:
> 
>>> I see no problem here: For cross compilation OE compiles its own
>>> compiler, which already supports --sysroot,
>> No. We have a gcc-cross_3.3.3.bb and 3.3.4
> 
> But Angstrom uses 4.1.2 as default, isn't it? And it compiles everything
> correctly (except qemu).

OE != angstrom
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGsegSMkyGM64RGpERAs9EAJ9aWZcVWuqab5/Ly4QVT2LIV4DXFQCgknlK
uclWnyqzCSbAMgHEl5+F4dQ=
=6QXr
-----END PGP SIGNATURE-----


