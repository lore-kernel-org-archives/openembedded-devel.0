Received: from [150.254.30.30] (helo=libra.cs.put.poznan.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1N63sT-0000Zi-N0 for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 16:04:00 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 2369D88
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 15:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id H0d3Ra0tv36s
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 16:02:43 +0100 (CET)
Received: from [150.254.31.31] (idss-pw.cs.put.poznan.pl [150.254.31.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id E05DE85
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 16:02:43 +0100 (CET)
Message-ID: <4AF2E98E.8070309@cs.put.poznan.pl>
Date: Thu, 05 Nov 2009 16:04:46 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
Organization: Poznan University of Technology
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1257427464-316-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
	<200911051440.42702.holger+oe@freyther.de>
In-Reply-To: <200911051440.42702.holger+oe@freyther.de>
X-Enigmail-Version: 0.96.0
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SpamTest-Info: Not protected
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] boost-1.33.1: Corrected GNU_HASH error.
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
X-List-Received-Date: Thu, 05 Nov 2009 15:04:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Thursday 05 November 2009 14:24:24 you wrote:
>> Signed-off-by: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
> 
> Looks good. but if you change a .inc file you need to bump the PR of
> every user.

1.33 is the only user.

> In this case it makes sense to convert it to the file pr scheme.
> 

What is that? I see neither FILE_PR nor INC_PR -- which was mentioned on
IRC -- in OE manual.

Przemek



