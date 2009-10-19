Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MzpTA-0002XU-HK
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Oct 2009 12:28:07 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 9691316DFDC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2009 12:27:07 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 56BD82A427D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2009 12:27:07 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 19 Oct 2009 12:28:58 +0200
Message-ID: <4ADC3EE2.2000309@dresearch.de>
Date: Mon, 19 Oct 2009 12:26:42 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AD59AF2.50003@dresearch.de>
	<4AD8531B.6070208@dresearch.de>	<4AD87CF8.8040706@dresearch.de>	<1255704318.28050.19.camel@mill.internal.reciva.com>	<4AD8888E.2080108@dresearch.de>	<19c1b8a90910161354h7540f865m6d04f29902d3dcfb@mail.gmail.com>	<d1b08f940910161407m643e3f61t2161ed66b719d734@mail.gmail.com>	<4ADC274A.7080406@dresearch.de>
	<d1b08f940910190304j1dd22178g2b3b29f313324424@mail.gmail.com>
In-Reply-To: <d1b08f940910190304j1dd22178g2b3b29f313324424@mail.gmail.com>
X-OriginalArrivalTime: 19 Oct 2009 10:28:58.0375 (UTC)
	FILETIME=[F7AF8970:01CA50A6]
X-SA-Exim-Connect-IP: 87.193.137.78
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: glibc_2.9 compile failed for armv5te
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
X-List-Received-Date: Mon, 19 Oct 2009 10:28:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Andrea Adami wrote:
>> Did you build on a multiprocessor system? It seems that the problem
>> just occurs there. I've a single cpu system where the build runs
>> without problems too.
> It's a SMP kernel (Core 2 Duo)
> 
> BB_NUMBER_THREADS = "2"
> PARALLEL_MAKE = "-j 3"

My machine with the problems:

  Model: 16.2.3 "AMD Phenom(tm) 9150e Quad-Core Processor"

My machine without the problem:

  Model: 6.9.5 "Intel(R) Pentium(R) M processor 1500MHz"




