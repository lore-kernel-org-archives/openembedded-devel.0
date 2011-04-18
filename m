Received: from [83.223.64.65] (helo=eric-weiss.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eric-weiss.de>) id 1QBwdY-0003ee-OQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 00:09:40 +0200
Received: by eric-weiss.de (Postfix, from userid 1022)
	id 78E5A5666D; Mon, 18 Apr 2011 22:56:41 +0200 (CEST)
Received: from [10.128.0.1] (0133300566.0.fullrate.dk [95.166.196.39])
	by eric-weiss.de (Postfix) with ESMTP id 301145664A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 22:56:40 +0200 (CEST)
Message-ID: <4DACB16C.6050303@eric-weiss.de>
Date: Mon, 18 Apr 2011 23:47:24 +0200
From: eric weiss <eric@eric-weiss.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110402 Icedove/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1302979061.3780.6.camel@mattotaupa>
	<1303062425.23572.31.camel@mattotaupa>
In-Reply-To: <1303062425.23572.31.camel@mattotaupa>
X-Spam-Checker-Version: SpamAssassin 3.0.3 (2005-04-27) on eric-weiss.de
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	RATWARE_GECKO_BUILD autolearn=ham version=3.0.3
Subject: Re: [RFC] [PATCH] schroedinger: add version 1.0.10
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
X-List-Received-Date: Mon, 18 Apr 2011 22:09:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Try to compile schroedinger_1.0.9 with orc_0.4.10  instead of orc_0.4.12
seems that the int[8,16,32]_t definitions are gone int orc_0.4.12.

h


