Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Phqmp-00069L-C8 for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 22:50:53 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Phqm4-0005Ap-Jt for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 22:50:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 22:50:04 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 22:50:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 25 Jan 2011 22:45:11 +0100
Message-ID: <ihng97$64q$2@dough.gmane.org>
References: <1295654503-26379-1-git-send-email-lm@larsmichelsen.com>	<ihedau$stf$1@dough.gmane.org>	<4D3AC11C.2040602@larsmichelsen.com>	<4D3AC6F0.4050802@xora.org.uk>	<ihel1v$tnt$1@dough.gmane.org>	<4D3ADC2C.6070506@larsmichelsen.com>	<ihesdm$v7u$1@dough.gmane.org>	<4D3B15FB.5000403@larsmichelsen.com>	<4D3F1253.7060202@larsmichelsen.com>	<ihn57v$84o$1@dough.gmane.org>
	<4D3F3E2E.5030308@larsmichelsen.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D3F3E2E.5030308@larsmichelsen.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] mplayer_svn: Package can be built again; Bumped to rev. 31329.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jan 2011 21:50:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-01-11 22:18, Lars Michelsen wrote:
> On 25/01/11 19:36, Koen Kooi wrote:
> On 25-01-11 19:11, Lars Michelsen wrote:
>>>> Hello Koen,
>>>>
>>>> On 22/01/11 18:38, Lars Michelsen wrote:
>>>>>> Could you try the current recipe and see if it works for you? It works
>>>>>> on my omap3 boards quite well, minus a dlopen() buglet in libdvdcss2.
>>>>>>
>>>>>
>>>>> I am not able to build it. Seems to be related to the (annoying!)
>>>>> ffmpeg
>>>>> subrepository thing. With that sub-repo there is no control about the
>>>>> version to be used. One day it works and one day later it is broken...
>>>>>
>>>>> Here is the output:
>>>>>
>>>>> NOTE: Applying patch 'offset.patch' (mplayer/offset.patch)
>>>>> FATAL: Execution of 'quilt
>>>>> --quiltrc=/media/lm/transfer/oetmp/sysroots/x86_64-linux/usr/bin/quiltrc
>>>>>
>>>>> push' failed with exit code 1:
>>>>> Applying patch offset.patch
>>>>> patching file ffmpeg/libavcodec/arm/asm-offsets.h
>>>>> Hunk #1 FAILED at 35.
>>>>> 1 out of 1 hunk FAILED -- rejects in file
>>>>> ffmpeg/libavcodec/arm/asm-offsets.h
>>>>> Patch offset.patch does not apply (enforce with -f)
>>>>
>>>> Do you have any idea how to solve this?
> 
>   I can't reproduce, so no :(
> 
>> Even when you clean up your checked out mplayer sources?
>> That sounds strange to me...

It then downloads a snapshot from the angstrom source mirror
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNP0RnMkyGM64RGpERAlITAJ9eaQ2f2SfKaad7TUgIU+Pbau81PgCgqM1A
Ropx9rDCW1KZwHUdSzUArlY=
=Nazd
-----END PGP SIGNATURE-----



