Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H5t1X-0003fy-JT
	for openembedded-devel@openembedded.org; Sun, 14 Jan 2007 01:14:59 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l0E0Cjox013312 for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jan 2007 01:12:46 +0100
Message-ID: <45A97575.4060103@dominion.kabel.utwente.nl>
Date: Sun, 14 Jan 2007 01:12:37 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1888834532.20070112204308@vanille-media.de>	<1168681959.5868.4.camel@localhost.localdomain>	<45A905A7.4070300@dominion.kabel.utwente.nl>	<200701132239.31919.alban@mycroft1.plus.com>
	<B194FC84-D017-4B53-8FB3-E30FCE2446A4@gmx.net>
In-Reply-To: <B194FC84-D017-4B53-8FB3-E30FCE2446A4@gmx.net>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Angstrom cannot buile portabase
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
X-List-Received-Date: Sun, 14 Jan 2007 00:14:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
> Am 13.01.2007 um 23:39 schrieb Alban J Pearce:
> 
>> I have installed Angstrom
>> bitbake , nano works
>>
>>  NOTE: build 200701132219: started
>>
>> OE Build Configuration:
>> BB_VERSION     = "1.6.2"
>> OE_REVISION    = "28548b0eda864e1b3a44136bcced77ee8c1e9dab"
>> TARGET_ARCH    = "arm"
>> TARGET_OS      = "linux-gnueabi"
>> MACHINE        = "spitz"
>> DISTRO         = "angstrom"
>> DISTRO_VERSION = "test-20070113"
>> TARGET_FPU     = "soft"
>>
>> But bitbake portsabase fails
>>
>> NOTE: Applying patch 'kernel-keymap.patch'
>> Command Error: exit status: 1  Output:
>> Applying patch kernel-keymap.patch
>> can't find file to patch at input line 10
>> Perhaps you used the wrong -p or --strip option?
>> The text leading up to this was:
> 
> 
> Hi,
> 
> did you run out of disk space?

This again highlights why angstrom doesn't support Opie. It is broken. Feel free to fix it.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFqXV1MkyGM64RGpERAvzXAJ4ieApVu7oipWI09HadA85S8sXYhgCeKvfR
ZIlBSjqhdWBzzfmUmFBiLxs=
=W9Rb
-----END PGP SIGNATURE-----


