Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MfbK6-0003fS-6h
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 17:19:06 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 41BAC16E23B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 17:01:22 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 007192A424C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 17:01:21 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 24 Aug 2009 17:01:12 +0200
Message-ID: <4A92AB1F.3060404@dresearch.de>
Date: Mon, 24 Aug 2009 17:00:47 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8E3AA6.10609@dresearch.de>
	<200908211344.53306.holger+oe@freyther.de>
In-Reply-To: <200908211344.53306.holger+oe@freyther.de>
X-OriginalArrivalTime: 24 Aug 2009 15:01:12.0859 (UTC)
	FILETIME=[B8A9FEB0:01CA24CB]
Subject: Re: Variable reference (was: Documentation update about machine conf files)
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
X-List-Received-Date: Mon, 24 Aug 2009 15:19:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>> Would be nice if it is not a glossary only but contains additional info
>> (e.g. exact usage, restrictions, dependencies, examples). This may be
>> realized by references to an own (wiki) page for each variable which needs
>> more than a one liner.
>>
>> What's the community opinion? Should we start such an index in the wiki?
> 
> Long time ago, I created conf/documentation.conf. For every variable back then 
> we have used VAR[doc] = "Documentation" to describe the semantic of this 
> variable. A utility like bitdoc spit out a HTML page...
> 
> I would like to see this updated.

It's a good starting point. But it has one drawback: It allows a short one liner docu only. Often it would be great to have some more info, e.g. a list of supported image file system types for IMAGE_FSTYPES.

Steffen




