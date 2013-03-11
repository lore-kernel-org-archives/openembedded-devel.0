Received: from p3plsmtpa06-03.prod.phx3.secureserver.net ([173.201.192.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pab@pabigot.com>) id 1UF2Ex-0003Oi-B1
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Mar 2013 13:54:07 +0100
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa06-03.prod.phx3.secureserver.net with 
	id ACav1l00E1mTNtu01Caw0r; Mon, 11 Mar 2013 05:34:56 -0700
Message-ID: <513DCF6F.6070405@pabigot.com>
Date: Mon, 11 Mar 2013 07:34:55 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKp1bpin38S3QHaR1s47B9gSxmoMUckWY=NpS_FtB0rVYg@mail.gmail.com>
	<5138A92D.5030809@balister.org> <1820544.NMbf1lmvlI@helios>
In-Reply-To: <1820544.NMbf1lmvlI@helios>
Subject: Re: [meta-kde][PATCH 3/3] README: update contributor list
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
X-List-Received-Date: Mon, 11 Mar 2013 12:54:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2013 09:41 AM, Paul Eggleton wrote:
> On Thursday 07 March 2013 09:50:21 Philip Balister wrote:
>> On 03/07/2013 09:41 AM, Otavio Salvador wrote:
>>> On Thu, Mar 7, 2013 at 11:35 AM, Paul Eggleton
>>>
>>> <paul.eggleton@linux.intel.com> wrote:
>>>> On Thursday 07 March 2013 15:03:17 Koen Kooi wrote:
>>>>> Op 7 mrt. 2013, om 14:04 heeft Martin Jansa <martin.jansa@gmail.com> het
>>>>>
>>>>> volgende geschreven:
>>>>>> It would be nice to know yocto-1.4 release name in advance and name it
>>>>>> the same as branch in oe-core/meta-oe will be (denzil, danny, ...), but
>>>>>> I guess it can be renamed later.
>>>>> For angstrom I'm going to use 'yocto-1.4' in the branch name, I have
>>>>> trouble remembering which names maps to which release. And the Yocto
>>>>> compliance program talks about 1.3, .14 etc, not about codenames.
>>>> Wouldn't it be worth us trying to standardise rather than all doing our
>>>> own
>>>> thing and users having to figure out what matches up between different
>>>> layers? If others feel the same as you, then maybe we should all be
>>>> using that schema.>
>>> Or we use a codename or we don't.
>>>
>>> For me, codenames work fine but for users it is sometimes confusing as
>>> the website and marketing people talk about Yocto 1.3 or 1.4 while the
>>> involved people talk about codenames. So I find myself explaining it
>>> over and over again.
>> Add me to the list of people that find codenames confusing. I can't
>> reliably list releases in order by name.
> FWIW, in the layer index web app against each branch I have a field for a short
> description (e.g. denzil could have something like "old stable" or whatever is
> helpful to explain it to people) and a sort order so that they can be sorted
> correctly where listed.
>
> That doesn't take away the need to resolve this issue of branch names across
> layers, but it may help users to understand what these codenames mean if they
> continue to be used, at least when they see them in the layer index at least.
A comment on that from up here in the peanut gallery: I don't personally 
find codenames valuable, but if they're used it would be nice if they 
were selected using a policy that allowed at least their relative order 
to be determined by inspection.  That danny=1.3 sorts lexicographically 
before denzil=1.2 is confusing.

Peter


