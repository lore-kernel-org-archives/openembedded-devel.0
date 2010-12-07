Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1PQ5eO-0001CN-Hf
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 23:04:45 +0100
Received: from [192.168.1.12] (c-76-105-143-140.hsd1.or.comcast.net
	[76.105.143.140])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id AEB21304F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Dec 2010 17:03:12 -0500 (EST)
Message-ID: <4CFEAF1F.70606@zenlinux.com>
Date: Tue, 07 Dec 2010 14:03:11 -0800
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi==kWiyOrmeUeUVNeC8FT0B8XxruHA0X4qMaPs_@mail.gmail.com>
In-Reply-To: <AANLkTi==kWiyOrmeUeUVNeC8FT0B8XxruHA0X4qMaPs_@mail.gmail.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: AEB21304F3.E08F2
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libcdaudio license issue
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
X-List-Received-Date: Tue, 07 Dec 2010 22:04:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2010 11:48 AM, Frans Meulenbroeks wrote:
> I was checking libcdaudio for LICENSE info.
> recipe says GPL
> COPYING file is the GPLv2 one
> README file says:
>
> libcdaudio is distributed under the GNU Library General Public
> License, included in this package under the top level source directory
> in the file COPYING
>
> C files also mention LGPL. but say v2 or later
>
> What to do with this in the LICENSE field? LGPLv2+ ?

Like others I agree with going with what the source files have in them.

Maybe this is obvious, but since I don't think anyone else has mentioned 
it, I think it would also be helpful to notify the upstream folks about 
this ambiguity so they can correct it.

Regards,

Scott

-- 
Scott Garman
sgarman at zenlinux dot com


