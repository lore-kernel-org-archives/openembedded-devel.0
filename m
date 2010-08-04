Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OgjEv-0003GD-Fi
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 21:03:12 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OgjEo-0006OE-U3 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 12:02:50 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 4 Aug 2010 12:02:50 -0700
Received: from [172.30.80.92] ([172.30.80.92]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 4 Aug 2010 13:02:49 -0600
Message-ID: <4C59B955.1070009@mentor.com>
Date: Wed, 04 Aug 2010 12:02:45 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>	<20100804001959.GF17391@denix.org>
	<i3bavs$8c4$2@dough.gmane.org>
	<AANLkTikjZtqw5yCUzeXGZdhqyEg-qwTz-q3aRSd2zK89@mail.gmail.com>
In-Reply-To: <AANLkTikjZtqw5yCUzeXGZdhqyEg-qwTz-q3aRSd2zK89@mail.gmail.com>
X-OriginalArrivalTime: 04 Aug 2010 19:02:49.0232 (UTC)
	FILETIME=[A1B0B900:01CB3407]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in	COMPATIBLE_MACHINES
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
X-List-Received-Date: Wed, 04 Aug 2010 19:03:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/8/4 Koen Kooi <k.kooi@student.utwente.nl>
> 
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 04-08-10 02:19, Denys Dmytriyenko wrote:
>>> On Tue, Aug 03, 2010 at 04:47:20PM -0500, Chase Maupin wrote:
>>>> * Add support for using SOC_FAMILY in the COMPATIBLE_MACHINES
>>>>   setting for a recipe.
>>>> * This will allow recipes to work for entire families of
>>>>   devices without having to maintain/update the compatible
>>>>   devices as new devices are added into a family
>>>>
>>>> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>>> Acked-by: Denys Dmytriyenko <denys@ti.com>
>> Acked-by: Koen Kooi <k-kooi@ti.com>
>>
>> I have no problems with the patch as such, but would appreciate a patch for
> the documentation that describes this variable.

In fact, I thought there was vague agreement here from the last time we 
added or changed variable behavior.  Patch the docs at the same time.

-- 
Tom Rini
Mentor Graphics Corporation


