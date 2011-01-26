Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pi6n1-0001dU-P2
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 15:56:07 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pi6mF-0002Vd-UF from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 06:55:19 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 26 Jan 2011 06:55:19 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 26 Jan 2011 07:55:18 -0700
Message-ID: <4D4035D2.9090203@mentor.com>
Date: Wed, 26 Jan 2011 07:55:14 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20110126102308.GA29416@excalibur.local>
	<4D3FFB03.9010206@xora.org.uk>
In-Reply-To: <4D3FFB03.9010206@xora.org.uk>
X-OriginalArrivalTime: 26 Jan 2011 14:55:18.0910 (UTC)
	FILETIME=[0C7FA9E0:01CBBD69]
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
X-List-Received-Date: Wed, 26 Jan 2011 14:56:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/26/2011 03:44 AM, Graeme Gregory wrote:
> On 26/01/2011 10:23, Stefan Schmidt wrote:
>> Hello.
>>
>> During last OEDEM we set out a timeline for quarterly releases. The first one
>> hit on time in december 2010 (Thanks Khem).
>>
>> The next one would be scheduled for 2011-03. As our plans towards oe-core are
>> getting into shape I wonder if and how these both are going to conflict.
>>
>> Will we go ahead and make the 2011-03 release, maybe the last one before moving
>> over to oe-core? Personally I don't think these two block each other. Syncing
>> would be needed, but people will keep working on the OE repo for a bit longer
>> anyway I would think.
>>
>> If we are going to scratch the release what would be the next target for it?
>> Yocto 1.0 is planned for April 2011. Somehow I doubt we will have oe-core ready
>> for this in time, including yocto movs to it and we base the rest of OE on top
>> of it. Am I wrong here and that is the actual plan?
>>
>>
> My opinion is 2010-03 should be the last release on the old source tree.
> Releases after this should be on the new oe-core layer system. I don't
> think we should scrap the release as its going to take some time to kick
> oe-core into shape and finish the poky merge. Then there is work on
> meta-openembedded and meta-distro to do on top of that.

I think this depends a little on who is going to run the release again. 
  We probably won't have a perfect release, stop committing, switch.  If 
we're looking for volunteers again to run the next release, assuming 
folks will be busy with the migration work too, I'd throw my hat in the 
ring (and defer to Khem if he wants to do it again, along with all of 
the fun we'll have in oe-core :))

-- 
Tom Rini
Mentor Graphics Corporation


