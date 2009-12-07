Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NHbQX-00072k-D3 for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 12:06:52 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NHbOw-0006yx-DG
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 12:05:10 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 12:05:10 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 12:05:10 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 07 Dec 2009 11:42:56 +0100
Message-ID: <hfim7g$osr$6@ger.gmane.org>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>	<1260139496-21442-2-git-send-email-leon@sidebranch.com>	<1260139496-21442-3-git-send-email-leon@sidebranch.com>	<1260139496-21442-4-git-send-email-leon@sidebranch.com>	<1260139496-21442-5-git-send-email-leon@sidebranch.com>	<1260139496-21442-6-git-send-email-leon@sidebranch.com>	<1260139496-21442-7-git-send-email-leon@sidebranch.com>	<1260139496-21442-8-git-send-email-leon@sidebranch.com>	<1260139496-21442-9-git-send-email-leon@sidebranch.com>	<1260139496-21442-10-git-send-email-leon@sidebranch.com>	<1260139496-21442-11-git-send-email-leon@sidebranch.com>	<1260139496-21442-12-git-send-email-leon@sidebranch.com>
	<1260139496-21442-13-git-send-email-leon@sidebranch.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <1260139496-21442-13-git-send-email-leon@sidebranch.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] sane-srcrevs.inc: Add PREFERRED_VERSION_linux-libc-headers for nios2.
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
X-List-Received-Date: Mon, 07 Dec 2009 11:06:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06-12-09 23:44, Leon Woestenberg wrote:
> Signed-off-by: Leon Woestenberg<leon@sidebranch.com>
> ---
>   conf/distro/include/sane-srcrevs.inc |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc

> +SRCREV_pn-linux-libs-headers_nios2 = "d01303a1035a39e445007c7522d89ad985c4153c"

Using a machine override make it non-generic. Anyway, since the cabal 
said checksums belong in the recipe, SRCREVs should be in there as well.

regards,

Koen



