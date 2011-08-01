Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qnolm-0001V6-1I
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 11:26:42 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qnohc-0000V3-D4
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 11:22:24 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 01 Aug 2011 10:22:18 +0100
In-Reply-To: <4E366F8F.9070005@dresearch-fe.de>
References: <4E364EB1.8050800@dresearch-fe.de>
	<CACW_hTaqobWjz4WWneZ1JsfPTeGu8iu=FeinU62sum4-1rkvfw@mail.gmail.com>
	<4E366F8F.9070005@dresearch-fe.de>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312190544.30326.506.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: unnecessary dependencies?
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
X-List-Received-Date: Mon, 01 Aug 2011 09:26:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 11:19 +0200, Steffen Sledz wrote:
> libupnp supports UPnP 1.0 only and in addition we need SSDP only (not full UPnP).

If you only need SSDP then you might be better off just writing it
yourself.  It's a pretty small protocol.

p.




