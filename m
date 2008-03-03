Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JVzAh-0001pO-Vd
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Mar 2008 02:08:54 +0100
Received: from 118-166-80-22.dynamic.hinet.net ([118.166.80.22]
	helo=tamarin.local) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JVz9d-0000rA-2S
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Mar 2008 02:07:45 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 3 Mar 2008 02:07:39 +0100
User-Agent: KMail/1.9.9
References: <1204303564.8126.38.camel@dax.rpnet.com>
In-Reply-To: <1204303564.8126.38.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200803030207.40083.zecke@selfish.org>
X-SA-Exim-Connect-IP: 81.169.183.159
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE Staging ABI Change Warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Mar 2008 01:08:56 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 29 February 2008 17:46:04 Richard Purdie wrote:
> Hi,
>
> OE.dev is now just about ready to switch to using sysroot. The compilers
> have been updated to activate sysroot and the fixes I/Poky have for
> various pkgconfig issues have been committed. The final change is to
> actually change the layout.

Hi Richard,

one small question, how does this impact:
	-The sharp rom and their crappy and ancient 2.95.x toolchain?
	-Any other prebuilt toolchain.

and honestly I'm a bit scared of silently breaking thousands of packages/BB 
files.


regards
	z.


