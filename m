Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <dp@xora.org.uk>) id 1GWqZC-0004ym-Dm
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Oct 2006 10:32:54 +0200
Received: from xora.org.uk ([::ffff:85.210.161.143])
	(AUTH: LOGIN dp, TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Mon, 09 Oct 2006 09:26:44 +0100
	id 000041DE.452A07C4.00004423
Date: Mon, 9 Oct 2006 09:26:45 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061009082645.GB2541@stygia.hyboria>
References: <45296EB8.7070704@dominion.kabel.utwente.nl>
	<1160382102.5741.19.camel@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <1160382102.5741.19.camel@localhost.localdomain>
User-Agent: Mutt/1.5.11
Subject: Re: [RFC] Removing MAINTAINER field from recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Oct 2006 08:32:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> What is missing here is the proposed alternative. The idea we discussed
> was having a Maintainers file, similar in spirit to that in the Linux
> kernel where people can detail areas they're interested in and give some
> kind of indication of the type of support they want to give.
> 
> For example, in the case of linux-openzaurus-*, I'd consider that I
> actively maintain that, and I'd like to be consulted on changes to those
> files.
> 
This I like as a proposal. For example my listing would be the packages
that I actively maintain now plus a generic entry about audio/video.

> This removes all kinds of policy issues such as "when I copy a .bb file
> to a new version, who is the maintainer"? 
> 
That does neatly fix that problem, as long as people dont take it for an
excuse not to communicate.

> The format of the maintainers file is yet to be determined and proposals
> are welcome. So far the requirements are something simple and consistent
> in an easily parsed format (both human and computer parsed). We need to
> list a contact, the packages covered and the level of interactivity of
> the maintainer (we need a list of these levels?).
> 
> 
> By creating this new file, we get the overhaul of the MAINTAINERS we
> need and it solves a lot of existing policy issues which we can't solve
> with the existing structure so personally, I'm very much in favour of
> it.
> 
I second this proposal, it covers the issues I raised with my earlier
email and gives still a point of contact which I like.

Graeme



