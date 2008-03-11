Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZ2FC-00082o-Uk
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 12:02:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BB0Apg010357
	for <openembedded-devel@openembedded.org>; Tue, 11 Mar 2008 11:00:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10070-04 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 11:00:06 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BB011s010338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 11 Mar 2008 11:00:01 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <fr5ntp$n0v$1@ger.gmane.org>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org>
Date: Tue, 11 Mar 2008 11:00:01 +0000
Message-Id: <1205233201.4521.30.camel@dax.rpnet.com>
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
X-List-Received-Date: Tue, 11 Mar 2008 11:02:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, 2008-03-11 at 11:46 +0100, Koen Kooi wrote:
> Marcin Juszkiewicz schreef:
> | When I have to choose between Mercurial (hg) and GIT I prefer to choose
> | GIT. It is because this one is more known to me and I know that it has
> | large users base. I also knew developers with lot of git experience so it
> | is easier to seek for help.
> 
> CVS also has a large user base and lots of OE developers have lots of
> experience with it.
> 
> See why those are bad arguments? Since Holger wants to switch for
> *technical* reasons we shouldn't allow such "OMG GIT IS POPULAR LOL"
> arguments. And I bet there will be people saying "OE always to be
> special" if we (again) stay clear from git and choose hg.

Whilst I agree we should give a lot of weight to technical arguments, a
large active userbase is a good thing for an SCM. It means there are
more howto guides out there, more people who've probably hit your
problem before, more people you can go and ask for advice when something
breaks etc.

There is also an advantage if someone doesn't have to know yet another
SCM to check out OE. I don't have hg installed, I do have git and if we
conducted a poll of other OE devs/users I think we'd see a pattern. So
it is valid to consider it.

Cheers,

Richard



