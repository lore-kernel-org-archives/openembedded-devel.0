Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PE8c9-0000kD-79
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 23:49:02 +0100
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LBD002TRTZSAHJ2@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	04 Nov 2010 17:47:58 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1E60714AF6A; Thu,
	04 Nov 2010 18:47:52 -0400 (EDT)
Date: Thu, 04 Nov 2010 18:47:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101104224752.GH28852@denix.org>
References: <AANLkTikEvXr_vz+_uy871SM1B5SS=e6kb62sPyt-4GaD@mail.gmail.com>
	<20101104220649.GE28852@denix.org> <4CD3349D.6060904@eukrea.com>
MIME-version: 1.0
In-reply-to: <4CD3349D.6060904@eukrea.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded Release 2010.12 --- needs your help!
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
X-List-Received-Date: Thu, 04 Nov 2010 22:49:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Nov 04, 2010 at 11:33:01PM +0100, Eric B?nard wrote:
> Hi,
>
> Le 04/11/2010 23:06, Denys Dmytriyenko a ?crit :
>> On Thu, Nov 04, 2010 at 09:04:43PM +0100, Leon Woestenberg wrote:
>>> Hello all,
>>>
>>> at OEDEM we discussed the need for OpenEmbedded releases.
>>>
>>> - OpenEmbedded releases are planned in certain months, so that we can
>>> plan stabilization efforts in the future.
>>> - Each release is a point release in time.
>>> - A release is a candidate branch point for a stable branch (which can
>>> be maintained by those who use it).
>>> - The next release is planned 2010.12, more specifically December 1st.
>>> That's only four weeks from now.
>>> - The 2010.12 release is hand-picked from a recent testing branch.
>>
>> - OpenEmbedded releases are planned to be time based and happen every 3 
>> month
>> (quarterly), starting with the first one on December 1st.
>>
> - what about a "no major change" freeze period for 2-3 weeks before each 
> release to have a enough time to stabilize a little bit the beast ?

I thought Leon kind of mentioned it in the first bullet point above, but 
probably not very clear. And yes, we definitely need a 2-3 weeks "feature 
freeze" period for stabilization. Thanks for pointing it out.

>>> Now that our testing team has the process in place to gather test
>>> results, please consider to build your
>>> favorite set of distro/machine targets using tinderbox, and report your 
>>> results.
>>>
>>> One requirement is to use bitbake 1.10, as the minimal requirement
>>> will soon be 1.10 for the OpenEmbedded metadata.

-- 
Denys


