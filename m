Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 243FE607F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 10:30:17 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 4034E68A01C; Mon, 22 Feb 2016 10:30:17 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_40,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id EC5FB68A019;
	Mon, 22 Feb 2016 10:30:16 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id A940267400EE;
	Mon, 22 Feb 2016 11:30:16 +0100 (CET)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56CAE338.7040002@mlbassoc.com>
Date: Mon, 22 Feb 2016 11:30:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: [meta-browser] ARM support in Chromium
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Feb 2016 10:30:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

A recent change to the chromium recipe restricts it to only
armv6 and armv7a.  I've built (and successfully run) previous
versions of chromium on my LS102x board which is cortexa7hf.
It's not clear to me what arm revision that works out to be
(where does one look for this info?) but I'd like to see if
chromium can still be used on my board?

Thanks for any pointers

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

