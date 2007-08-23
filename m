Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IOAjh-0006Ix-9N
	for openembedded-devel@openembedded.org; Thu, 23 Aug 2007 13:20:26 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7NBJAj1019807 for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 13:19:10 +0200
Message-ID: <46CD6D45.9050602@dominion.kabel.utwente.nl>
Date: Thu, 23 Aug 2007 13:19:33 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <1ef816af0708221151m5c3c2b4ds9b90fdbddc56d8d1@mail.gmail.com>	<19c1b8a90708221646p6cfd0e6do6574668bbe15d775@mail.gmail.com>	<1ef816af0708230241s62454f78oa0147b10cae53ce6@mail.gmail.com>
	<46CD69E3.707@whitby.id.au>
In-Reply-To: <46CD69E3.707@whitby.id.au>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-SpamScore: s
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: binutils-cross_2.17.50.0.5.bb failed
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
X-List-Received-Date: Thu, 23 Aug 2007 11:20:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rod Whitby schreef:
> yakov.zaytsev@gmail.com wrote:
>> ..binutils-cross-2.17.50.0.5-r1/temp/log.do_configure.8057 contains
>>
>> --
>> /Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-
>> cross-2.17.50.0.5-r1/temp/run.do_configure.8057: line 782: do_configure:
>> command not found
> 
> You've been bitten by the "build crosses midnight GMT" bitbake bug.
> 
> Rebuild the affected package using "make rebuild-package-binutils-cross"
> if this occurs.  See Mickey's other email on the subject.

you mean 'bitbake -c rebuild binutils-cross'? Please stop with those unhelpfull comments.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGzW1FMkyGM64RGpERArIgAJ9DUEs1fP8yR4OyXW0MZ5rCdg3mPgCfX5MK
lmpW4rkUJSNiYAiZpgIKdnI=
=+zA4
-----END PGP SIGNATURE-----


