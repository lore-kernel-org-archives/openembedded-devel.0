Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Lumhn-0004Dv-5z
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Apr 2009 13:58:05 +0200
Received: from andromeda.vanille.de (e180155229.adsl.alicedsl.de
	[85.180.155.229])
	by drlauer-research.com (Postfix) with ESMTP id 1D8CA58413B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 14:22:28 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Apr 2009 13:54:04 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.27-11-generic; KDE/4.2.2; x86_64; ; )
References: <20090417114926.C6D6A189358@amethyst.openembedded.net>
In-Reply-To: <20090417114926.C6D6A189358@amethyst.openembedded.net>
MIME-Version: 1.0
Message-Id: <200904171354.04312.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Koen Kooi : iphone-compat: require angstrom, since minimal is just a copy of angstrom with added bugs, which we don' t need
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
X-List-Received-Date: Fri, 17 Apr 2009 11:58:05 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 17 April 2009 13:49:26 GIT User account wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: bd3f0156074826b765687af3ae1b745b5eaf0fa3
> URL:   
> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=bd3f015607482
>6b765687af3ae1b745b5eaf0fa3
>
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Fri Apr 17 10:41:07 2009 +0000
>
> iphone-compat: require angstrom, since minimal is just a copy of angstrom
> with added bugs, which we don't need
>
> From the my jabber logs with Jeremy, the maintainer of iphone-compat:
>
> 12:37 Koen: better inherit angstrom, since minimal is just angstrom with
> added bugs 12:38 Sharky: ah ok
> 12:38 Sharky: feel free to change it
>
> Mickey: next time check things before reverting (and violating the revert
> policy)

Will do. And you had better included an Acked-by in the first place, then I 
would have ignored that commit.

NB, I won't comment on your strategy of pursuing folks into buying your view 
of the OE-world. Interested readers will hopefully draw their own conclusions.

:M:



