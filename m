Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Mvszl-00022U-AK
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Oct 2009 15:25:28 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 9758216DEDF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2009 15:24:36 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 53ECE2A4266
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2009 15:24:36 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 8 Oct 2009 15:26:03 +0200
Message-ID: <4ACDE7EB.3000805@dresearch.de>
Date: Thu, 08 Oct 2009 15:23:55 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20091008125302.GE10797@xora.vm.bytemark.co.uk>
In-Reply-To: <20091008125302.GE10797@xora.vm.bytemark.co.uk>
X-OriginalArrivalTime: 08 Oct 2009 13:26:03.0812 (UTC)
	FILETIME=[E2654E40:01CA481A]
X-SA-Exim-Connect-IP: 87.193.137.78
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert Request for linux -> linux-gnu changes
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
X-List-Received-Date: Thu, 08 Oct 2009 13:25:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> But it is becoming clear that the linux -> linux-gnu change is throwing
> up many issues for arches != linux-gnueabi. Partial fixes have been
> implemented but for every fix another issue seems to pop up.
> 
> I suggest these changes should be reverted, placed in a branch and
> properly merged at a later date after proper review.

+1




