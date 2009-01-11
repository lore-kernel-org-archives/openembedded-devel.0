Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LM4LM-0007iZ-Sn
	for openembedded-devel@openembedded.org; Sun, 11 Jan 2009 18:43:24 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LM4FD-0008ME-NZ
	for openembedded-devel@openembedded.org; Sun, 11 Jan 2009 17:37:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 11 Jan 2009 17:37:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 11 Jan 2009 17:37:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 11 Jan 2009 18:36:52 +0100
Message-ID: <gkdanl$3ht$1@ger.gmane.org>
References: <20090111152021.47737188463@amethyst.openembedded.net>
	<20090111170659.GC17627@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081230 Shredder/3.0b2pre
In-Reply-To: <20090111170659.GC17627@excalibur.local>
Sender: news <news@ger.gmane.org>
Subject: Re: Koen Kooi : mtd-utils: add 1.2.0+git for ubifs-support
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
X-List-Received-Date: Sun, 11 Jan 2009 17:43:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-01-09 18:06, Stefan Schmidt wrote:
> Hello.
>
> On Sun, 2009-01-11 at 16:20, GIT User account wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: f8d4b8781f2b228754a448289f5b2a97844f50bc
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=f8d4b8781f2b228754a448289f5b2a97844f50bc
>>
>> Author: Koen Kooi<koen@openembedded.org>
>> Date:   Sun Jan 11 16:19:06 2009 +0100
>>
>> mtd-utils: add 1.2.0+git for ubifs-support
>> * no -native version added yet
>
> Since this commit mtd-utils fails for me with:
>
> | In file included from lpt.c:23:
> | mkfs.ubifs.h:48:23: error: uuid/uuid.h: No such file or directory

Ah, I had efsprogs-libs already built, so I didn't notice that. Should 
be fixed now. Thanks for reporting that.

regards,

Koen



