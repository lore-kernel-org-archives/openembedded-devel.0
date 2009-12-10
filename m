Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NIf9L-0007Ed-Jz for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2009 10:17:30 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NIf7Z-0003VP-82
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2009 10:15:37 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2009 10:15:37 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2009 10:15:37 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 10 Dec 2009 10:15:11 +0100
Message-ID: <hfqe6v$311$1@ger.gmane.org>
References: <1259502600-10053-1-git-send-email-ynezz@true.cz>
	<20091209213556.GC18123@ibawizard.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091201 Shredder/3.0.1pre
In-Reply-To: <20091209213556.GC18123@ibawizard.net>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux-omap-2.6.29: add support for ET&T TC5UH touchscreen controller
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
X-List-Received-Date: Thu, 10 Dec 2009 09:17:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09-12-09 22:35, Petr Štetiar wrote:
> Hi,
>
> it's probably just lack of spare time that my patches[1] weren't applied yet,
> right? I would like to ask how should I proceed now, resent them again along
> with more patches I plan to send soon? Or should I create branch on GitHub or
> somewhere else and ask for pull? Would it be easier? Thanks.

Send them again (since at least one of them doesn't apply anymore) and 
change the initscript patch to use update-rc.d.bbclass.

regards,

Koen

>
> -- ynezz
>
> 1. http://patchwork.openembedded.org/patch/1324/
>     http://patchwork.openembedded.org/patch/1325/
>     http://patchwork.openembedded.org/patch/1326/




