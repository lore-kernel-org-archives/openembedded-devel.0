Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PzI9d-00015n-Mo
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 01:30:29 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI200BJNPBJTWJ2@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	14 Mar 2011 19:28:37 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5DC9114AF6C; Mon,
	14 Mar 2011 20:28:26 -0400 (EDT)
Date: Mon, 14 Mar 2011 20:28:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110315002826.GA29374@denix.org>
References: <1300148053.3828.9.camel@mattotaupa>
MIME-version: 1.0
In-reply-to: <1300148053.3828.9.camel@mattotaupa>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] mango-lassi: Typo. s/ESCRIPTION/DESCRIPTION/
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
X-List-Received-Date: Tue, 15 Mar 2011 00:30:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 15, 2011 at 01:14:13AM +0100, Paul Menzel wrote:
> Date: Fri, 18 Feb 2011 00:32:01 +0100
> 
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> Dear OE folks,
> 
> 
> before I push this, could you please tell me, if a PR bump is needed.
> 
> I would say yes, since the description gets included in the package?

Makes sense to bump the PR, so binary feeds get updated with the correct 
package containing proper description.

-- 
Denys


> [1] http://www.openembedded.org/index.php/When_To_Bump_PR
> ---
>  recipes/avahi/mango-lassi_git.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/avahi/mango-lassi_git.bb b/recipes/avahi/mango-lassi_git.bb
> index c2250d8..a1a4117 100644
> --- a/recipes/avahi/mango-lassi_git.bb
> +++ b/recipes/avahi/mango-lassi_git.bb
> @@ -1,4 +1,4 @@
> -ESCRIPTION = "Input sharing, the avahi way"
> +DESCRIPTION = "Input sharing, the avahi way"
>  DEPENDS = "avahi-ui libglade libnotify"
>  
>  SRCREV = "73638817126a68d62f1233f6e6859ce75a259e93"
> -- 
> 1.7.4.1
> 



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



