Received: from asmtpout028.mac.com ([17.148.16.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1Of7fx-00062T-Tr
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 10:44:15 +0200
MIME-version: 1.0
Received: from [192.168.1.103] ([87.201.169.38])
	by asmtp028.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTPSA id <0L6E00AOPW4C2F60@asmtp028.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	31 Jul 2010 00:43:34 -0700 (PDT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=6.0.2-1004200000 definitions=main-1007310005
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.0.10011,1.0.148,0.0.0000
	definitions=2010-07-31_02:2010-07-31, 2010-07-31,
	1970-01-01 signatures=0
From: Elvis Dowson <elvis.dowson@mac.com>
In-reply-to: <A806EA3C-FD29-40A7-82E7-9391241EF930@mac.com>
Date: Sat, 31 Jul 2010 11:43:08 +0400
Message-id: <C3A2B5D3-75D5-4A5A-843A-631916635440@mac.com>
References: <A806EA3C-FD29-40A7-82E7-9391241EF930@mac.com>
To: OpenEmbedded Developer <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.103
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Is bitbake 1.10 the latest stable version?
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
X-List-Received-Date: Sat, 31 Jul 2010 08:44:15 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=us-ascii


On Jul 31, 2010, at 11:07 AM, Elvis Dowson wrote:

> I was wondering if bitbake-1.10 is the latest stable version? 

When trying to build a recipe, e.g. omap3-console-image, with the bitbake-1.10 and the current org.openembedded.dev, the display progress format looks pretty ugly  .. 

18% 40.5K 7m45s... .........
  2050K ......... ............ ..... ........... ......... 50% 36.0K 2m47s
  5250K .... 46% 14.4K 2m20s
  1700K .................. ........ .......................... ....... 23% 16.9K 4m26s
  2700K ...... ...... .... .................... .......... ................ ..... ... ..... ..... .............. 19% 27.6K 7m39s..
  2100K ................ 50% 31.9K 2m45s
  5300K ........... 30% 16.7K 3m40s
  1450K .......... ......... ..................... ... ........ ... ...... ............ . ....... ................. ........................ ...... ...... ...................... ............. 23% 20.3K 4m28s
  2750K ... ...... .... .......... 51% 32.3K 2m43s...
  5350K ................. ..... ............. 31% 25.8K 3m34s.... 19% 21.9K 7m35s
  2150K ................ ....... 47% 13.8K 2m16s
  1750K ....
  1500K ......... ............... ..... .......... .......... .... ....... .... ......................... .. ............... ............ ... ............. 23% 27.2K 4m28s


Best regards,

Elvis Dowson


