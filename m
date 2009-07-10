Received: from [209.85.219.223] (helo=mail-ew0-f223.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1MPNbn-0003T9-L3
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jul 2009 23:26:19 +0200
Received: by ewy23 with SMTP id 23so818403ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2009 14:13:23 -0700 (PDT)
Received: by 10.210.142.6 with SMTP id p6mr2930561ebd.24.1247260402616;
	Fri, 10 Jul 2009 14:13:22 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 22sm3249725ewy.64.2009.07.10.14.13.21
	(version=SSLv3 cipher=RC4-MD5); Fri, 10 Jul 2009 14:13:21 -0700 (PDT)
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1MPNOF-0006xK-2i@melo.openembedded.org>
References: <E1MPNOF-0006xK-2i@melo.openembedded.org>
Date: Fri, 10 Jul 2009 22:13:20 +0100
Message-Id: <1247260400.3455.2.camel@xora-desktop.xora.org.uk>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 (2.26.2-1.fc11) 
Subject: Re: [oe-commits] Graeme Gregory : Revert "base.bbclass: add support for machine configuration fallback"
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
X-List-Received-Date: Fri, 10 Jul 2009 21:26:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-07-10 at 21:12 +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 0b207488de111a97eabcaeefa9a904431407ecff
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=0b207488de111a97eabcaeefa9a904431407ecff
> 
> Author: Graeme Gregory <dp@xora.org.uk>
> Date:   Fri Jul 10 22:11:52 2009 +0100
> 
> Revert "base.bbclass: add support for machine configuration fallback"
> 
> This reverts commit 6633c4c95a713bc365f5d87acc4a94621ed50034.
> 
Change totally broke parsing here!

Graeme




