Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KvVt2-0003nP-A5
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 12:40:24 +0100
Received: from imp050244.vpn.mi.fu-berlin.de ([130.133.50.244]
	helo=tamarin.localnet) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KvVs3-0002Ko-OB
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 12:39:23 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Oct 2008 12:39:17 +0100
User-Agent: KMail/1.10.1 (Linux/2.6.27-7-generic; KDE/4.1.2; i686; ; )
References: <20081030101903.GA8716@walkingice> <49099314.5030909@smartlink.ee>
In-Reply-To: <49099314.5030909@smartlink.ee>
MIME-Version: 1.0
Message-Id: <200810301239.18157.zecke@selfish.org>
Subject: Re: A patch for autotools.bbclas which correct .la file
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
X-List-Received-Date: Thu, 30 Oct 2008 11:40:24 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 30 October 2008 11:57:24 Kalev Lember wrote:

> I think it might not be a good idea to do it in do_install_append(),
> because lots of recipes which inherit autotools bbclass also define
> do_install_append(). So the current approach would fix some, but break a
> set of other packages.

why? got an example?

z.


