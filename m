Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Ok0oT-0003eN-Rg
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 22:25:17 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Ok0o2-0007VH-I2 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 13:24:46 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 13 Aug 2010 13:24:46 -0700
Received: from [172.30.80.96] ([172.30.80.96]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 13 Aug 2010 14:24:45 -0600
Message-ID: <4C65AA04.3030106@mentor.com>
Date: Fri, 13 Aug 2010 13:24:36 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1281677993-19478-1-git-send-email-noor_ahsan@mentor.com>	<1281686825.3858.0.camel@mattotaupa>	<989A078976CDAD4CB2DC976EEF70E2A504270EAC@eu2-mail.mgc.mentorg.com>	<1281691118.3858.22.camel@mattotaupa>
	<AANLkTi=hM-AbnVXfzy5XLnPi5_0nSimVBVFTob6qEa_b@mail.gmail.com>
In-Reply-To: <AANLkTi=hM-AbnVXfzy5XLnPi5_0nSimVBVFTob6qEa_b@mail.gmail.com>
X-OriginalArrivalTime: 13 Aug 2010 20:24:45.0417 (UTC)
	FILETIME=[91AEC590:01CB3B25]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH]Removing Legacy staging from genboot native recipe
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
X-List-Received-Date: Fri, 13 Aug 2010 20:25:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Fri, Aug 13, 2010 at 2:18 AM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
>> Am Freitag, den 13.08.2010, 11:01 +0200 schrieb Ahsan, Noor:
>>> Actually both works with me with "g" and without "g".
>> Sorry, I see.
>>
>> It looks like this is your first patch. So just remember to always sign
>> off with the same address, so the statistics get right.
> 
> also get rid of that FILESDIR

FILESDIR got put onto 
http://wiki.openembedded.org/index.php/OpenEmbeddedJanitors just the 
other day, with a quick one line explanation of what this means.  If 
someone else would like to expand on that a little more, that'd be 
great!  Thanks.

-- 
Tom Rini
Mentor Graphics Corporation


