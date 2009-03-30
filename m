Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LoNmR-0004iJ-Ao
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 22:08:24 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090330200612.HGTW27308.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 30 Mar 2009 16:06:12 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id ZY6A1b00K4dMFYL04Y6AX6; Mon, 30 Mar 2009 16:06:12 -0400
X-Authority-Analysis: v=1.0 c=1 a=6WQpoopjgy8A:10 a=DR5V8SchSNLjAFDqEVAA:9
	a=B-TmyVIz1Ug52mESVtDoSU5AECEA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 30 Mar 2009 13:06:10 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090330200610.GD14278@smtp.west.cox.net>
References: <200903302155.17027.joerg@hakker.de>
MIME-Version: 1.0
In-Reply-To: <200903302155.17027.joerg@hakker.de>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] linux-epia-2.6.19.2
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
X-List-Received-Date: Mon, 30 Mar 2009 20:08:26 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Mar 30, 2009 at 09:55:16PM +0200, Jörg Bakker wrote:

> Building of linux-epia-2.6.19.2 stops with the following error:
[snip]

This is actually quite a common error.  Can we call the patch something
more generic and stick it into files/ ? Thanks.

-- 
Tom Rini


