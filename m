Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q8JOs-0002mL-Vj
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 23:39:31 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q8JMo-0007TQ-8i from Tom_Rini@mentor.com ;
	Fri, 08 Apr 2011 14:37:22 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 8 Apr 2011 14:35:02 -0700
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Fri, 8 Apr 2011 14:37:21 -0700
Message-ID: <4D9F8006.3080402@mentor.com>
Date: Fri, 8 Apr 2011 14:37:10 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Jan Kobler <eng1@koblersystems.de>
References: <1302291183-17622-1-git-send-email-eng1@koblersystems.de>
	<4D9F654C.10206@mentor.com> <4D9F69CC.3060608@koblersystems.de>
In-Reply-To: <4D9F69CC.3060608@koblersystems.de>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 08 Apr 2011 21:35:02.0068 (UTC)
	FILETIME=[D1512740:01CBF634]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [mpc5125-twr 1/2] New machine mpc5125-twr, Freescale TWR-MPC5125-KIT
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
X-List-Received-Date: Fri, 08 Apr 2011 21:39:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 04/08/2011 01:02 PM, Jan Kobler wrote:
> Hi,
> 
> 1. I wanted to make a clear distinction between what I have written  and
> what I have taken from
> http://www.freescale.com/files/soft_dev_tools/software/board_support_packages/TWRMPC5125LinuxBSP.rar
> which contains the Linux kernel 2.6.29-v2010041601 for the TWR-MPC5125-KIT.
> 
> Therefore linux_VER.bb is in  [mpc5125-twr 1/2], because I have changed
> it. Otherwise I would put it together in one patch.
> 
> 2. I have tried to provide the same for Openembedded as Freescale is
> currently shipping on their web page
> http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=TWR-MPC5125-KIT&fpsp=1&tab=Design_Tools_Tab.
> I have not tried to port it to a more recent kernel.
> 
> Is there already a more recent kernel, which contains mpc5125-twr support?

It's possible that yes, this hardware is supported in 2.6.37.

-- 
Tom Rini
Mentor Graphics Corporation


