Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MeNdH-00069j-35
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Aug 2009 08:29:51 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 7617F16DFDD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2009 08:12:29 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 334002A4245
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2009 08:12:29 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 21 Aug 2009 08:12:12 +0200
Message-ID: <4A8E3AA6.10609@dresearch.de>
Date: Fri, 21 Aug 2009 08:11:50 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 21 Aug 2009 06:12:12.0875 (UTC)
	FILETIME=[52EB89B0:01CA2226]
Subject: Variable reference (was: Documentation update about machine conf files)
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
X-List-Received-Date: Fri, 21 Aug 2009 06:29:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[start new thread because of the more common subject]

>> I would be really happy about an index of all variables usable in the
>> recipes together with a desciption or a reference to it. I would
>> prefer such an index in the wiki, but manual or documentation.conf
>> would be fine too.
> 
> Something like that you mean?
> 
> http://pokylinux.org/doc/poky-handbook.html#ref-variables-glossary

Yes.

Would be nice if it is not a glossary only but contains additional info (e.g. exact usage, restrictions, dependencies, examples). This may be realized by references to an own (wiki) page for each variable which needs more than a one liner.

What's the community opinion? Should we start such an index in the wiki?

Steffen




