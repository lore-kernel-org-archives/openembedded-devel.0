Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MftoZ-0004Fm-BZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 13:03:48 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 122C916DFDD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 12:45:58 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id C68D82A419E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 12:45:57 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 25 Aug 2009 12:45:50 +0200
Message-ID: <4A93C0BB.50206@dresearch.de>
Date: Tue, 25 Aug 2009 12:45:15 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8E3AA6.10609@dresearch.de>	<200908211344.53306.holger+oe@freyther.de>	<4A92AB1F.3060404@dresearch.de>
	<200908250403.12093.holger+oe@freyther.de>
In-Reply-To: <200908250403.12093.holger+oe@freyther.de>
X-OriginalArrivalTime: 25 Aug 2009 10:45:50.0406 (UTC)
	FILETIME=[362EF660:01CA2571]
Subject: Re: Variable reference (was: Documentation update about	machine conf files)
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
X-List-Received-Date: Tue, 25 Aug 2009 11:03:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
>> It's a good starting point. But it has one drawback: It allows a short one
>> liner docu only. Often it would be great to have some more info, e.g. a
>> list of supported image file system types for IMAGE_FSTYPES.
> 
> Why do you think so?

When i had a look into conf/documentation.conf it occurred to me that the documentation field may only be a simple string. It seems not to be possible to use e.g. tables or lists there. Sorry, if i'm wrong here.

Steffen




