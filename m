Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pp26a-0001kW-E1
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 18:20:56 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pp25S-0000BJ-WA from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 09:19:47 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 14 Feb 2011 09:19:46 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Feb 2011 10:19:45 -0700
Message-ID: <4D596427.7060205@mentor.com>
Date: Mon, 14 Feb 2011 10:19:35 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D51566B.9060603@mentor.com>	<20110208145355.GF2050@xora-build.xora.org.uk>	<4D515A17.3060203@mentor.com>
	<4D523623.7030509@opensimpad.org>	<4D59543B.50506@mentor.com>
	<AANLkTikCsSry215+voCYt4ekMpE_kbM7cE7Jn+zPE3po@mail.gmail.com>
In-Reply-To: <AANLkTikCsSry215+voCYt4ekMpE_kbM7cE7Jn+zPE3po@mail.gmail.com>
X-OriginalArrivalTime: 14 Feb 2011 17:19:45.0879 (UTC)
	FILETIME=[60436E70:01CBCC6B]
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Mon, 14 Feb 2011 17:20:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/14/2011 09:57 AM, Frans Meulenbroeks wrote:
> Tom, if you are still taking requests.
>
> A collegue asked whether it would also be possible to add
> neek/minimal/minimal-image to the test set
> (console-image for it failed on a QA issue last time I tried it).

Just MACHINE=neek DISTRO=minimal BBPKGS=minimal-image?  I think I'll 
have room for the next round (re-reworking the job I run again).

-- 
Tom Rini
Mentor Graphics Corporation


