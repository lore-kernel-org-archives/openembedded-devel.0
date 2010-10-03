Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P2DsE-0006Pi-C3
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 04:00:23 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P2Drw-00011E-VS from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 19:00:04 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sat, 2 Oct 2010 19:00:03 -0700
Received: from [172.30.80.12] ([172.30.80.12]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 2 Oct 2010 20:00:02 -0600
Message-ID: <4CA7E399.8030700@mentor.com>
Date: Sat, 02 Oct 2010 18:59:53 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285969779-7932-1-git-send-email-tom_rini@mentor.com>	<1285969779-7932-2-git-send-email-tom_rini@mentor.com>	<4CA65919.2030203@mentor.com>
	<4CA6CCEC.9060805@freyther.de>
In-Reply-To: <4CA6CCEC.9060805@freyther.de>
X-OriginalArrivalTime: 03 Oct 2010 02:00:02.0462 (UTC)
	FILETIME=[B107BBE0:01CB629E]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] insane.bbclass: Skip '.pc' in qa_configure
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
X-List-Received-Date: Sun, 03 Oct 2010 02:00:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Freyther wrote:
> On 10/02/2010 05:56 AM, Tom Rini wrote:
>> Tom Rini wrote:
>>
>> --compose didn't stick, grr.
>>
>> These files won't have anything useful in them and are often unreadable so
>> lets just skip them.
> 
> s,files,files in the .pc directory,?
> 
> besides that looks like a sane change.

I'll make the desc read better, thanks :)

-- 
Tom Rini
Mentor Graphics Corporation


