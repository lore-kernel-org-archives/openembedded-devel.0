Received: from [217.154.131.8] (helo=lon-gs5dmrelay.mistral.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bluelightning@bluelightning.org>) id 1KM6qx-0007XZ-S9
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jul 2008 21:51:55 +0200
Received: from [212.32.109.80] (helo=shodan.local)
	by lon-gs5dmrelay.mistral.net with esmtp (Exim 4.51)
	id 1KM6pj-0000w4-D0 for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jul 2008 20:50:39 +0100
From: Paul Eggleton <bluelightning@bluelightning.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jul 2008 20:50:35 +0100
User-Agent: KMail/1.9.9
References: <200807240048.20980.bluelightning@bluelightning.org>
	<1404.78.86.188.127.1216886903.squirrel@webmail12.pair.com>
	<1216890490.6103.1.camel@dax.rpnet.com>
In-Reply-To: <1216890490.6103.1.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200807242050.35634.bluelightning@bluelightning.org>
Subject: Re: PATCH: make h2200-bootloader load & depend on mtdblock
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 24 Jul 2008 19:51:56 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 24 July 2008, Richard Purdie wrote:
> Yes, its standard practise to RRECOMMEND kernel modules since if they're
> built into the kernel you get build failures otherwise. The RRECOMMEND
> is a standard approach and well tested.

Works like a charm. I have committed the changes including all 
recommendations. Thanks all!

Cheers,
Paul


