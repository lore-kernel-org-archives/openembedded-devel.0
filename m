Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KiWqx-0002Ib-1t
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Sep 2008 18:04:35 +0200
Received: from [92.116.87.84] (helo=tamarin.local)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KiWnP-0001E7-AA
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Sep 2008 18:00:58 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Sep 2008 17:41:53 +0200
User-Agent: KMail/1.9.9
References: <gb0738$dcq$1@ger.gmane.org>
	<1222248100.15974.4.camel@ip6-localhost>
	<gbd3nl$hsb$1@ger.gmane.org>
In-Reply-To: <gbd3nl$hsb$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200809241741.53623.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.116.87.84
Subject: Re: Math is hard, but please pay attention to PV
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
X-List-Received-Date: Wed, 24 Sep 2008 16:04:35 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 24 September 2008 12:11:00 Koen Kooi wrote:

> What I'm wondering (and according to google Rod is wondering the same),
> are you actually testing package upgrades? My gta01 running angstrom
> needs a reimaging almost every time after an upgrade since
> openmoko/fso/efl stuff goes backwards in PV more that it goes forward.
> I'm trying to keep[1] FSO up-to-date and working in angstrom, but I'm
> very close on giving up on that.

I test the upgrade path on org.openmoko.asu.stable. I don't know if and when 
XorA merged that back properly. At Openmoko we will have to establish going 
from the stable branch to org.openmoko.dev and John filed a ticket on the 
upgrade path.

z.


