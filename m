Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Lxmme-0003yN-2s
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Apr 2009 20:39:28 +0200
Received: from andromeda.vanille.de (e180133179.adsl.alicedsl.de
	[85.180.133.179])
	by drlauer-research.com (Postfix) with ESMTP id ECA8D584A09
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Apr 2009 21:03:41 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Apr 2009 20:34:35 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; x86_64; ; )
References: <20090425075933.E6E18188456@amethyst.openembedded.net>
	<200904251540.40566.mickey@vanille-media.de>
	<be7a9f3d0904251117p5b0df982wb20f861bb90d9270@mail.gmail.com>
In-Reply-To: <be7a9f3d0904251117p5b0df982wb20f861bb90d9270@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200904252034.35801.mickey@vanille-media.de>
Subject: Re: [oe-commits] Koen Kooi : Revert "ecore: catch up with the new SONAMEs; move to autosplitting"
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
X-List-Received-Date: Sat, 25 Apr 2009 18:39:28 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 25 April 2009 20:17:22 Otavio Salvador wrote:
> This all is not a justification to break the whole World at dev. dev will
> be the basis of next stable, and even more, it is the source of changes
> for stable. So if we mess it up we'll end up with an very difficult to
> maintain stable branch and an unusable dev.

Yes, and I agree with all that, however there is the need to balance between 
breaking everything and letting everything through. If -- like it is happening 
right now -- people are paranoid about upgrade paths, then .dev moves to 
something where no actual development happens.

If you want to move forward, you will have to allow breakage now and then. 
This is the way with all projects. If you don't allow that, people will move 
elsewhere with their contributions and .dev will get stale rather than stable.

:M:



