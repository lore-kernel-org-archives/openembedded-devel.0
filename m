Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JvY9u-0007w2-Mq
	for openembedded-devel@openembedded.org; Mon, 12 May 2008 15:33:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4CDWDNP024481
	for <openembedded-devel@openembedded.org>;
	Mon, 12 May 2008 14:32:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24374-03 for <openembedded-devel@openembedded.org>;
	Mon, 12 May 2008 14:32:08 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4CDW6be024474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 12 May 2008 14:32:06 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1210586903.4981.26.camel@dax.rpnet.com>
References: <20080512001723.81DEF1892C6@amethyst.openembedded.net>
	<20080512092007.GC3841@cimmeria.hyboria>
	<1210586903.4981.26.camel@dax.rpnet.com>
Date: Mon, 12 May 2008 14:32:07 +0100
Message-Id: <1210599127.4981.54.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev autotools.bbclass: from	OM.	Needed as	commit 85a5e185b6a21e42e4243ad17befe40373025e0e alone	will	break	uclibc/gettext builds.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 12 May 2008 13:33:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-05-12 at 11:08 +0100, Richard Purdie wrote:
> I think the proper fix will be to stop using oe_libinstall entirely here
> and instead do something like:
> 
> http://www.rpsys.net/openzaurus/temp/autotools.patch

In the interests of getting this sorted I've committed something along
the lines of the above...

Cheers,

Richard



