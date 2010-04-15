Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1O2JAr-0000Ft-Gd
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 09:07:44 +0200
Received: from homiemail-a15.g.dreamhost.com (caiajhbdcaid.dreamhost.com
	[208.97.132.83])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 9C03F17B5D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 00:04:12 -0700 (PDT)
Received: from sspaeth.de (mtec-hg-docking-1-dhcp-204.ethz.ch
	[129.132.133.204])
	by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPA id EBB9076C065; 
	Thu, 15 Apr 2010 00:04:02 -0700 (PDT)
Received: by sspaeth.de (sSMTP sendmail emulation);
	Thu, 15 Apr 2010 09:04:00 +0200
From: "Sebastian Spaeth" <Sebastian@SSpaeth.de>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-devel@lists.openembedded.org
In-Reply-To: <1271240361-8354-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1271240361-8354-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Thu, 15 Apr 2010 09:04:00 +0200
Message-ID: <87ljcpkxi7.fsf@SSpaeth.de>
User-Agent: notmuch version 0.1-129-g887e216 (Emacs 23.1.1/x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] autotools.bbclass: swapped calls of intltoolize + autoreconf
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
X-List-Received-Date: Thu, 15 Apr 2010 07:07:45 -0000
Content-Type: text/plain; charset=us-ascii

On 2010-04-14, Enrico Scholz wrote:
> Because 'intltoolize' checks whether aclocal.m4 contains a recent copy
> of 'intltool.m4' and it will fail when the found version is too old,
> 'aclocal' must be called before 'intltoolize'.

Acked-by: Sebastian Spaeth <Sebastian@SSpaeth.de>


