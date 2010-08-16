Received: from woodbine.london.02.net ([87.194.255.145])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bluelightning@bluelightning.org>) id 1Ol9To-0004KC-Ah
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 01:52:39 +0200
Received: from shodan.localnet (93.96.131.185) by woodbine.london.02.net
	(8.5.124.10)
	id 4C6543E7000DB457 for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 00:52:18 +0100
From: Paul Eggleton <bluelightning@bluelightning.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Aug 2010 00:52:16 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.32-24-generic; KDE/4.4.5; i686; ; )
References: <AANLkTinr4-xEo+Urc_9P+uLmLk6qPJSRzCJNYVsKAxD6@mail.gmail.com>
In-Reply-To: <AANLkTinr4-xEo+Urc_9P+uLmLk6qPJSRzCJNYVsKAxD6@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201008170052.16920.bluelightning@bluelightning.org>
X-SA-Exim-Connect-IP: 87.194.255.145
X-SA-Exim-Mail-From: bluelightning@bluelightning.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: orphaned files
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
X-List-Received-Date: Mon, 16 Aug 2010 23:52:39 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sun, 15 Aug 2010, Frans Meulenbroeks wrote:
>...
> opie-freetype modern-freetype-includes.patch
> opie-irdaapplet learning-cpp.patch
> opie-quicklauncher pro.patch
>...
> libopie exports.patch
> libopie ipaq-2.6-sys-class-backlight-support.patch
> libopie ipaq-lcd-rotate-cleanup.patch
> libopie keyboardless-buttonmap.patch
> libopie wireless.patch
>...

Definite ack on removing the above, AFAICT they were merged upstream.

I haven't had a chance to check the qte ones yet, but I will hopefully do so 
soon.

Cheers,
Paul


