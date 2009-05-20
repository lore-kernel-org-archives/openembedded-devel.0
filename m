Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M6tUq-0004PG-82
	for openembedded-devel@openembedded.org; Wed, 20 May 2009 23:38:44 +0200
Received: (qmail 10767 invoked from network); 20 May 2009 21:31:12 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 20 May 2009 14:31:12 -0700
Date: Wed, 20 May 2009 14:31:12 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090520213111.GW23842@smtp.west.cox.net>
References: <20090520100722.0F57F188075@amethyst.openembedded.net>
MIME-Version: 1.0
In-Reply-To: <20090520100722.0F57F188075@amethyst.openembedded.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [oe-commits] Koen Kooi : gcc 4.3.2, 4.3.3, 4.4.0: attempt to	fix zecke-no-host-includes. patch
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
X-List-Received-Date: Wed, 20 May 2009 21:38:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2009 at 12:07:22PM +0200, GIT User account wrote:

> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 21dbc0814fe2bd1f2cdbfa255d169139842661e9
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=21dbc0814fe2bd1f2cdbfa255d169139842661e9
> 
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Wed May 20 12:00:17 2009 +0200
> 
> gcc 4.3.2, 4.3.3, 4.4.0: attempt to fix zecke-no-host-includes.patch

As a user of older gcc's I'm quite happy you fixed this in 4.3.2, but in
the future can you please convert any gcc's you're touching that aren't
using INC_PR already to do so?  Thanks!

-- 
Tom Rini


