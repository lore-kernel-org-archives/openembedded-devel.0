Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LxvB5-0007tB-Da
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Apr 2009 05:37:15 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIO000S8V5UGMMO@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	25 Apr 2009 22:32:19 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8C67E6B83B5; Sat,
	25 Apr 2009 23:32:18 -0400 (EDT)
Date: Sat, 25 Apr 2009 23:32:18 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090426033218.GG28636@denix.org>
References: <200904252358.02016.marcin@juszkiewicz.com.pl>
	<b6ebd0a50904251916o501ae804vdb4008414cca6963@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <b6ebd0a50904251916o501ae804vdb4008414cca6963@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Removing GIT branches
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
X-List-Received-Date: Sun, 26 Apr 2009 03:37:15 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Apr 25, 2009 at 07:16:23PM -0700, Chris Larson wrote:
> git push remotename :remotebranch
> 
> You're pushing "nothing" (the left side of the : separator) to the
> remote branch, which is removal.

I thought there was a hook to prevent anybody from deleting arbitrary branches 
and only admins (Mickey) can remove branches...

> On Sat, Apr 25, 2009 at 2:58 PM, Marcin Juszkiewicz
> <marcin@juszkiewicz.com.pl> wrote:
> >
> > Hi
> >
> > Can someone remove hrw/poky-merge/add-rpm-packages-support and
> > hrw/poky-rpm branches? They are obsolete now as code from them
> > is merged into .dev already.

-- 
Denys


