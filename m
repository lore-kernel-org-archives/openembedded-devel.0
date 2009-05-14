Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M4YiL-0002JE-Ch
	for openembedded-devel@openembedded.org; Thu, 14 May 2009 13:03:01 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M4Ybk-0004mL-Ig
	for openembedded-devel@openembedded.org; Thu, 14 May 2009 10:56:12 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 14 May 2009 10:56:12 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 14 May 2009 10:56:12 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 14 May 2009 12:55:57 +0200
Message-ID: <gugtbt$qko$1@ger.gmane.org>
References: <20090513152443.E8DE11893A9@amethyst.openembedded.net>
	<48239d390905140352k60f3c63crd2337be420d63bef@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090510 Shredder/3.0b3pre
In-Reply-To: <48239d390905140352k60f3c63crd2337be420d63bef@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Koen Kooi : angstrom 2009.X: toolchain updates:
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
X-List-Received-Date: Thu, 14 May 2009 11:03:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14-05-09 12:52, Sergey Lapin wrote:
> Hi, all!
>
> On Wed, May 13, 2009 at 7:24 PM, GIT User account
> <git@amethyst.openembedded.net>  wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 448b9103e494765fe589283d399c90e9b6e9cd84
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=448b9103e494765fe589283d399c90e9b6e9cd84
>>
>> Author: Koen Kooi<koen@openembedded.org>
>> Date:   Wed May 13 13:36:43 2009 +0200
>>
>> angstrom 2009.X: toolchain updates:
>>   * make gcc 4.3.3 the default compiler (except for ppc and avr32)
>>   * make binutils 2.18 the default (except for armv7a and avr32)
>>   * disable thumb for armv4t/5te since there's no gcc/binutils combo that works 100% with thumb
> Could I have some details please regarding thumb?
> I remember there was a discussion regarding enabling thumb. Then we
> have silent rollback.

How's this silent?

> Do I miss something?

Yes



