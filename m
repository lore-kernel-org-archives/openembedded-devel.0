Received: from [206.46.173.13] (helo=vms173013pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MM5GK-0003lN-JQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 21:14:32 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KM4002T4A75YX06@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	01 Jul 2009 14:02:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 07DB414AF5F; Wed,
	01 Jul 2009 15:01:52 -0400 (EDT)
Date: Wed, 01 Jul 2009 15:01:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090701190152.GB20815@denix.org>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
	<1246474461-16671-2-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1246474461-16671-2-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 007/125] base.bbclass: added 'gcc-3.4' to	list of gcc3 versions (Debian systems)
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
X-List-Received-Date: Wed, 01 Jul 2009 19:14:32 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jul 01, 2009 at 08:54:08PM +0200, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <marcin@buglabs.net>
> 
> 
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  classes/base.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 0baf0e0..a901f02 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -1240,7 +1240,7 @@ def check_gcc3(data):
>  	# Start by checking for the program name as we build it, was not
>  	# all host-provided gcc-3.4's will work.
>  
> -	gcc3_versions = 'gcc-3.4.6 gcc-3.4.4 gcc34 gcc-3.4.7 gcc-3.3 gcc33 gcc-3.3.6 gcc-3.2 gcc32'
> +	gcc3_versions = 'gcc-3.4.6 gcc-3.4.4 gcc34 gcc-3.4 gcc-3.4.7 gcc-3.3 gcc33 gcc-3.3.6 gcc-3.2 gcc32'
>  
>  	for gcc3 in gcc3_versions.split():
>  		if check_app_exists(gcc3, data):
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


