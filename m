Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LY0Qi-0000SN-Py
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 16:58:17 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090213155639.RVRL12838.fed1rmmtao103.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 10:56:39 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id FTwd1b0081E665w03TwdeT; Fri, 13 Feb 2009 10:56:39 -0500
X-Authority-Analysis: v=1.0 c=1 a=FP58Ms26AAAA:8 a=QWsv5MtBLs_8dyIVKcUA:9
	a=bdEZbcN1le2eOoKq_Btt91GWqJcA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Fri, 13 Feb 2009 08:56:37 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090213155637.GV11815@smtp.west.cox.net>
References: <200902131833.55265.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <200902131833.55265.khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] New package: tnef
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
X-List-Received-Date: Fri, 13 Feb 2009 15:58:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 13, 2009 at 06:33:54PM +0300, Roman I Khimov wrote:

[snip]
> --- a/conf/checksums.ini	2009-02-13 15:05:24.976017132 +0300
> +++ b/conf/checksums.ini	2009-02-13 18:30:39.887017023 +0300
> @@ -25330,3 +25330,6 @@ sha256=f57c4e33eb2cdd87a6c2f01bfa4794340
>  md5=5f7b88ebb2bcd7e8044328482d079661
>  sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
>  
> +[http://downloads.sourceforge.net/tnef/tnef-1.4.5.tar.gz]
> +md5=ec46d47525c6afb928642e3edec21058
> +sha256=42067fbc00d1ad4bcbb67440d61869aa43ed2d3d099fc691d3da8ad4296fa6b1

Can you please run the sorter
(contrib/source-checker/oe-checksums-sorter.py) when you add new
entries?  Thanks.

-- 
Tom Rini


