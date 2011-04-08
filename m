Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q8HcY-0000we-8I
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 21:45:30 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q8HaT-0007gf-Cb from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 12:43:21 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 8 Apr 2011 12:43:21 -0700
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Fri, 8 Apr 2011 12:43:20 -0700
Message-ID: <4D9F654C.10206@mentor.com>
Date: Fri, 8 Apr 2011 12:43:08 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1302291183-17622-1-git-send-email-eng1@koblersystems.de>
In-Reply-To: <1302291183-17622-1-git-send-email-eng1@koblersystems.de>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 08 Apr 2011 19:43:21.0240 (UTC)
	FILETIME=[374FF180:01CBF625]
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
X-List-Received-Date: Fri, 08 Apr 2011 19:45:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 04/08/2011 12:33 PM, Jan Kobler wrote:
> Freescale Development Kit TWR-MPC5125-KIT
> 
> Vendor page:  http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=TWR-MPC5125-KIT
> 
> The name mpc5125-twr is used by Freescale in the Linux kernel for this board.
> 
> Signed-off-by: Jan Kobler <eng1@koblersystems.de>

First, the linux_VER.bb change should be part of the patch that bring in
the patches for the board.  Second, I see upstream there's a
mpc512x_defconfig.  How much of this platform works upstream with a more
recent kernel?  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


