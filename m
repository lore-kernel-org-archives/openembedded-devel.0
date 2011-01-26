Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PiB29-0005dV-43
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 20:28:01 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PiB1N-0005bq-2N from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 11:27:13 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 26 Jan 2011 11:27:12 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 26 Jan 2011 12:27:11 -0700
Message-ID: <4D40758B.7030905@mentor.com>
Date: Wed, 26 Jan 2011 12:27:07 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
X-OriginalArrivalTime: 26 Jan 2011 19:27:11.0674 (UTC)
	FILETIME=[07A9E9A0:01CBBD8F]
Subject: Re: [PATCH 0/9] assorted independent pathlets
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
X-List-Received-Date: Wed, 26 Jan 2011 19:28:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/26/2011 11:13 AM, Bernhard Reutner-Fischer wrote:
> Hi,
>
> Some independent patchlets. Ok for master?
>
> Bernhard Reutner-Fischer (9):
>    fakeroot: add 1.14.5, mv 1.12.4 to obsolete
>    packaged-staging.bbclass: improve documentation
 >    ltp: bump version
 >    uclibc: handle some more {machine,distro}_features
 >    image.bbclass: only insert feed uris if ONLINE_PACKAGE_MANAGEMENT
 >    util-linux: honour largefile distro feature

Acked-by: Tom Rini <tom_rini@mentor.com>

>    IMAGE_CMD_ext4.xz: rm uncompressed image
>    kernel.bbclass: simplify "if image" condition

Questions sent separately.

>    micro: get preferred binutils from sane-toolchain

Don't feel qualified.

-- 
Tom Rini
Mentor Graphics Corporation


