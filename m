Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HqPCn-0008DW-KI
	for openembedded-devel@openembedded.org; Tue, 22 May 2007 09:54:53 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HqPBu-0000ID-DW
	for openembedded-devel@openembedded.org; Tue, 22 May 2007 09:53:58 +0200
Received: from p54b967a2.dip.t-dialin.net ([84.185.103.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 22 May 2007 09:53:58 +0200
Received: from no2spam by p54b967a2.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 22 May 2007 09:53:58 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 22 May 2007 09:53:51 +0200
Message-ID: <f2u7if$5g3$1@sea.gmane.org>
References: <4651EFEE.50907@atmel.com>	<189F751D-9A54-4A17-84FD-82CD2BF62403@gmx.net>
	<003a01c79c29$1985a690$26031a0a@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: p54b967a2.dip.t-dialin.net
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
In-Reply-To: <003a01c79c29$1985a690$26031a0a@atmel.com>
Sender: news <news@sea.gmane.org>
Subject: Re: ERROR: Task 2246 ( ...org.openembedded.dev/packages/gnome/gnome-desktop_2.16.1.bb, do_compile) failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 May 2007 07:54:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ulf Samuelsson wrote:
> Been trying to fetch all packages in advance by 
> 
> $ bitbake -c fetch gpe-image
> 
> but that does not work.

You want bitbake -c fetchall gpe-image



