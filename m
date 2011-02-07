Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PmX7v-0006n8-Hn
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 20:51:59 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PmX6v-00053C-1N from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 11:50:57 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 7 Feb 2011 11:50:56 -0800
Received: from [172.30.80.130] ([172.30.80.130]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 7 Feb 2011 12:50:55 -0700
Message-ID: <4D504D1D.80206@mentor.com>
Date: Mon, 07 Feb 2011 12:50:53 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20110126102308.GA29416@excalibur.local>	<4D3FFB03.9010206@xora.org.uk>	<4D4035D2.9090203@mentor.com>
	<20110207160841.GB29011@excalibur.local>
	<AANLkTiniBzwLJEqpedrY3Kg-yX==g3XXTxsqZCyef=+q@mail.gmail.com>
In-Reply-To: <AANLkTiniBzwLJEqpedrY3Kg-yX==g3XXTxsqZCyef=+q@mail.gmail.com>
X-OriginalArrivalTime: 07 Feb 2011 19:50:55.0910 (UTC)
	FILETIME=[55881460:01CBC700]
Subject: Re: OE 2011.03 release vs. oe-core migration
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
X-List-Received-Date: Mon, 07 Feb 2011 19:51:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/07/2011 12:36 PM, Khem Raj wrote:
> On Mon, Feb 7, 2011 at 8:08 AM, Stefan Schmidt
> <stefan@datenfreihafen.org>  wrote:
>> Hello.
>>
>> On Wed, 2011-01-26 at 07:55, Tom Rini wrote:
>>> On 01/26/2011 03:44 AM, Graeme Gregory wrote:
>>>> On 26/01/2011 10:23, Stefan Schmidt wrote:
>>>>>
>>>>> During last OEDEM we set out a timeline for quarterly releases. The first one
>>>>> hit on time in december 2010 (Thanks Khem).
>>>>>
>>>>> The next one would be scheduled for 2011-03. As our plans towards oe-core are
>>>>> getting into shape I wonder if and how these both are going to conflict.
>>>>>
>>>>> Will we go ahead and make the 2011-03 release, maybe the last one before moving
>>>>> over to oe-core? Personally I don't think these two block each other. Syncing
>>>>> would be needed, but people will keep working on the OE repo for a bit longer
>>>>> anyway I would think.
>>>>>
>>>>> If we are going to scratch the release what would be the next target for it?
>>>>> Yocto 1.0 is planned for April 2011. Somehow I doubt we will have oe-core ready
>>>>> for this in time, including yocto movs to it and we base the rest of OE on top
>>>>> of it. Am I wrong here and that is the actual plan?
>>>>>
>>>>>
>>>> My opinion is 2010-03 should be the last release on the old source tree.
>>>> Releases after this should be on the new oe-core layer system. I don't
>>>> think we should scrap the release as its going to take some time to kick
>>>> oe-core into shape and finish the poky merge. Then there is work on
>>>> meta-openembedded and meta-distro to do on top of that.
>>>
>>> I think this depends a little on who is going to run the release
>>> again.  We probably won't have a perfect release, stop committing,
>>> switch.  If we're looking for volunteers again to run the next
>>> release, assuming folks will be busy with the migration work too,
>>> I'd throw my hat in the ring (and defer to Khem if he wants to do it
>>> again, along with all of the fun we'll have in oe-core :))
>>
>> I would welcome if we could make the release manager role rotating. So if Tom
>> would be able to pick this up it would be great if Khem can feed him some of his
>> experience with the last release. Be it only theoretical with some hints or
>> practically with helping to review and apply patches towards. Does this sound
>> good to both of you?
>
> by all means. I would do it if no one else is doing.
>
>>
>> I will do some more testing over the next days/weeks and also trying to help
>> with some patches if needed.
>
> We need more people to sign up for testing the release

Specifically run-testing.  I can queue up a pretty good size matrix of 
build tests (and I'm adding Ubuntu 10.04 for a recent host distribution 
to the matrix) but run testing is much more limited.

-- 
Tom Rini
Mentor Graphics Corporation


