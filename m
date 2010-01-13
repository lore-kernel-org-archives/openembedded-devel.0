Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NV6nR-00048d-TV
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 18:14:21 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KW700MY93R6ZDF3@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	13 Jan 2010 11:11:35 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 51D7814AF60; Wed,
	13 Jan 2010 12:11:30 -0500 (EST)
Date: Wed, 13 Jan 2010 12:11:30 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100113171130.GE24151@denix.org>
References: <1263313682-14996-1-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1263313682-14996-1-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [STABLE][PATCH] jamvm-initial: add libffi-native	dependency
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
X-List-Received-Date: Wed, 13 Jan 2010 17:14:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jan 12, 2010 at 05:28:02PM +0100, Marcin Juszkiewicz wrote:
> From: Martin Jansa <martin.jansa@gmail.com>
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/jamvm/jamvm-initial_1.5.0.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/jamvm/jamvm-initial_1.5.0.bb b/recipes/jamvm/jamvm-initial_1.5.0.bb
> index 1566deb..4ef56c1 100644
> --- a/recipes/jamvm/jamvm-initial_1.5.0.bb
> +++ b/recipes/jamvm/jamvm-initial_1.5.0.bb
> @@ -2,7 +2,7 @@ SUMMARY = "A compact Java Virtual Machine which conforms to the JVM specificatio
>  HOMEPAGE = "http://jamvm.sourceforge.net/"
>  LICENSE = "GPL"
>  
> -DEPENDS = "zlib-native classpath-initial jikes-initial"
> +DEPENDS = "zlib-native classpath-initial jikes-initial libffi-native"
>  
>  PR = "r1"
>  
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


