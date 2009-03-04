Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LexDy-0005jw-3t
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 20:57:50 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090304195334.BEYA16134.fed1rmmtao104.cox.net@fed1rmimpo02.cox.net>;
	Wed, 4 Mar 2009 14:53:34 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id P7tZ1b00L4dMFYL047tZu4; Wed, 04 Mar 2009 14:53:33 -0500
X-Authority-Analysis: v=1.0 c=1 a=z2cBfJZmOvIA:10 a=II7UTkEhgZcA:10
	a=Js0LpgGrAAAA:8 a=b_OEaAMLAAAA:8 a=fGO4tVQLAAAA:8
	a=LlluvTSdv8SKUqF7ffMA:9
	a=dMA8JwGNgqjpw4T2pGiYzkrKaWQA:4 a=LY0hPdMaydYA:10 a=_qZRxRWV73kA:10
X-CM-Score: 0.00
Date: Wed, 4 Mar 2009 12:53:33 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090304195333.GY26343@smtp.west.cox.net>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-15-git-send-email-openembedded@haerwu.biz>
MIME-Version: 1.0
In-Reply-To: <1236182004-4523-15-git-send-email-openembedded@haerwu.biz>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Richard Purdie <richard@openedhand.com>
Subject: Re: [PATCH 14/70] Add yum-native and createrepo (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 19:57:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2009 at 04:52:29PM +0100, Marcin Juszkiewicz wrote:

> From: Richard Purdie <richard@openedhand.com>
> 
> git-svn-id: https://svn.o-hand.com/repos/poky@5098 311d38ba-8fff-0310-9ca6-ca027cbcb966
[snip]
> --- /dev/null
> +++ b/packages/yum/yum-native_3.2.18.bb

Fails to compile, MACHINE=nokia800 DISTRO=minimal, BB_NUMBER_THREADS=4
PARALLE_MAKE="-j 6".  See http://pastebin.com/m36a992fb

-- 
Tom Rini


