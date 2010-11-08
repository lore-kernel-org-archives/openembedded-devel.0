Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PFSfn-0000s6-6i
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 15:26:16 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1PFSes-0007be-04 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 06:25:18 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 8 Nov 2010 06:25:17 -0800
Received: from [172.30.80.200] ([172.30.80.200]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 8 Nov 2010 07:25:04 -0700
Message-ID: <4CD8083D.5080806@mentor.com>
Date: Mon, 08 Nov 2010 07:25:01 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20101104082759.GG19934@excalibur.local>
	<20101107182029.GP6691@excalibur.local>
In-Reply-To: <20101107182029.GP6691@excalibur.local>
X-OriginalArrivalTime: 08 Nov 2010 14:25:04.0421 (UTC)
	FILETIME=[BC585D50:01CB7F50]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Patchwork cleanup weekend in two days
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
X-List-Received-Date: Mon, 08 Nov 2010 14:26:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Stefan Schmidt wrote:
> Hello.
> 
> On Thu, 2010-11-04 at 09:27, Stefan Schmidt wrote:
>> Its time for some house-keeping again. I know many people are working on
>> patchwork on-going, thanks for that.
>>
>> Looking throught it during OEDEM did still show up way to many entries. Some are
>> still from 2009. Next Saturday and Sunday I would like to reduce our  current
>> count from 273 patches. 100 or less would be a nice goal imho.
> 
> We are no down to a patch count of 186. With the new patches that came in the
> last two days that makes 100 patches that are gone. Most of them had already
> been applied or superseded by other patches and often were just missing a status
> update.
> 
> For the outstanding patches I see three big groups which need our attention:
> 
> 1) Core/class patches: It would be great if some people more familiar with the
>    core internals of OE could have a look at them and discuss outstanding issues
>    or apply them.
> 
> 2) Stable/2009 patches: We still have patches sitting in patchwork for the
>    stable branch. It would be great if they also could get some attention, not
>    only patches for master.

Would it be possible to get a list of patches that the folks (thanks a 
lot for doing it, everyone!) who did the cleanup felt fit into these areas?

-- 
Tom Rini
Mentor Graphics Corporation


