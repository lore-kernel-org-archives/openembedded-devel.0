Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OUiVc-00060t-S6
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 17:50:41 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OUiQz-0004Py-Rv from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 08:45:45 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 2 Jul 2010 08:45:45 -0700
Received: from [172.30.80.212] ([172.30.80.212]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 2 Jul 2010 09:45:44 -0600
Message-ID: <4C2E09A3.8000507@mentor.com>
Date: Fri, 02 Jul 2010 08:45:39 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk>	<4C2D153E.1040608@mentor.com>
	<20100702062204.GA9760@jama>
In-Reply-To: <20100702062204.GA9760@jama>
X-OriginalArrivalTime: 02 Jul 2010 15:45:44.0564 (UTC)
	FILETIME=[A201D340:01CB19FD]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: USE flags mumbling
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
X-List-Received-Date: Fri, 02 Jul 2010 15:50:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Martin Jansa wrote:
> On Thu, Jul 01, 2010 at 03:22:54PM -0700, Tom Rini wrote:
>> I wonder, and I have to admit to having no real gentoo background
>> here, how do they solve this problem?  Did they invent their own
>> package format and add another field that consists of use flags?
>> That'd make some stuff a lot easier, but making deb/rpm get that
>> mapping somehow seems hard at first.
> 
> They store all information about built packages in
> /var/db/pkg/category/name/*

OK.  I thought they had finally added binary packages as an option a 
while back but I see that's really just a few really big things now.

-- 
Tom Rini
Mentor Graphics Corporation


