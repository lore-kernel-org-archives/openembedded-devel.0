Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PGDXY-0008Ht-4P
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 17:28:52 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1PGDWa-0000bL-UP from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 08:27:52 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 10 Nov 2010 08:27:52 -0800
Received: from [172.30.80.211] ([172.30.80.211]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 10 Nov 2010 09:27:52 -0700
Message-ID: <4CDAC802.3050303@mentor.com>
Date: Wed, 10 Nov 2010 09:27:46 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>	<1287157281-31597-1-git-send-email-kergoth@gmail.com>	<i9aai3$tmj$1@dough.gmane.org>	<AANLkTimuTVEWPsZT=hx+fuLLHKtVVrVzud0xq5R_TSEO@mail.gmail.com>	<1289399216.1272.415.camel@rex>
	<AANLkTi=gsOK=1-u5OBRR2iYXmxamr_LTyJk-gtvdUUWp@mail.gmail.com>
In-Reply-To: <AANLkTi=gsOK=1-u5OBRR2iYXmxamr_LTyJk-gtvdUUWp@mail.gmail.com>
X-OriginalArrivalTime: 10 Nov 2010 16:27:52.0244 (UTC)
	FILETIME=[38BC6F40:01CB80F4]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH (v2)] Reverse the order of OVERRIDES
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
X-List-Received-Date: Wed, 10 Nov 2010 16:28:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Otavio Salvador wrote:
> On Wed, Nov 10, 2010 at 12:26 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> ...
>> This change is pretty serious and potentially alters the handling of any
>> double override. Poky uses them a bit more extensively than OE does. Its
>> effectively an architecture change to OE yet no discussion was had at
>> any TSC meeting :(.
> ...
> 
> I agree with Richard here. It was merged too fast.
> 
> We are suppose to have a release soon and this kind of change
> shouldn't be done so near of it.

To be fair, this was done a few weeks before it was decided that we'd 
even have releases, if I follow the timeline for that decision right.

-- 
Tom Rini
Mentor Graphics Corporation


