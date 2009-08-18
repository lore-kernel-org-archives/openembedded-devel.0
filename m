Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MdKYC-0004pf-I1
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 11:00:18 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id EADF616E235
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 10:43:11 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id AA1BD2A4274
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 10:43:11 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 18 Aug 2009 10:42:49 +0200
Message-ID: <4A8A697D.9080105@dresearch.de>
Date: Tue, 18 Aug 2009 10:42:37 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A89A884.6030904@techworks.ie>
In-Reply-To: <4A89A884.6030904@techworks.ie>
X-OriginalArrivalTime: 18 Aug 2009 08:42:49.0109 (UTC)
	FILETIME=[DDB22C50:01CA1FDF]
Subject: Re: Documentation update about machine conf files
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
X-List-Received-Date: Tue, 18 Aug 2009 09:00:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Christian Gagneraud schrieb:
> I'm willing to update the manual, especially the section "Adding a new
> Machine". I would like to update the list or required variables (if it
> needs to) and add a list of optional but useful variables (see my
> previous post as well).
> But i'm wondering if the the file conf/documentation.conf is a better
> place and/or a new conf/machine/machine.conf.sample could be written in
> the same way as the conf/local.conf.sample one.
> ...

I would be really happy about an index of *all* variables usable in the recipes together with a desciption or a reference to it. I would prefer such an index in the wiki, but manual or documentation.conf would be fine too.

Steffen




