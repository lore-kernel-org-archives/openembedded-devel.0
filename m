Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M3XE1-0005f0-Pp
	for openembedded-devel@openembedded.org; Mon, 11 May 2009 17:15:29 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M3X7d-0002KO-AX
	for openembedded-devel@openembedded.org; Mon, 11 May 2009 15:08:53 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 15:08:53 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 15:08:53 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 11 May 2009 17:08:38 +0200
Message-ID: <gu9f1m$d1q$1@ger.gmane.org>
References: <d1b08f940905110120t2a2162a6rbc2bd7237b2df09e@mail.gmail.com>
	<200905111620.39699.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090427 Shredder/3.0b3pre
In-Reply-To: <200905111620.39699.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: locale_base_ar_kw
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
X-List-Received-Date: Mon, 11 May 2009 15:15:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11-05-09 16:20, Marcin Juszkiewicz wrote:
> Dnia poniedziałek, 11 maja 2009 o 10:20:45 Andrea Adami napisał(a):
>> Inspecting the .dot files I discovered in my recent builds locale
>> base is ar_KW. I did not know the new default locale is Arabic for
>> Kuwait...
>
> It is not default locale... this package contains files which had to be
> in libc6 package... So it is *critical* level of bug.


Isn't that a side effect of the double glibc override?

regards,

KOen



