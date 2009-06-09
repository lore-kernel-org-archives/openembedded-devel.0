Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MDsk5-0001iH-Cd
	for openembedded-devel@openembedded.org; Tue, 09 Jun 2009 06:15:21 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MDsao-0008K7-Lk
	for openembedded-devel@openembedded.org; Tue, 09 Jun 2009 04:05:46 +0000
Received: from p3077-ipngn201marunouchi.tokyo.ocn.ne.jp ([114.177.118.77])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 09 Jun 2009 04:05:46 +0000
Received: from no2spam by p3077-ipngn201marunouchi.tokyo.ocn.ne.jp with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 09 Jun 2009 04:05:46 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 09 Jun 2009 13:05:31 +0900
Message-ID: <h0kn2c$pti$1@ger.gmane.org>
References: <200906031325.48159.marcin@juszkiewicz.com.pl>
	<200906081754.50176.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p3077-ipngn201marunouchi.tokyo.ocn.ne.jp
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <200906081754.50176.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] fix for MACHINE_KERNEL_PR stuff
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
X-List-Received-Date: Tue, 09 Jun 2009 04:15:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> Someone tested that?

Looks like its doing the right thing.

Tested with minimal distro and machine wrt54.  bb file specifies r2. 
without patch, it's r0 in bitbake.  With the patch, it's r2 as it should be.

Thank you for fixing this, especially since it wasn't you who broke things.



