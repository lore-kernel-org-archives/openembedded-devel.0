Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RB8E6-00006F-GE
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Oct 2011 18:52:18 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LSJ00IFUVWHR6M2@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	04 Oct 2011 11:46:05 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id ED95F14AF5D; Tue,
	04 Oct 2011 12:45:52 -0400 (EDT)
Date: Tue, 04 Oct 2011 12:45:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111004164552.GA23650@denix.org>
References: <1317025776-2433-1-git-send-email-eyalr@ti.com>
	<EC51CDB0807A51469E0C9CB8CF72D65F033369C809@dnce02.ent.ti.com>
	<4E8B2D57.6060004@gmail.com>
MIME-version: 1.0
In-reply-to: <4E8B2D57.6060004@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] wpa_supplicant update to use a newer commit
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
X-List-Received-Date: Tue, 04 Oct 2011 16:52:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 04, 2011 at 08:59:19AM -0700, Khem Raj wrote:
> On 10/3/2011 11:47 PM, Reizer, Eyal wrote:
>> Ping on this patch.
>>
>
> I would suggest to rebase this patch against openembedded-core
> and resubmit

Nothing prevents these changes to be submitted to oe-core, but they were 
meant to eventually get into 2011.03-maintenance branch.

-- 
Denys


>>> -----Original Message-----
>>> From: Eyal Reizer [mailto:eyalreizer@googlemail.com]
>>> Sent: Monday, September 26, 2011 11:30 AM
>>> To: openembedded-devel@lists.openembedded.org
>>> Cc: Reizer, Eyal
>>> Subject: [PATCH] wpa_supplicant update to use a newer commit
>>>
>>> Signed-off-by: Eyal Reizer<eyalr@ti.com>
>>> ---
>>>   recipes/wpa-supplicant/wpa-supplicant_git.bb |    2 +-
>>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/recipes/wpa-supplicant/wpa-supplicant_git.bb
>>> b/recipes/wpa-supplicant/wpa-supplicant_git.bb
>>> index 8f6971e..7408808 100644
>>> --- a/recipes/wpa-supplicant/wpa-supplicant_git.bb
>>> +++ b/recipes/wpa-supplicant/wpa-supplicant_git.bb
>>> @@ -1,6 +1,6 @@
>>>   require wpa-supplicant-0.7.inc
>>>
>>> -SRCREV = "b8fb017272ed4794339978c9fbc0e74571a44728"
>>> +SRCREV = "83fa07226debc2f7082b6ccd62dbb1cd47c30472"
>>>   PR = "r0"
>>>   PV = "0.7.3+0.8.0-rc"
>>>   PR_append = "+gitr${SRCPV}"
>>> --
>>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


