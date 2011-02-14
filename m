Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Pp2PI-0002TD-FL
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 18:40:16 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Pp2OD-00007f-Ha
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 18:39:09 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D59677E.2040004@mentor.com>
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
	<AANLkTi=XjCgstGxtHd2jTmp5Kmm8wyQzOjJrxnnAhJU9@mail.gmail.com>
	<AANLkTikjvqTZcOiYHRsXdE9otGaJTavGKZ8iWtuN7GVu@mail.gmail.com>
	<AANLkTi=7XnywEHPjEReDvY68TNd-3fzr7FtREJ-6hp3T@mail.gmail.com>
	<AANLkTinXm+YcGS_uadbA6ddezRRtZB0r6Tqcgt7GyOh4@mail.gmail.com>
	<4D59677E.2040004@mentor.com>
Date: Mon, 14 Feb 2011 17:40:31 +0000
Message-ID: <1297705231.2178.104.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Mon, 14 Feb 2011 17:40:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-02-14 at 10:33 -0700, Tom Rini wrote:
> Honestly, I think we need bus and vendor in the split.  I do want the 
> firmware for my ralink USB WiFi dongle but not all of the other vendors 
> and I'd un-install what I could un-install.

Yeah, agreed.  Or even a split down to individual devices/drivers since
each of the Ralink firmware binaries is quite large in itself.

p.




