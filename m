Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1NrnIH-0002G9-3u
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 08:03:54 +0100
Received: from [192.168.1.12] (c-76-115-42-183.hsd1.or.comcast.net
	[76.115.42.183])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 0D34C301ED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 03:00:43 -0400 (EDT)
Message-ID: <4BA07E1C.50802@zenlinux.com>
Date: Wed, 17 Mar 2010 00:00:44 -0700
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.8) Gecko/20100227 Lightning/1.0b1 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268808661-13954-1-git-send-email-sgarman@zenlinux.com>
In-Reply-To: <1268808661-13954-1-git-send-email-sgarman@zenlinux.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 0D34C301ED.05DEC
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] grip: Upgrade to 3.3.1
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
X-List-Received-Date: Wed, 17 Mar 2010 07:03:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2010 11:51 PM, Scott Garman wrote:
> * Addresses CVE-2005-0706

Just for further clarification: if you look up this CVE directly, it 
states that grip v3.1.2 is affected. Although if you look at this 
FreeBSD advisory (which Holger referenced in his earlier email), it 
states that grip < 3.2.0_7 is affected.

http://www.freebsd.org/ports/portaudit/bcf27002-94c3-11d9-a9e0-0001020eed82.html

Scott

-- 
Scott Garman
sgarman at zenlinux dot com


