Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Q4wgL-0003KA-Mt
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 16:47:37 +0200
Received: (qmail 15177 invoked by uid 2404007); 30 Mar 2011 14:45:39 -0000
X-clamdmail: clamdmail 0.18a
Received: from 87-206-60-144.dynamic.chello.pl (HELO ?192.168.1.112?)
	(marcin@juszkiewicz.com.pl@87.206.60.144)
	by host4.kei.pl with ESMTPA; 30 Mar 2011 14:45:39 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1301494030-10554-3-git-send-email-v2g.udel@gmail.com>
References: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
	<1301494030-10554-3-git-send-email-v2g.udel@gmail.com>
Date: Wed, 30 Mar 2011 16:45:45 +0200
Message-ID: <1301496345.11614.20.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 3/6] Add kernel support for the Technologic Systems TS7500 ARM SBCs
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
X-List-Received-Date: Wed, 30 Mar 2011 14:47:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Dnia 2011-03-30, śro o godzinie 10:07 -0400, UDel V2G Team pisze:
> * Adds a custom kernel with all the patches for the Cavium FA 526 core

> +++ b/recipes/linux/linux-ts75xx_2.6.35.bb

Each year we are repeating the same message - most of board does not
require own kernel recipes. But people still invent them. Please merge
your board into recipes/linux/linux_2.6.35.bb instead of providing own
one.




