Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MdjAo-0005NJ-WE
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 13:18:02 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 4E40616E23F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2009 13:00:37 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 0C66D2A424E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2009 13:00:36 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 19 Aug 2009 13:00:16 +0200
Message-ID: <4A8BDB2B.40901@dresearch.de>
Date: Wed, 19 Aug 2009 12:59:55 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8B9F24.80804@dresearch.de> <4A8BA586.9010303@xora.org.uk>
In-Reply-To: <4A8BA586.9010303@xora.org.uk>
X-OriginalArrivalTime: 19 Aug 2009 11:00:17.0015 (UTC)
	FILETIME=[3C3E8070:01CA20BC]
Subject: Re: svn HEAD revision in SRV_URI?
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
X-List-Received-Date: Wed, 19 Aug 2009 11:18:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>> Is it possible to use always the HEAD revision of an svn repo as SRC_URI?
>> ...
>   
> SRCREV = "${AUTOREV}"

Thanx,
Steffen

PS: Is this mentioned somewhere in the manual or wiki? I couldn't find it.




