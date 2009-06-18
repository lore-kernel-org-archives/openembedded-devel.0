Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MHAHF-0004hB-2w
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 07:35:10 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MHA74-00010Z-Gl
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 05:24:38 +0000
Received: from p17194-ipngn801marunouchi.tokyo.ocn.ne.jp ([114.162.172.194])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 05:24:38 +0000
Received: from no2spam by p17194-ipngn801marunouchi.tokyo.ocn.ne.jp with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 05:24:38 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 18 Jun 2009 14:24:11 +0900
Message-ID: <h1cj1r$mps$1@ger.gmane.org>
References: <37367b3a0906171701h2a5b7f38wf1f52ebeead3972d@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p17194-ipngn801marunouchi.tokyo.ocn.ne.jp
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <37367b3a0906171701h2a5b7f38wf1f52ebeead3972d@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Error building busybox_1.13.2
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
X-List-Received-Date: Thu, 18 Jun 2009 05:35:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Alan Carvalho de Assis wrote:
> Hi list,
> 
> I am updating mx27ads as suggested by Tom Rini, but I found an issue.
> 
> The busybox_1.13.2 is broking during the do_install phase.
> 
> It is looking for:
> tmp/work/armv5te-angstrom-linux-gnueabi/busybox-1.13.2-r22.1/simple.script

Pull and retry.  It should be fixed in .dev



