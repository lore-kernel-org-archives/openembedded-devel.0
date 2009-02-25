Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LcQjo-0006fV-KC
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 21:52:16 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LcQgf-0000Tx-IP
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 14:49:01 -0600
Message-ID: <49A5AEB8.7080909@dls.net>
Date: Wed, 25 Feb 2009 14:48:56 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <go498c$bqq$1@ger.gmane.org> <go4a60$eh8$1@ger.gmane.org>
In-Reply-To: <go4a60$eh8$1@ger.gmane.org>
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Wed, 25 Feb 2009 20:52:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 25-02-09 21:21, Koen Kooi wrote:
> 
>> I have some other intrusive proposals about shuffling things around in
>> TMP a bit (and out of TMP as well), standardizing on source locations
>> for source_distribute and sourcepkg, etc, but let's start with this easy
>> one.
> 
> What I meant to say is:
> 
> Let's bunch up all the proposals that get approved so we can have a flag
> day in a week or 3 to minimize documentation churn.

Good timing; I was just composing a separate RFC email, but instead I'll
add my thoughts to this thread, since what I will propose is very
similar to the "flag day" idea.

I'd like to propose that we adopt a monthly "Big Change Window" (insert
your favorite term instead, if you wish).  Many organizations do this to
manage changes to shared branches.  The idea is that non-critical, but
potentially disruptive, changes are all merged to the dev branch during
standard time-periods (e.g. the first week of each calendar month).

This would set expectations for all users and even the core developers;
don't sync during these periods if you aren't ready, or perhaps some
folks might make the decision about working on a branch or not based on
the proximity of the Big Change Window.

(BTW, +1 on the renaming of packages to recipes)

-Mike


