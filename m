Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1R8oDq-0003tq-JX
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Sep 2011 09:06:26 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LS800F0Q0T5504J@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	28 Sep 2011 02:00:42 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7C46814AF5F; Wed,
	28 Sep 2011 03:00:41 -0400 (EDT)
Date: Wed, 28 Sep 2011 03:00:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110928070041.GA31765@denix.org>
References: <4E82B6B7.10904@dresearch-fe.de>
MIME-version: 1.0
In-reply-to: <4E82B6B7.10904@dresearch-fe.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: pull request script
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
X-List-Received-Date: Wed, 28 Sep 2011 07:06:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Sep 28, 2011 at 07:55:03AM +0200, Steffen Sledz wrote:
> On 27.09.2011 22:54, Tom Rini wrote:
> > On Tue, Sep 27, 2011 at 12:26 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> >> > On 23.09.2011 02:01, Tom Rini wrote:
> >>> >> Applied, thanks.  And for the future, I think it's possible to use the
> >>> >> normal pull request script and point it at github or whatever :)
> >> >
> >> > Where can this mentioned "normal pull request script" be found?
> >
> > I think Koen and Denys both use the oe-core script.
> 
> Is this script available somewhere for the community?

There are few variants around, this is the one from oe-core:

http://cgit.openembedded.org/cgit.cgi/openembedded-core/tree/scripts/create-pull-request

-- 
Denys


