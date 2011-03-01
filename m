Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1PuTmg-0004Jz-3A
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 18:54:54 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PuTlJ-0007MT-TE
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 18:53:30 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1299001532-3260-2-git-send-email-GNUtoo@no-log.org>
References: <1299001532-3260-1-git-send-email-GNUtoo@no-log.org>
	<1299001532-3260-2-git-send-email-GNUtoo@no-log.org>
Date: Tue, 01 Mar 2011 17:58:59 +0000
Message-ID: <1299002339.23547.117.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] netbase and opkg: reorder init scripts to make networking come up at first boot
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
X-List-Received-Date: Tue, 01 Mar 2011 17:54:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-01 at 18:45 +0100, Denis 'GNUtoo' Carikli wrote:
> Without that fix, usb0 doesn't come up at first boot
>   (tested on the bug machine, with Angstrom on a console-image).
> 
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

That sounds like it's just papering over some kind of problem in
netbase.  What exactly stops usb0 from working with the previous
arrangement?

p.




