Received: from compulab.co.il ([67.18.134.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NIGZe-0007Lc-Jl
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 08:03:01 +0100
Received: from mail.linux-boards.com ([192.114.83.142]
	helo=zimbra-mta.compulab.co.il)
	by compulab.site5.com with esmtp (Exim 4.69)
	(envelope-from <mike@compulab.co.il>) id 1NIGY1-0001SQ-7Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 01:01:17 -0600
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id B47529A034F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2009 09:01:16 +0200 (IST)
X-Virus-Scanned: amavisd-new at compulab.co.il
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
	by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id mHrBbjlfiwpO
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2009 09:01:16 +0200 (IST)
Received: from [10.1.1.95] (mike-pc.compulab.local [10.1.1.95])
	by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 70AFC9A034C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2009 09:01:16 +0200 (IST)
Message-ID: <4B1F4B3B.7020209@compulab.co.il>
Date: Wed, 09 Dec 2009 09:01:15 +0200
From: Mike Rapoport <mike@compulab.co.il>
User-Agent: Thunderbird 2.0.0.21 (X11/20090712)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1260305960.git.mike@compulab.co.il>	<e06121f7b6525c76d4ab12258365dcc926d7729e.1260305960.git.mike@compulab.co.il>
	<hfmmdq$qkr$1@ger.gmane.org>
In-Reply-To: <hfmmdq$qkr$1@ger.gmane.org>
X-ACL-Warn: {
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - compulab.site5.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 67.18.134.219
X-SA-Exim-Mail-From: mike@compulab.co.il
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 3/5] cm-t35: add machine configuration
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
X-List-Received-Date: Wed, 09 Dec 2009 07:03:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



Koen Kooi wrote:
> On 08-12-09 22:11, Mike Rapoport wrote:
>> Signed-off-by: Mike Rapoport<mike@compulab.co.il>
> 
>> +MACHINE_EXTRA_RRECOMMENDS = "omap3-sgx-modules marvell-sdio-fw"
> 
> The current sgx release and all the following ones will have
> omap3-sgx-modules built directly from the .bin, so everyone building a
> task-base based images will have to request that from TI. Do you really
> want that?

This is difficult to tell... I think for now I'll align cm-t35 with other omap3
machines.

> regards,
> 
> Koen
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Sincerely yours,
Mike.




