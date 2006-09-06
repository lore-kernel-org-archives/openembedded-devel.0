Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GL1W8-0007LE-0y
	for openembedded-devel@openembedded.org; Wed, 06 Sep 2006 19:48:52 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k86Hjvw4026706 for <openembedded-devel@openembedded.org>;
	Wed, 6 Sep 2006 19:45:58 +0200
Message-ID: <44FF0955.3070607@dominion.kabel.utwente.nl>
Date: Wed, 06 Sep 2006 19:45:57 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.5 (Macintosh/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <E1GKCrb-0005hO-P4@linuxtogo.org>	<1157373682.16945.61.camel@gandalf.tm.informatik.uni-frankfurt.de>	<44FC28C6.5040800@dominion.kabel.utwente.nl>	<1157377129.16945.80.camel@gandalf.tm.informatik.uni-frankfurt.de>	<44FC2E10.2020807@dominion.kabel.utwente.nl>
	<44FD86BF.2070200@laposte.net>
In-Reply-To: <44FD86BF.2070200@laposte.net>
X-Enigmail-Version: 0.94.0.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Improving consistency
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
X-List-Received-Date: Wed, 06 Sep 2006 17:48:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

cyril Romain schreef:
> Koen Kooi wrote:
>>>> Is it possible to have a 'bitbake sanitize <provider>' command that
>>>> will output a
>>>> sanitized .bb? 

> ./sanitize.py yourBitbakeFile.bb
> 
> To create a sanitized file and a patch e.g. for gcc_4.1.1.bb:
> ./sanitize.py gcc_4.1.1.bb > gcc_4.1.1.bb.sanitized; diff -u
> gcc_4.1.1.bb  gcc_4.1.1.bb.sanitized > gcc_4.1.1.bb.patch

I added the script to the contrib/ dir in the org.openembedded.dev branch. Thanks for
writing it!

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFE/wlVMkyGM64RGpERAt0tAJwMaM/Dx78W5C+AK27r3CzV6gczjgCgtl2u
dnCPnZJPPz9qKMxOmehDcwE=
=JV+d
-----END PGP SIGNATURE-----


