Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HKFdx-0001NW-VY
	for openembedded-devel@openembedded.org; Thu, 22 Feb 2007 16:14:02 +0100
Received: from [130.89.136.185] (wlan136185.mobiel.utwente.nl [130.89.136.185])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1MFDvox009989 for <openembedded-devel@openembedded.org>;
	Thu, 22 Feb 2007 16:13:58 +0100
Message-ID: <45DDB334.2050008@dominion.kabel.utwente.nl>
Date: Thu, 22 Feb 2007 16:13:56 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45DCC76A.7000002@dominion.kabel.utwente.nl>
	<45DD7D8B.6040906@dominion.kabel.utwente.nl>
In-Reply-To: <45DD7D8B.6040906@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: QA issues with pkgconfig files
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
X-List-Received-Date: Thu, 22 Feb 2007 15:14:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Koen Kooi schreef:
> 
>> Possible solutions:
> 
>> 1) set PKG_CONFIG_PATH to ${STAGING_LIBDIR}/pkgconfig
>>    +easy fix
>>    -requires to re-run do_pupulate_staging for all packages
> 
> This seems to fix it in a clean way. Any objections to this going in today?

Speak now or be silent forever....

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF3bM0MkyGM64RGpERAj+6AKCMDxx8a7wKvUTT90kr84En2R4HXQCgqfkX
YnxlmEKeyQBQ8stwIVw/YHs=
=ZvIf
-----END PGP SIGNATURE-----


