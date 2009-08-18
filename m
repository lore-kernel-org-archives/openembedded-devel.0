Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MdPwj-0007zD-HD
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 16:46:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 33547540FC4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 10:28:53 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25982-06 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 18 Aug 2009 10:28:53 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 0F7F0529011
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 10:28:53 -0400 (EDT)
Message-ID: <4A8ABAA4.9040707@cbnco.com>
Date: Tue, 18 Aug 2009 10:28:52 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1250547762-18690-1-git-send-email-msmith@cbnco.com>
	<200908181552.23518.holger+oe@freyther.de>
In-Reply-To: <200908181552.23518.holger+oe@freyther.de>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] site/common-linux: centralize bash configure vars
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
X-List-Received-Date: Tue, 18 Aug 2009 14:46:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Tuesday 18 August 2009 00:22:42 Michael Smith wrote:
>> Did this to fix bash on x86_64. Also bump bash PRs to help track
>> breakage later.

> Could you please send an updated patch. this does not apply and git am -3 is 
> not able to resolve it...

Hi Holger,

It's dependent on this one:

http://patchwork.openembedded.org/patch/939/

But let me get back to you after I do a test build of bash with uclibc 
(if that's even possible), just to make sure I didn't break something 
obvious.

Mike


