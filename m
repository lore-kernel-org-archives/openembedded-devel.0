Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1QytSW-0003nD-RG
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 00:40:37 +0200
Received: (qmail 17985 invoked by uid 1003); 31 Aug 2011 22:35:28 -0000
Received: from unknown (HELO ?192.168.1.148?) (philip@opensdr.com@157.22.28.13)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	31 Aug 2011 22:35:28 -0000
Message-ID: <4E5EB734.7070802@balister.org>
Date: Wed, 31 Aug 2011 15:35:32 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.20) Gecko/20110817 Fedora/3.1.12-1.fc14 Thunderbird/3.1.12
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>	<j3kn1n$tqr$1@dough.gmane.org>	<1314785183.3769.22.camel@mattotaupa>	<j3l22l$5ti$1@dough.gmane.org>	<20110831115548.GB3273@chargestorm.se>	<j3l8ni$kr3$1@dough.gmane.org>	<CAP9ODKrs1WvLOpHNKsJu0Uf7_8zFQ_GPrPz=+ttdy5tces2gjw@mail.gmail.com>	<j3lad2$v75$2@dough.gmane.org>	<CAP9ODKrOqJ12xba98J=2PAdk7p+pK=gGO0e01wuy_xTMZjsRcg@mail.gmail.com>	<j3ld1i$l0g$1@dough.gmane.org>
	<CAP9ODKpupMXbfao42zScW4aJB2X0FHwEzBBDyMH_mdCyqYAJaw@mail.gmail.com>
In-Reply-To: <CAP9ODKpupMXbfao42zScW4aJB2X0FHwEzBBDyMH_mdCyqYAJaw@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Wed, 31 Aug 2011 22:40:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/31/2011 06:43 AM, Otavio Salvador wrote:
> On Wed, Aug 31, 2011 at 10:30, Koen Kooi<koen@dominion.thruhere.net>  wrote:
>>> Besides, this is also on the policy
>>
>> The OE classic policy maybe, not on the meta-oe policy[1].
>
> ETOOMANYPOLICIES
>
>>> so or you change the policy or you follow it. Otherwise makes no sense to
>>> have a policy if the person who merge the patches do not follow it.
>>
>> - From http://wiki.openembedded.org/index.php/Category:Policy I read:
>>
>> http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines
>> http://wiki.openembedded.org/index.php/Commit_Policy
>> http://wiki.openembedded.org/index.php/Commit_log_example
>> http://wiki.openembedded.org/index.php/Styleguide
>> http://wiki.openembedded.org/index.php/Versioning_Policy
>>
>> And none of those say PR = r0 is wanted behaviour. OTOH it doesn't say it's
>> unwanted either.
>
> So until it is explicit we might keep PR = r0 as it seems most people
> prefer this way.

As long as we are all chiming in, I would like to see all of us decide 
once and for all what to do.

I also prefer the explicitly setting PR = "r0". Can we work out the 
troublesome cases and see if we can get them fixed? Also, what is the 
oe-core view on this?

Let's work out what the technical answer is and go from there.

Philip


