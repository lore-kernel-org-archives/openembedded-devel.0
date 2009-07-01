Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MM5cA-0003lz-SB
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 21:37:07 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KM400CULB9HQ0G1@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	01 Jul 2009 14:24:53 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D8F7614AF5F; Wed,
	01 Jul 2009 15:24:52 -0400 (EDT)
Date: Wed, 01 Jul 2009 15:24:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090701192452.GG20815@denix.org>
References: <200907011818.18407.marcin@juszkiewicz.com.pl>
	<1246474496-16704-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1246474496-16704-1-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 036/125] u-boot_git.bb : Update	FILESPATHPKG to include u-boot-git directory.
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
X-List-Received-Date: Wed, 01 Jul 2009 19:37:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jul 01, 2009 at 08:54:51PM +0200, Marcin Juszkiewicz wrote:
> From: Philip Balister <philip@balister.org>
> 
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/u-boot/u-boot_git.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
> index e5a8d5d..eee6d97 100644
> --- a/recipes/u-boot/u-boot_git.bb
> +++ b/recipes/u-boot/u-boot_git.bb
> @@ -1,6 +1,8 @@
>  require u-boot.inc
>  PR ="r22"
>  
> +FILESPATHPKG =. "u-boot-git:"
> +
>  SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git "
>  SRCREV_davinci-sffsdr = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
>  SRCREV_davinci-dvevm = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
> -- 
> 1.6.3.1
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


