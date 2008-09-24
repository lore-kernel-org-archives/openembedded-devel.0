Received: from [208.84.147.47] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hacker@klever.net>) id 1KiZk4-0007Bz-8E
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Sep 2008 21:09:40 +0200
Received: from pd953acdd.dip0.t-ipconnect.de ([217.83.172.221] ident=hacker)
	by rhodos.klever.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <hacker@klever.net>) id 1KiZgX-0004cL-Pc
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Sep 2008 21:06:02 +0200
Message-ID: <48DA8F98.9060404@klever.net>
Date: Wed, 24 Sep 2008 21:06:00 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <gb0738$dcq$1@ger.gmane.org>	<1222248100.15974.4.camel@ip6-localhost>	<48DA1251.30305@klever.net>
	<200809241738.04573.zecke@selfish.org>
In-Reply-To: <200809241738.04573.zecke@selfish.org>
Subject: Re: Math is hard, but please pay attention to PV
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
X-List-Received-Date: Wed, 24 Sep 2008 19:09:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> On Wednesday 24 September 2008 12:11:29 Michael Krelin wrote:
> 
>> What about using something like the output of `git describe --tags $(git
>> rev-parse HEAD)` as a sortable key?
> 
> this requires that there is a tag in the history, it is not always true. :)

That's true. In fact, I'm not well acquainted with the problem (like I 
thought it has to do with the sources fetched, but why would then 
mickeyl regret using git for *own* projects?). My point is - perhaps 
sometimes it's applicable and  then it could be used. A nice addition to 
git-describe would be counting from initial commit or the oldest merge 
if there's more than one ;-)

Love,
H


