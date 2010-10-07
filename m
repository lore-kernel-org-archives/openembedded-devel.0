Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P403F-0002Oh-Vs
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 01:39:06 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P402p-0005q6-T7 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 16:38:39 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 7 Oct 2010 16:38:39 -0700
Received: from [172.30.80.69] ([172.30.80.69]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 7 Oct 2010 17:38:38 -0600
Message-ID: <4CAE59F0.3010609@mentor.com>
Date: Thu, 07 Oct 2010 16:38:24 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E064324-2FF0-4F2B-BCB7-04AFD285689B@mac.com>
In-Reply-To: <4E064324-2FF0-4F2B-BCB7-04AFD285689B@mac.com>
X-OriginalArrivalTime: 07 Oct 2010 23:38:38.0995 (UTC)
	FILETIME=[C48E2630:01CB6678]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: opkg install gdbserver
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
X-List-Received-Date: Thu, 07 Oct 2010 23:39:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Elvis Dowson wrote:
> Hi,
>         I have a target board that is not connected to the internet. 
> 
> What should I do to get gdbserver onto the target? 
> 
> I have built gdb-cross. Is there another recipe I can add to omap3-console-image, to make sure that gdbserver gets pulled in?

There is a gdbserver recipe for the target.

-- 
Tom Rini
Mentor Graphics Corporation


