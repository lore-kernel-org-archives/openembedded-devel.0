Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LwMrf-0004xa-1c
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 22:46:47 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090421204217.PMNX22254.fed1rmmtao106.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 16:42:17 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id iLiH1b00M4dMFYL03LiHw9; Tue, 21 Apr 2009 16:42:17 -0400
X-Authority-Analysis: v=1.0 c=1 a=iMkaX5rVmKEA:10 a=Agl92mD6ai8A:10
	a=4HVRqb_MAAAA:8 a=zTwW8ZqlUQKav5HdWi8A:9
	a=ii7rD2w1XdFSjqj9uRduPqju954A:4 a=k-kO48AawpMA:10
X-CM-Score: 0.00
Date: Tue, 21 Apr 2009 13:42:17 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090421204217.GM17629@smtp.west.cox.net>
References: <1238404723-8814-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1238404723-8814-1-git-send-email-khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] bitbake.conf: use ROOTFS_SIZE for gzip'd images
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
X-List-Received-Date: Tue, 21 Apr 2009 20:46:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 30, 2009 at 01:18:43PM +0400, Roman I Khimov wrote:

> Make ext2.gz and ext3.gz images use ROOTFS_SIZE parameter for genext2s (as
> non-compressed ext2 and ext3 does).
> 
> This allows to use IMAGE_EXTRA_SPACE configuration.

Acked-by: Tom Rini <trini@embeddedalley.com>

-- 
Tom Rini


