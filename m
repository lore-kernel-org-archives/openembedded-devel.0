Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PHmCQ-0004LB-TE
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 00:41:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id AF49E8F072A;
	Sun, 14 Nov 2010 18:40:28 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22569-07; Sun, 14 Nov 2010 18:40:28 -0500 (EST)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 48F1F8EF706;
	Sun, 14 Nov 2010 18:40:28 -0500 (EST)
Date: Sun, 14 Nov 2010 18:40:28 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: Andreas Oberritter <obi@opendreambox.org>
In-Reply-To: <4CDEB86F.6000309@opendreambox.org>
Message-ID: <Pine.LNX.4.64.1011141837220.5082@juice.ott.cti.com>
References: <4CC6F440.10509@opendreambox.org>
	<4CC6F818.5010105@opendreambox.org>
	<4CC701D0.5070702@cbnco.com> <4CC765F9.4090005@opendreambox.org>
	<4CDEB86F.6000309@opendreambox.org>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Use of == in shell scripts
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
X-List-Received-Date: Sun, 14 Nov 2010 23:41:35 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 13 Nov 2010, Andreas Oberritter wrote:

> On 10/27/2010 01:36 AM, Andreas Oberritter wrote:
> >>> http://git.opendreambox.org/?p=obi/openembedded.git;a=shortlog;h=refs/heads/equality-operator
> 
> can you please pull and push these patches? I've rebased the tree on
> today's master. My write access still isn't working.

Pushed, thanks. I bumped PRs for a couple of recipes where the fix was in 
a file that gets packaged.

Mike


