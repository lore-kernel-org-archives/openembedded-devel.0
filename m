Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msmith@cbnco.com>) id 1Q2n6f-0005QD-9z
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 17:09:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 08BE53BDA27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 12:01:01 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07969-04 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 24 Mar 2011 12:01:00 -0400 (EDT)
Received: from [172.20.22.83] (dmzgw2.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 59F79488769
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 12:00:57 -0400 (EDT)
Message-ID: <4D8B6AB8.8030300@cbnco.com>
Date: Thu, 24 Mar 2011 12:00:56 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimPH65gqiSJGt9YtgJ2afpmPqX=snyMmMzP_+d4@mail.gmail.com>
	<1300981024-9111-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1300981024-9111-1-git-send-email-obi@opendreambox.org>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: MACHINE_KERNEL_PR overrides PR for modules
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
X-List-Received-Date: Thu, 24 Mar 2011 16:09:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Andreas Oberritter wrote:
> how about this solution? For MACHINE_KERNEL_PR = "r11" and PR = "r20" it
> creates PR = "r11.20", to mimic the revision numbers commonly seen with
> recipes using INC_PR.

I'd rather see PR before MACHINE_KERNEL_PR as PR seems more "major". But 
like either way better than the current situation.

Mike


