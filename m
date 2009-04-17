Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Luvwo-0000Hu-Kf
	for openembedded-devel@openembedded.org; Fri, 17 Apr 2009 23:50:16 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090417214606.BURH27308.fed1rmmtao101.cox.net@fed1rmimpo01.cox.net>;
	Fri, 17 Apr 2009 17:46:06 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id glm21b00K4dMFYL03lm2EH; Fri, 17 Apr 2009 17:46:05 -0400
X-Authority-Analysis: v=1.0 c=1 a=jPlMlblrO3oA:10 a=ywbLZgbN88kA:10
	a=2XRDvOnuU58sM0CvZBAA:9 a=JtDTk8K7pe638V0omCQA:7
	a=McqWgsrDCfvrR3VZDYfMeNgun6sA:4
X-CM-Score: 0.00
Date: Fri, 17 Apr 2009 14:46:02 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090417214602.GW17629@smtp.west.cox.net>
References: <1239912183-25085-1-git-send-email-dhuggins@cs.cmu.edu>
MIME-Version: 1.0
In-Reply-To: <1239912183-25085-1-git-send-email-dhuggins@cs.cmu.edu>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: David Huggins-Daines <dhuggins@cs.cmu.edu>
Subject: Re: [PATCH] update canadian-sdk to match meta-toolchain
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
X-List-Received-Date: Fri, 17 Apr 2009 21:50:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2009 at 04:03:02PM -0400, David Huggins-Daines wrote:

> This patch synchronizes (to some extent) canadian-sdk.bb with
> meta-toolchain.bb.  Unlike meta-toolchain, it does not build an
> -extras package.  There's a lot of code duplication there which I will
> leave to the experts to sort out :)

Pushed to dev.  Starting on an SDK set of patches then Canadian SDK
patches for stable now.

-- 
Tom Rini


