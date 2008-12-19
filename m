Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LDY8x-0003xQ-8v
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Dec 2008 06:43:23 +0100
Received: from [172.16.23.192] (helo=buddha.tw.openmoko.com ident=Debian-exim)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.org>)
	id 1LDY4H-0002Rh-FD for openembedded-devel@lists.openembedded.org;
	Fri, 19 Dec 2008 13:38:43 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LDY4h-00084P-1F
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Dec 2008 13:38:59 +0800
Date: Fri, 19 Dec 2008 13:38:59 +0800
From: John Lee <john_lee@openmoko.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081219053858.GQ2135@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20081218071901.GB2135@buddha.tw.openmoko.com>
	<20081218150517.GI2135@buddha.tw.openmoko.com>
	<gidpuk$29d$1@ger.gmane.org>
	<1229619255.9166.66.camel@mill.internal.reciva.com>
	<gie3e0$6th$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gie3e0$6th$1@ger.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 172.16.23.192
X-SA-Exim-Mail-From: john_lee@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: Re: openmoko-merges
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
X-List-Received-Date: Fri, 19 Dec 2008 05:43:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 18, 2008 at 07:05:51PM +0100, Koen Kooi wrote:
> On 18-12-08 17:54, Phil Blundell wrote:
>> On Thu, 2008-12-18 at 16:24 +0100, Koen Kooi wrote:
>>> On 18-12-08 16:05, John Lee wrote:
>>>> Okay, here is what I will do:
>>>>
>>>> 1) commit zero controversial part into oe.dev first.
>>> You don't know if it's controversial or not without it being reviewed.
>>> So no, don't commit stuff.
>>
>> Is there now a policy of requiring review and pre-approval for all
>> checkins to the tree?  If so, when was this instigated?  I haven't
>> noticed any discussion of that and I would not be in favour of any such
>> change.
>
> No policy for checkins per se, but for merging commits for large  
> branches. In this case, a review was requested and the response was to  
> *not* commit anything.
> Asking for a review and then saying "I'll be the judge of things" is a  
> bit backwards.
> The coreteam will make a statement about merging branches soonish.
>


Something in the om.dev are quite normal just like other commits in
oe.dev tree, such as changing sane-srcrev, adding checksum, recipes,
fixes, etc.  I doubt these need to be reviewed along with the whole
branch. (well, I realize it's me who put them there in the first
place... :p )

I'll keep working on the fastboot branch (need the help of original
author on this one.  since this will become general changes, it's not
going to be easy), and reorganize the om-merge branch a bit.  Is this
the first time of such a big merge ?  I think Graeme and I both did
some merge back before, but this one seems to be bigger...


- John


