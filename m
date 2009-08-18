Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MdPO1-0001Do-WB
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 16:10:06 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 4DF671B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 13:56:45 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Aug 2009 15:52:23 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1250547762-18690-1-git-send-email-msmith@cbnco.com>
In-Reply-To: <1250547762-18690-1-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
Message-Id: <200908181552.23518.holger+oe@freyther.de>
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
X-List-Received-Date: Tue, 18 Aug 2009 14:10:06 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 18 August 2009 00:22:42 Michael Smith wrote:
> If the other site files are accurate, almost all of the bash vars
> are universal across Linux.
>
> Did this to fix bash on x86_64. Also bump bash PRs to help track
> breakage later.
>

Could you please send an updated patch. this does not apply and git am -3 is 
not able to resolve it...


