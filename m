Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NV6kM-0003p8-5g
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 18:11:09 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KW7003MB3M3N640@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	13 Jan 2010 11:08:33 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 44D8014AF60; Wed,
	13 Jan 2010 12:08:27 -0500 (EST)
Date: Wed, 13 Jan 2010 12:08:27 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100113170827.GB24151@denix.org>
References: <1263401193-12161-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1263401193-12161-3-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1263401193-12161-3-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: Re: [STABLE][PATCH 2/2] linux-bug: bumped SRCREV
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
X-List-Received-Date: Wed, 13 Jan 2010 17:11:09 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jan 13, 2010 at 05:46:33PM +0100, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <marcin@buglabs.net>
> 
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/linux/linux-bug_2.6.27.2.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/linux/linux-bug_2.6.27.2.bb b/recipes/linux/linux-bug_2.6.27.2.bb
> index 85ed0a9..74d74be 100644
> --- a/recipes/linux/linux-bug_2.6.27.2.bb
> +++ b/recipes/linux/linux-bug_2.6.27.2.bb
> @@ -2,12 +2,12 @@ DESCRIPTION = "Linux kernel for bug"
>  
>  PV_append = "+svnr${SRCREV}"
>  KV = "2.6.27.2"
> -PR = "r31"
> +PR = "r32"
>  
>  COMPATIBLE_MACHINE = "bug"
>  
>  SVN_PRJ = "bug-linux-${KV}"
> -SRCREV = "10550"
> +SRCREV = "10746"
>  
>  SRC_URI = "svn://svn.buglabs.net/bug/branches/R1.4/qa;module=${SVN_PRJ};proto=svn \
>             file://defconfig \
> -- 
> 1.6.6
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


