Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZaF9-0006tb-5t
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 00:20:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2CNIDxK006661
	for <openembedded-devel@openembedded.org>; Wed, 12 Mar 2008 23:18:13 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06356-09 for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 23:18:09 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2CNHxHr006631
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 12 Mar 2008 23:17:59 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1718.1205362131@dls.net>
References: <1718.1205362131@dls.net>
Date: Wed, 12 Mar 2008 23:18:02 +0000
Message-Id: <1205363882.4530.35.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Mar 2008 23:20:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-03-12 at 17:48 -0500, Mike Westerhof wrote:
> I think this has gotten to the point where the arguments is for the
> sake of arguing, and little else.  I'm surprised that it hasn't been
> mentioned that "hg" has the advantage that its name is only two
> characters, a 33% savings in overhead compared to most other scm tools
> we've discussed.

Agreed, some of the replies are just getting silly now :/.

> So, who makes this decision, and what's the timeframe?

Good question. We have a core team and I guess the first step would be
to put it to a vote there and see where we stand? I'm open to other
ideas and possibly to representations from non core team developers with
a case for a vote too. I would like to get this resolved quickly if we
can though.

Timeframe wise, I liked Holger's end of the month deadline for actually
doing things.

> Oh - btw, lightweight branching implies working, reliable tools to
> identify diffs and merge them, that's the part that really needs to be
> considered rather than how easy it is to just create a branch.

Agreed, although Holger has already compared git's merging capabilities
to monotone...

Cheers,

Richard



