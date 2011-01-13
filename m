Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msmith@cbnco.com>) id 1PdNxh-0003ud-QW
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 15:15:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 6DFD693D7D3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 09:14:04 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24218-10 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 13 Jan 2011 09:14:04 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 78FEB93CB82
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 09:14:02 -0500 (EST)
Message-ID: <4D2F08AA.5010804@cbnco.com>
Date: Thu, 13 Jan 2011 09:14:02 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D2E3885.8030207@cbnco.com> <4D2F054F.4020002@gmx.net>
In-Reply-To: <4D2F054F.4020002@gmx.net>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: openjdk-6-vm-shark on armv6 (ARM1176)
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
X-List-Received-Date: Thu, 13 Jan 2011 14:15:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Robert Schuster wrote:
> Hi Michael,
> can you check whether your llvm build definitely has multithread
> support? Check the build logfiles. If it is not enabled there will be
> warning message somewhere.

 From llvm do_configure:

-- Performing Test LLVM_MULTITHREADED
-- Performing Test LLVM_MULTITHREADED - Success

Thanks,
Mike


