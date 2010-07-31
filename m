Received: from asmtpout024.mac.com ([17.148.16.99])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1OfAj1-0005yT-4K
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 13:59:43 +0200
MIME-version: 1.0
Received: from [192.168.1.103] ([87.201.169.38])
	by asmtp024.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTPSA id <0L6F003IJ564H310@asmtp024.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	31 Jul 2010 03:58:56 -0700 (PDT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=6.0.2-1004200000 definitions=main-1007310045
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.0.10011,1.0.148,0.0.0000
	definitions=2010-07-31_02:2010-07-31, 2010-07-31,
	1970-01-01 signatures=0
From: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <i30rks$8aq$2@dough.gmane.org>
Date: Sat, 31 Jul 2010 14:58:36 +0400
Message-id: <1E016302-3017-40E6-9999-2A5DF47AF1F8@mac.com>
References: <9D2EA12D-A6C9-4965-A833-3B6CDCD8CD7B@mac.com>
	<i30rks$8aq$2@dough.gmane.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.99
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Which OE branch for beagleboard?
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
X-List-Received-Date: Sat, 31 Jul 2010 11:59:46 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=us-ascii


On Jul 31, 2010, at 1:50 PM, Koen Kooi wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 31-07-10 11:46, Elvis Dowson wrote:
>> Hi, 
>>        Which OE branch should I use to build angstrom images for the beagleboard?
> 
> 
> Use http://gitorious.org/angstrom/angstrom-setup-scripts [1], that will
> setup the right branch and bitbake for you.
> 

I've been working on the overo till now, and switching to beagleboard, there used to be a linux-omap3-2.6.xx series, but I don't see the omap3 linux recipes anymore. 

http://git.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux

Have they been replaced?

Which recipe would now how the correct omap3 recipe for beagle board with a TI OMAP 3530 processor?

Best regards,

Elvis



