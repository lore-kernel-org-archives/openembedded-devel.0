Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GYQhO-0008KA-4Z
	for openembedded-devel@openembedded.org; Fri, 13 Oct 2006 19:19:54 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9DHDLZS032733 for <openembedded-devel@openembedded.org>;
	Fri, 13 Oct 2006 19:13:21 +0200
Message-ID: <452FC947.6020404@dominion.kabel.utwente.nl>
Date: Fri, 13 Oct 2006 19:13:43 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <698474498.20061013195107@gmail.com>
In-Reply-To: <698474498.20061013195107@gmail.com>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] handhelds-pxa-2.6 -> linux-handhelds-2.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Oct 2006 17:19:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello openembedded-devel,
> 
>   Following the waves of cleanups happening this week, I'd like to
> propose to rename handhelds-pxa-2.6*.bb which are recipes to build
> kernels from Handhelds.org CVS tree. Reasons are:
> 
> 1. There's a (newer) convention to have generic package name, i.e.
> "linux" in name of kernel recipes.
> 2. "pxa" there is misleading, as 2.6 tree supports different
> architectures. Handhelds.org tree as of now supports PXA, SA, and S3
> (Samsung) devices. To the various degrees, but that's improving.
> 
>   So, I propose to rename the recipes in question to start with
> "linux-handhelds-2.6" ("2.6" is stil important as there's 2.4 tree and
> HH.org too).

Sounds good, wanna prepare some patches?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFL8lHMkyGM64RGpERAmCCAKC8ATa/1siWfxlUlH+7lMHDvzDyQQCgte9S
L3dq/HvIzJGGUH1YwqwAakU=
=lr3e
-----END PGP SIGNATURE-----


