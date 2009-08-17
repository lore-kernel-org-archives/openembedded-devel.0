Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Md2Q5-0006AR-3v
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 15:38:41 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id C4D951B10C07
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 13:25:23 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 15:21:07 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <20090812095518.GA21131@zlo.nu>
In-Reply-To: <20090812095518.GA21131@zlo.nu>
MIME-Version: 1.0
Message-Id: <200908171521.07317.holger+oe@freyther.de>
Subject: Re: Curl security advisory CVE-2009-2417 [PATCH]
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
X-List-Received-Date: Mon, 17 Aug 2009 13:38:45 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Wednesday 12 August 2009 11:55:18 Marc Olzheim wrote:
> Hi,
>
> I'm not sure what the policy is for patch files of this type, but in
> this patch I decided to add them to recipes/curl/files, instead of
> including the curl.haxx.se urls in the SRC_URIs. I hope that that is the
> way to do it.
>
> The patch for 7.18.1 applies on 7.18.2 fine. Apart from applying
> patches, I added 7.19.6.
>
> Marc

Signed-off-by: Holger Freyther <zecke@selfish.org>

(I will take Khem's comment into account when landing)


