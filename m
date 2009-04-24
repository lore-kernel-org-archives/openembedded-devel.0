Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LxGeu-00080R-Pk
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 10:21:21 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KIL00LJ4IZN3VZ7@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	24 Apr 2009 03:16:36 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id F0EB36B83A8; Fri,
	24 Apr 2009 04:16:34 -0400 (EDT)
Date: Fri, 24 Apr 2009 04:16:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090424081634.GE28636@denix.org>
References: <1240558083-13432-1-git-send-email-k.kooi@student.utwente.nl>
	<20090424073122.GA28636@denix.org>
	<2DE2BF31-0CEB-4FC0-9180-2AF38BDD8861@student.utwente.nl>
MIME-version: 1.0
In-reply-to: <2DE2BF31-0CEB-4FC0-9180-2AF38BDD8861@student.utwente.nl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH] udev 124: add cache invalidation logic on	kernel change or its bootargs/cmdline/atags
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
X-List-Received-Date: Fri, 24 Apr 2009 08:21:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 24, 2009 at 09:47:17AM +0200, Koen Kooi wrote:
>
> Op 24 apr 2009, om 09:31 heeft Denys Dmytriyenko het volgende geschreven:
>
>> On Fri, Apr 24, 2009 at 09:28:03AM +0200, Koen Kooi wrote:
>>> From: Denys Dmytriyenko <denis@denix.org>
>>>
>>> also add /etc/default/udev with the option to disable device caching
>>>
>>> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>>> Acked-by: Tom Rini <trini@embeddedalley.com>
>>> Acked-by: Koen Kooi <koen@openembedded.org>
>>> Signed-off-by: Koen Kooi <koen@openembedded.org>
>>
>> Can/should I ack my own patch? :)
>
> I was wondering about the same, since 3 stable maintainers already approved 
> the patch going into .dev. Do you want to push this into stable?

Sure, I can push it.

BTW, I just sent to the list another udev patch to be considered for stable 
(fix .so link for SDK) - if approved, I'd like to push that patch before this 
one, in the same order as in .dev...

-- 
Denys


