Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QU1SZ-0008N8-B2
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 20:57:03 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LMF00MGKOGWF5K4@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Jun 2011 13:53:25 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 15CF914AF5D; Tue,
	07 Jun 2011 14:53:20 -0400 (EDT)
Date: Tue, 07 Jun 2011 14:53:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110607185320.GB2512@denix.org>
References: <iskpst$avh$1@dough.gmane.org>
MIME-version: 1.0
In-reply-to: <iskpst$avh$1@dough.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [2011.03-maintenance] Pull request #20
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
X-List-Received-Date: Tue, 07 Jun 2011 18:57:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jun 07, 2011 at 11:09:49AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Tom,
> 
> Please pull the 9 commits from here:

Are there 9 or 7 commits?

> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance

Also, I forgot the HTTP link to gitweb/cgit of your branch, can you provide 
one? Thanks.


And one more question, not directly related to this pull request - has anyone 
else seen cgit.oe.org showing the last commit instead of the log of all the 
commits in a branch? From time to time I keep seeing this odd behavior...

-- 
Denys


> Chris Larson (4):
>       sourceipk: allow override of the section
>       sourceipk: use tar to get the files copied, rather than cp
>       sourceipk: deal with compileconfigs only when it exists
>       sourceipk: exclude temp dirs when S == WORKDIR
> 
> Koen Kooi (3):
>       linux-omap 2.6.39: sync with meta-texasinstruments for bootup fixe
>       linux-omap 2.6.39: sync with meta-texasinstruments again
>       libxaw: fix depchains
> 
> These are all cherry-picks from .dev
> 
> regards,
> 
> Koen
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFN7erdMkyGM64RGpERAkiwAJ4iS5aYsyrCGje1mlcpqOjsX6I+ZwCgkHCC
> v96DkbOoQW5EpP4ghFGb+3o=
> =Rpm0
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


