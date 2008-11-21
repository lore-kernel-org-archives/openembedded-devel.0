Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1L3Z6G-0001Sa-Ma
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Nov 2008 17:43:20 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id E8F2D16DF7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2008 17:49:37 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 0A7562A4145
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2008 17:40:43 +0100 (CET)
Received: from [10.24.0.58] ([10.24.0.58]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 21 Nov 2008 17:40:44 +0100
Message-ID: <4926E485.6070404@dresearch.de>
Date: Fri, 21 Nov 2008 17:40:37 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.17 (X11/20080922)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4926DC15.5070206@dresearch.de>
In-Reply-To: <4926DC15.5070206@dresearch.de>
X-OriginalArrivalTime: 21 Nov 2008 16:40:44.0664 (UTC)
	FILETIME=[E6201F80:01C94BF7]
Subject: Re: [patch review] uclibc-initial_0.9.30.bb and avr32
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
X-List-Received-Date: Fri, 21 Nov 2008 16:43:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Steffen Sledz wrote:
> please approve or comment following patch of uclibc-initial_0.9.30.bb.

Damn! Forget the patch that i suggested.

It does not really fix the problem. The avr32 ld really does not support the -hash-style option. So i have to look for another solution.  :(



