Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1NqViV-0004j0-53
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 19:05:39 +0100
Received: from [192.168.1.12] (c-76-115-42-183.hsd1.or.comcast.net
	[76.115.42.183])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 2989E30278
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Mar 2010 13:02:38 -0500 (EST)
Message-ID: <4B9BD33E.502@zenlinux.com>
Date: Sat, 13 Mar 2010 10:02:38 -0800
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.8) Gecko/20100227 Lightning/1.0b1 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268465302-3725-1-git-send-email-sgarman@zenlinux.com>
	<19c1b8a91003130002g55d34a65l9858e5ae62062eb3@mail.gmail.com>
In-Reply-To: <19c1b8a91003130002g55d34a65l9858e5ae62062eb3@mail.gmail.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 2989E30278.A766B
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
Subject: Re: [PATCH] sed: migrate -native to BBCLASSEXTEND
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
X-List-Received-Date: Sat, 13 Mar 2010 18:05:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2010 12:02 AM, Khem Raj wrote:
> On Fri, Mar 12, 2010 at 11:28 PM, Scott Garman<sgarman@zenlinux.com>  wrote:
>> Signed-off-by: Scott Garman<sgarman@zenlinux.com>
>
> can you also convert other native recipes for sed to use BBCLASSEXTEND

Yep, that was my plan. Although there is only one other sed-native 
recipe for v4.1.1. Should I just convert that one, or is there also any 
value in adding BBCLASSEXTEND = "native" for the two other v4.0.x recipes?

Scott

-- 
Scott Garman
sgarman at zenlinux dot com


