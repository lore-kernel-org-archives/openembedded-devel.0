Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LrcKs-0008HA-Lf
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 20:17:35 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090408181411.HEVI10385.fed1rmmtao107.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 8 Apr 2009 14:14:11 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id d6E91b00H4dMFYL046E9nB; Wed, 08 Apr 2009 14:14:12 -0400
X-Authority-Analysis: v=1.0 c=1 a=3yNiNCsWiaUA:10 a=w5m77Bwnh3kA:10
	a=YEcJTrX4SZk9x759yxgA:9 a=CNV-Ib8NxN_o3kMUAhQA:7
	a=bQ6x_DKS9kVvv7NCRu1LwEy5DQIA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 8 Apr 2009 11:14:09 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090408181409.GO2195@smtp.west.cox.net>
References: <d2b9ea600904070016j5826cdbex6271177286c66c87@mail.gmail.com>
	<20090407165123.GE2195@smtp.west.cox.net>
	<d2b9ea600904080716y5776086fu8521915fa402f694@mail.gmail.com>
	<gric5v$qc4$1@ger.gmane.org>
	<d2b9ea600904080952g656823dby8c15a46b425f76c6@mail.gmail.com>
	<49DCE11F.90903@balister.org>
	<20090408175055.GM2195@smtp.west.cox.net>
	<d2b9ea600904081102k6e6e5c95r554c3d9111749e39@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <d2b9ea600904081102k6e6e5c95r554c3d9111749e39@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.39
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=AWL,BAYES_40,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH v2] mingw-binutils: update to 2.19.1
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
X-List-Received-Date: Wed, 08 Apr 2009 18:17:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2009 at 08:02:59PM +0200, Esben Haabendal wrote:
[snip]
> That is fine.  And it is also good that we improve the quality of the
> metadata when changing stuff.
> But it is just surprising that when I copy an existing recipe file to
> add a new version, it gives rise to so much need for improvement.
> The existing file were committed by yourself, although it originates
> from my canadian sdk work, but I maybe we could use time a bit more
> efficient than nitpicking to much on selected commit(ter)s. That said,
> it is always nice to have the best possible end result :-)

Yes.  Just trying to stop minor mistakes from getting repeated (and
cleaned up instead).  This is now in .dev and I just posted what I
pushed for review in stable.

-- 
Tom Rini


