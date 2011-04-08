Received: from moutng.kundenserver.de ([212.227.126.186])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eng1@koblersystems.de>) id 1Q8Hv3-0006dE-6T
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 22:04:37 +0200
Received: from [192.168.1.34] (p57B40D8C.dip0.t-ipconnect.de [87.180.13.140])
	by mrelayeu.kundenserver.de (node=mreu4) with ESMTP (Nemesis)
	id 0LxHg6-1PsNnl2JVy-016v86; Fri, 08 Apr 2011 22:02:27 +0200
Message-ID: <4D9F69CC.3060608@koblersystems.de>
Date: Fri, 08 Apr 2011 22:02:20 +0200
From: Jan Kobler <eng1@koblersystems.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20110120 Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1302291183-17622-1-git-send-email-eng1@koblersystems.de>
	<4D9F654C.10206@mentor.com>
In-Reply-To: <4D9F654C.10206@mentor.com>
X-Provags-ID: V02:K0:U6koWK7sLCH2jlRpiO4GVVB5r8fqQAD7pNYNXSPNk8Q
	Tr5LZf68OqEbLoI40stF3MDlSC/6Ry8tMNSiPXAgIg1coDEvcG
	XaZrsPCNfS5V6YIieaO9i/t6IsDdnBF6g25sgrc7x1rMspSid8
	d0ZmmxXEsVeg/TCqhDyrp56GRCAUg0aUPXhFBc8utL6WHra5E2
	6hSLy4hrqRQEByQFnvH9g==
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
X-List-Received-Date: Fri, 08 Apr 2011 20:04:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

1. I wanted to make a clear distinction between what I have written  and
what I have taken from
http://www.freescale.com/files/soft_dev_tools/software/board_support_packages/TWRMPC5125LinuxBSP.rar
which contains the Linux kernel 2.6.29-v2010041601 for the TWR-MPC5125-KIT.

Therefore linux_VER.bb is in  [mpc5125-twr 1/2], because I have changed
it. Otherwise I would put it together in one patch.

2. I have tried to provide the same for Openembedded as Freescale is
currently shipping on their web page
http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=TWR-MPC5125-KIT&fpsp=1&tab=Design_Tools_Tab.
I have not tried to port it to a more recent kernel.

Is there already a more recent kernel, which contains mpc5125-twr support?

Best regards

Jan




