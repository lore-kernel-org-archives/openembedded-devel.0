Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NGYui-0007UC-J0 for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 15:13:43 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NGYt8-0004g8-4K
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 15:12:02 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 15:12:02 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 15:12:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 04 Dec 2009 15:11:34 +0100
Message-ID: <hfb5am$nqi$2@ger.gmane.org>
References: <E1NGVGl-0006do-JZ@melo.openembedded.org>
	<141020e30912040548u2fec09dal9cf48622ded5adb7@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <141020e30912040548u2fec09dal9cf48622ded5adb7@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Koen Kooi : efl: bump SRCREV to fix some crashes
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
X-List-Received-Date: Fri, 04 Dec 2009 14:13:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-12-09 14:48, Martin Jansa wrote:
> On Fri, Dec 4, 2009 at 11:20 AM, git version control<
> git@git.openembedded.org>  wrote:
>
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: ea85fd4e1fdb1f09fd21f65e077aab2f7ccdf65e
>> URL:
>> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=ea85fd4e1fdb1f09fd21f65e077aab2f7ccdf65e
>>
>> Author: Koen Kooi<koen@openembedded.org>
>> Date:   Fri Dec  4 11:17:57 2009 +0100
>>
>> efl: bump SRCREV to fix some crashes
>>
>
> This patch
> http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/efl1/ecore/iconv.patch
> does not apply anymore, only first chunk, which should be easy to update
>
> I'm not sure if its worth creating new patch and let old one exist with
> maxrev=sth, so please someone else update that one.

crap, I had already max-rev'd it but only did 'git commit conf/distro'...

regards,

Koen



