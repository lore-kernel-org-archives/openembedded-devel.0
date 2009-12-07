Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NHb73-0007on-6S for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 11:46:44 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NHb5T-0007LI-1M
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 11:45:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 11:45:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 11:45:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 07 Dec 2009 11:43:42 +0100
Message-ID: <hfim8u$osr$7@ger.gmane.org>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>	<1260139496-21442-2-git-send-email-leon@sidebranch.com>	<1260139496-21442-3-git-send-email-leon@sidebranch.com>	<1260139496-21442-4-git-send-email-leon@sidebranch.com>	<1260139496-21442-5-git-send-email-leon@sidebranch.com>	<1260139496-21442-6-git-send-email-leon@sidebranch.com>	<1260139496-21442-7-git-send-email-leon@sidebranch.com>	<1260139496-21442-8-git-send-email-leon@sidebranch.com>	<1260139496-21442-9-git-send-email-leon@sidebranch.com>	<1260139496-21442-10-git-send-email-leon@sidebranch.com>	<1260139496-21442-11-git-send-email-leon@sidebranch.com>	<1260139496-21442-12-git-send-email-leon@sidebranch.com>	<1260139496-21442-13-git-send-email-leon@sidebranch.com>	<1260139496-21442-14-git-send-email-leon@sidebranch.com>
	<1260139496-21442-15-git-send-email-leon@sidebranch.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <1260139496-21442-15-git-send-email-leon@sidebranch.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux-libc-headers_nios2-2.6.28: nios2 fork.
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
X-List-Received-Date: Mon, 07 Dec 2009 10:46:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06-12-09 23:44, Leon Woestenberg wrote:
> Tested-by: Walter Goossens<walter.goossens@axon.tv>
> Tested-by: Leon Woestenberg<leon@sidebranch.com>
> Signed-off-by: Leon Woestenberg<leon@sidebranch.com>
> ---
>   .../headless_hwselect.patch                        |  120 +
>   .../linux-libc-headers-nios2-2.6.28/procinfo.h     |   24 +
>   .../linux-libc-headers-nios2-2.6.28/system.ptf     | 3492 ++++++++++++++++++++

Same comment about screwing up versioning as gcc, binutils and uclibc



