Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1Om3zw-0002Qt-Gn
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 14:13:46 +0200
Received: (qmail 2185 invoked from network); 19 Aug 2010 14:13:06 +0200
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 19 Aug 2010 14:13:06 +0200
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id 2ac-sUv-JbSg
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 14:13:01 +0200 (CEST)
Received: (Qmail 2170 invoked from network); 19 Aug 2010 14:13:01 +0200
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 19 Aug 2010 12:13:01 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.69 #1
	(Debian)) id 1Om3zR-0005md-H3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 14:13:01 +0200
Date: Thu, 19 Aug 2010 14:13:01 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100819121301.GA21426@mi.fu-berlin.de>
References: <4C624772.8000607@nedap.com>
	<20100811072548.GB7282@mi.fu-berlin.de>
	<20100819105518.GL11569@jama>
MIME-Version: 1.0
In-Reply-To: <20100819105518.GL11569@jama>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-SA-Exim-Connect-IP: 160.45.40.10
X-SA-Exim-Mail-From: heinold@mi.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,UNPARSEABLE_RELAY
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problem building openjdk-6
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
X-List-Received-Date: Thu, 19 Aug 2010 12:13:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 19, 2010 at 12:55:18PM +0200, Martin Jansa wrote:
> Hi,
> 
> did you resolve it somehow? I still have the same issue on 2 hosts, 2
> different DISTROs and I didn't find any empty .jar or something.
> 
> Regards,
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

Hi,

not the jars are empty, some classes inside the jar. Unfornatly I will
not have the time to fix this before Sept. 13

So rebuild packages where classes inside the jars have 0 Bytes.

Bye Henning


