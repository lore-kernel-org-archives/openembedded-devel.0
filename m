Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MbzBK-0000lS-Qo
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 17:59:06 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MbyvE-00031w-NP
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 16:42:28 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MbyvE-0001BT-FF
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 16:42:28 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A8581D9.9010205@atmel.com>
References: <4A8516BF.9080405@atmel.com> <h63h7v$8pk$1@ger.gmane.org>
	<4A8581D9.9010205@atmel.com>
Date: Fri, 14 Aug 2009 16:42:24 +0100
Message-Id: <1250264545.12282.1271.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: No graphic when loading "x11-gpe-image"
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
X-List-Received-Date: Fri, 14 Aug 2009 15:59:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-08-14 at 17:25 +0200, Ulf Samuelsson wrote:
> There is really no output
> 
> gpe_dm is started and then nothing happens.

Do you see anything in syslog?  What does the output of "ps" look like
when it's in this state?

p.




