Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q7QFV-0007Mf-5f
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 12:46:09 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q7QDP-0000we-Io
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 12:43:59 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302085494.2267.20.camel@computer>
References: <1302085494.2267.20.camel@computer>
Date: Wed, 06 Apr 2011 11:43:57 +0100
Message-ID: <1302086637.14449.353.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: fennec fonts too small
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
X-List-Received-Date: Wed, 06 Apr 2011 10:46:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-04-06 at 12:24 +0200, Lukas-David Gorris wrote:
> It tried out fennec on htcleo machine (4,2" wvga, 217 ppi specified) and
> noticed the fonts are itsy. Maybe it would be good to install a modified
> configuration in order to make it more usable. It's possible to set font
> minima via about:config .
> 
> Should a configuration be added?

I think fennec ought to be figuring this out for itself at run time.  It
can get the screen dpi from the xserver.

p.




