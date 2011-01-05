Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PaYJe-0004xy-0v
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 19:42:34 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PaYJE-00014h-Nb from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 10:42:08 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 5 Jan 2011 10:42:08 -0800
Received: from [172.30.80.239] ([172.30.80.239]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 5 Jan 2011 11:42:07 -0700
Message-ID: <4D24BB76.30300@mentor.com>
Date: Wed, 05 Jan 2011 11:41:58 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294249787-6035-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1294249787-6035-1-git-send-email-raj.khem@gmail.com>
X-OriginalArrivalTime: 05 Jan 2011 18:42:07.0843 (UTC)
	FILETIME=[41614B30:01CBAD08]
Subject: Re: [PATCH] distro/slugos: Upgrade to use gcc 4.5 and libtool 2.4
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
X-List-Received-Date: Wed, 05 Jan 2011 18:42:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2011 10:49 AM, Khem Raj wrote:
> * Depend on sane-toolchain
> * Upgrade few old pinned versions
> * Inherit own-mirrors to define slug src mirror

Nuke slugos-mirrors while you're at it?

-- 
Tom Rini
Mentor Graphics Corporation


