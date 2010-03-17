Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1NrvJW-0005xu-AD
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 16:37:49 +0100
Received: from [192.168.1.12] (c-76-115-42-183.hsd1.or.comcast.net
	[76.115.42.183])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 61ECF30235
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 11:34:37 -0400 (EDT)
Message-ID: <4BA0F689.5010706@zenlinux.com>
Date: Wed, 17 Mar 2010 08:34:33 -0700
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.8) Gecko/20100227 Lightning/1.0b1 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268808661-13954-1-git-send-email-sgarman@zenlinux.com>
	<201003170813.19559.holger+oe@freyther.de>
In-Reply-To: <201003170813.19559.holger+oe@freyther.de>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 61ECF30235.94156
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
X-List-Received-Date: Wed, 17 Mar 2010 15:37:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/17/2010 12:13 AM, Holger Hans Peter Freyther wrote:
> On Wednesday 17 March 2010 07:51:01 Scott Garman wrote:
>> * Addresses CVE-2005-0706
>>
>> Signed-off-by: Scott Garman<sgarman@zenlinux.com>
>
> I was upgrading grip to the latest stable version yesterday, I have no issue
> if you want to upgrade to the latest devel version, even debian is shipping
> that... I have some comments in line.

Thanks for the guidance. I will re-submit an improved patch later today 
based on your feedback.

>>   create mode 100644 recipes/grip/grip-3.3.1/no-host-includes.patch
>>   create mode 100644 recipes/grip/grip_3.3.1.bb
>
> Please git mv from grip_3.2.0 to grip_3.3.1
>
>
>> +[http://downloads.sourceforge.net/grip/3.3.1/grip-3.3.1.tar.gz]
>> +md5=4b4233999b9f2bc85c711092553ea9aa
>> +sha256=d46394a1062ed066f9c633b010fd1059e63d9ed791bbb7a85bc6567cf0fd66fd
>
> that is deprecated, please see grip_3.2.0.bb on how to put the checksums into
> the recipe.
>
>
> I'm happy to review and push your updated recipe.

Much appreciated!

Scott

-- 
Scott Garman
sgarman at zenlinux dot com


