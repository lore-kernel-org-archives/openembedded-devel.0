Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZ3nA-0003dT-0R
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 13:41:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BCdIZb017664
	for <openembedded-devel@openembedded.org>; Tue, 11 Mar 2008 12:39:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17597-02 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 12:39:14 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BCdDS2017649
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 11 Mar 2008 12:39:13 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080311143030.68d6341b@widy.localdomain>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org>
	<1205233201.4521.30.camel@dax.rpnet.com>
	<20080311143030.68d6341b@widy.localdomain>
Date: Tue, 11 Mar 2008 12:39:13 +0000
Message-Id: <1205239153.4521.53.camel@dax.rpnet.com>
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
X-List-Received-Date: Tue, 11 Mar 2008 12:41:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-03-11 at 14:30 +0200, Paul Sokolovsky wrote:
> Yeah, I'd say, *every* git user hit your problem before - that
> git is inconsistent, poorly implemented set of hacks. And if they grow
> to love it, why that can't happen to yourself, right?

You will never have seen me argue git has a nice UI. I've said quite the
opposite on many occasions. I have said its powerful but thats
different.

> > There is also an advantage if someone doesn't have to know yet another
> > SCM to check out OE. I don't have hg installed, I do have git and if
> > we conducted a poll of other OE devs/users I think we'd see a
> > pattern. 
> 
> I probably dumb, but that pattern would be CVS? SVN? no? Nevermind, of
> course.

I'm assuming we're considering distributed scms but you know this ;-)

Cheers,

Richard




