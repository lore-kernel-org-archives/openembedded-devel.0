Received: from [67.121.157.153] (helo=integratus.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <andy@protium.com>) id 1HMwLz-0007Hn-Az
	for openembedded-devel@openembedded.org; Fri, 02 Mar 2007 02:14:35 +0100
Received: (qmail 8201 invoked from network); 2 Mar 2007 01:13:18 -0000
Received: from pool-71-116-66-86.snfcca.dsl-w.verizon.net (HELO
	?192.168.1.178?) (andy@71.116.66.86)
	by integratus.com with AES256-SHA encrypted SMTP;
	2 Mar 2007 01:13:18 -0000
Message-ID: <45E77A73.5020800@protium.com>
Date: Thu, 01 Mar 2007 17:14:27 -0800
From: Andy Wilcox <andy@protium.com>
User-Agent: Thunderbird 1.5.0.9 (X11/20061206)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per OE, policy:	remove feed management tools
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
X-List-Received-Date: Fri, 02 Mar 2007 01:14:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Mickey writes:
>
> Guys, please don't play games. Since it is a handy feature indeed,
> can we perhaps agree on making this a seperate bbclass to keep both of
> you satisfied?
>   
Agreed.  Any big behavior change like this should have much more discussion.
It might be wrong, but sometimes bugs become features.  Get used to it.

Feed generation is one way I sold OE internally and one reason why
it is so terribly useful.  If it has to come out for some policy, then 
perhaps the
policy should be revisited.

Kind Regards,
Andy






