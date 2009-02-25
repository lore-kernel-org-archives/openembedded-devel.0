Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LcQuv-00075j-5Y
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 22:03:45 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LcQrl-0000t7-Mo
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 21:00:29 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 21:00:29 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 21:00:29 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 25 Feb 2009 22:00:17 +0100
Message-ID: <go4bh1$kbu$1@ger.gmane.org>
References: <go498c$bqq$1@ger.gmane.org> <go4a60$eh8$1@ger.gmane.org>
	<49A5AEB8.7080909@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090219 Shredder/3.0b3pre
In-Reply-To: <49A5AEB8.7080909@dls.net>
Sender: news <news@ger.gmane.org>
Subject: Merge windows, was: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Wed, 25 Feb 2009 21:03:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-02-09 21:48, Mike (mwester) wrote:

> I'd like to propose that we adopt a monthly "Big Change Window" (insert
> your favorite term instead, if you wish).  Many organizations do this to
> manage changes to shared branches.  The idea is that non-critical, but
> potentially disruptive, changes are all merged to the dev branch during
> standard time-periods (e.g. the first week of each calendar month).

I like the idea, but I'd like to change it slightly:

All disruptive changes that have been tested and review get merged 
during this window.

I can see it ending up as "commit random shit window", which we do not want.

What are your thought on keeping a document that lists the (planned) 
merge time of disruptive branches together with a short description of 
their aim and impact?

Related to that: a NEWS file would be neat as well, but that's only 
needed when we start doing releases based on the stable branch

regards,

Koen



