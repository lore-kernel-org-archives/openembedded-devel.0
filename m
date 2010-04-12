Received: from asmtpout030.mac.com ([17.148.16.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1O1R8H-0000A3-Re
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Apr 2010 23:25:26 +0200
MIME-version: 1.0
Received: from [87.201.169.57] by asmtp030.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0L0S00ERM5VTW180@asmtp030.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	12 Apr 2010 13:21:33 -0700 (PDT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=5.0.0-0908210000 definitions=main-1004120211
From: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <hpvotg$au0$1@dough.gmane.org>
Date: Tue, 13 Apr 2010 00:21:28 +0400
Message-id: <E4307ACF-AF45-4414-A86B-E55409F657F0@mac.com>
References: <AB16E937-B599-4A4A-8F81-7107E7C8DAD2@mac.com>
	<hpvotg$au0$1@dough.gmane.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1078)
X-SA-Exim-Connect-IP: 17.148.16.105
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Modifying Ralink RT3070 STA wifi driver for OpenEmbedded
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
X-List-Received-Date: Mon, 12 Apr 2010 21:25:26 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=us-ascii


On Apr 12, 2010, at 10:31 PM, Koen Kooi wrote:

> 
> Have a look at the existing rt3070 recipe:
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/rt2x00/rt3070_2.1.1.0.bb?id=bb3c6f24758b490366543e7392dd13cdcb200b6f
> 
> And FWIW, with 2.6.32 you can use the in-kernel rt28xx driver with
> rt3070 hw, but you still need the firmware
> 

Thanks Koen! 

Best regards,

Elvis


