Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LwETO-0004jH-QJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 13:49:13 +0200
Received: from andromeda.vanille.de (e180145179.adsl.alicedsl.de
	[85.180.145.179])
	by drlauer-research.com (Postfix) with ESMTP id 327C358410F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 14:13:30 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Apr 2009 13:44:45 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.27-11-generic; KDE/4.2.2; x86_64; ; )
References: <c384c5ea0904201542y7d6de263ve1de19745ed29d47@mail.gmail.com>
In-Reply-To: <c384c5ea0904201542y7d6de263ve1de19745ed29d47@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200904211344.45599.mickey@vanille-media.de>
Subject: Re: Reflection on MTN to GIT change?
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
X-List-Received-Date: Tue, 21 Apr 2009 11:49:27 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Worked very well for me. We were able to keep our workflow and continue full 
speed. Most of the pain has been removed from branching and merging and we're 
actually making use of it. 

We're still far away from making full use of the git capabilities, but it's a 
learning experience -- e.g. to scale better, I think eventually it's 
inevitable to adopt the kernel's pull model, where we have subsystem 
maintainers the master tree regular pulls from.

Cheers,

:M:


