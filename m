Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LjevV-0007E5-0p
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 20:26:49 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ljeuj-0000Y8-G0
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 19:25:25 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 17 Mar 2009 19:25:25 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Mar 2009 19:25:25 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 17 Mar 2009 20:25:14 +0100
Message-ID: <gpoter$l42$1@ger.gmane.org>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
In-Reply-To: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 17 Mar 2009 19:26:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-03-09 20:18, Chris Larson wrote:
> I'd like to propose re-establishing MAINTAINER, set per package, to
> individuals, or left as default for packages which aren't directly
> maintained.
>
> Doing this would:
> - Facilitate dumping a list of unmaintained packages to give to new
> users wanting to volunteer to help us, but not knowing how to
> contribute.
> - Return some individual responsibility to the project, giving one
> person the blame for brokenness for that package, as well as giving
> responsibility for pushing patches upstream to that person.  In my
> opinion, a number of the recent issues in the project are due, in
> part, to a lack of that individual responsibility.  Everything is
> fuzzy, determined by a group, instead.
> - Allow us to physically separate, in the repository, those packages
> which get the most attention (are maintained) from those which get the
> least (maintained by the entire team).  We could finally be *honest*
> with our users about what we work on, telling them that the packages
> which are maintained by the team are in need of an individual
> maintainer, and get less attention, so bugs there will be fixed more
> slowly, and there are no guarantees on functionality there.  I think
> it'd be better to have a core set of *functional* recipes than have a
> huge set of "might work, might not" recipes as things stand today.  In
> my opinion, this would be more likely to give new users stability than
> creating a stable branch, while making better use of our limited
> manpower, rather than increasing the load drastically.
>
> Opinions?

As long as it doesn't get put in resulting packages in any way, it's 
fine by me.

regards,

Koen




