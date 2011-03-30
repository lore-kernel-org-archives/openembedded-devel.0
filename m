Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Q4weG-0003CD-DK
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 16:45:28 +0200
Received: (qmail 5849 invoked by uid 2404007); 30 Mar 2011 14:43:29 -0000
X-clamdmail: clamdmail 0.18a
Received: from 87-206-60-144.dynamic.chello.pl (HELO ?192.168.1.112?)
	(marcin@juszkiewicz.com.pl@87.206.60.144)
	by host4.kei.pl with ESMTPA; 30 Mar 2011 14:43:29 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
References: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
Date: Wed, 30 Mar 2011 16:43:36 +0200
Message-ID: <1301496216.11614.18.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 1/6] Add support for the Technologic Systems TS7500 ARM SBCs
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
X-List-Received-Date: Wed, 30 Mar 2011 14:45:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Dnia 2011-03-30, śro o godzinie 10:07 -0400, UDel V2G Team pisze:
> +++ b/conf/machine/include/tune-fa526.inc

> +# This core basically resembles a ARM920T but has NO thumb
> interworking support
> +# which makes it not fully EABI compliant 

This is not arm920t core. Vendor says "The cores are based on the ARMv4™
instruction set and AMBA™ 2.0 AHB bus architecture." There is no
information on which core they based.



