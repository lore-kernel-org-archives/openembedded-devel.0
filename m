Received: from [66.249.82.239] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JUDT8-0003cT-0u
	for openembedded-devel@openembedded.org; Wed, 27 Feb 2008 05:00:39 +0100
Received: by wx-out-0506.google.com with SMTP id t16so3138398wxc.6
	for <openembedded-devel@openembedded.org>;
	Tue, 26 Feb 2008 19:59:56 -0800 (PST)
Received: by 10.140.144.4 with SMTP id r4mr4081488rvd.15.1204084795214;
	Tue, 26 Feb 2008 19:59:55 -0800 (PST)
Received: from ?192.168.35.4? ( [128.252.118.150])
	by mx.google.com with ESMTPS id a68sm9645389rnc.14.2008.02.26.19.59.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 26 Feb 2008 19:59:54 -0800 (PST)
Message-ID: <47C4E02E.10409@gmail.com>
Date: Tue, 26 Feb 2008 22:59:42 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: bitbake-dev <bitbake-dev@lists.berlios.de>
References: <1203982094.16921.65.camel@dax.rpnet.com>
In-Reply-To: <1203982094.16921.65.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 66.249.82.239
X-SA-Exim-Mail-From: xjqian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: [Bitbake-dev] bitbake exec_task functionality changes
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
X-List-Received-Date: Wed, 27 Feb 2008 04:00:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/25/2008 06:28 PM, Richard Purdie wrote:
> There are various current use cases which are known to cause problems or
> don't have a desired behaviour in certain circumstances:
> 
> 1. "-c rebuild" doesn't build dependencies outside the specified package

Glad to know this is being taken care of.

Thanks
Gordon



