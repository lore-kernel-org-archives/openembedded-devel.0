Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LewwX-0004n8-IT
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 20:39:51 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090304193523.BJXX4363.fed1rmmtao103.cox.net@fed1rmimpo01.cox.net>;
	Wed, 4 Mar 2009 14:35:23 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id P7bP1b0084dMFYL037bPEh; Wed, 04 Mar 2009 14:35:23 -0500
X-Authority-Analysis: v=1.0 c=1 a=z2cBfJZmOvIA:10 a=II7UTkEhgZcA:10
	a=Js0LpgGrAAAA:8 a=b_OEaAMLAAAA:8 a=-7hVfbqxAAAA:8 a=t4joOSN0AAAA:8
	a=TK3PjqdiS0dfZaHb5hYA:9 a=qH5K_HX8CRemf8T2wcXMFWxELEcA:4
	a=LY0hPdMaydYA:10 a=_qZRxRWV73kA:10
X-CM-Score: 0.00
Date: Wed, 4 Mar 2009 12:35:21 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090304193521.GW26343@smtp.west.cox.net>
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
X-List-Received-Date: Wed, 04 Mar 2009 19:39:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2009 at 04:52:29PM +0100, Marcin Juszkiewicz wrote:

> From: Richard Purdie <richard@openedhand.com>
> 
> git-svn-id: https://svn.o-hand.com/repos/poky@5098 311d38ba-8fff-0310-9ca6-ca027cbcb966
[snip]
> --- /dev/null
> +++ b/packages/yum/createrepo-native_0.9.bb
> @@ -0,0 +1,13 @@
> +SRC_URI = "http://linux.duke.edu/projects/metadata/generate/createrepo-${PV}.tar.gz \

404.  This is now:
http://createrepo.baseurl.org/download/createrepo-${PV}.tar.gz

Also, 0.9.6 is current.  Didn't poke any further than looking in the new
download dir, however.

-- 
Tom Rini


