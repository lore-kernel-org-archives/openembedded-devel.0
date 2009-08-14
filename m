Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MbypY-0008PD-Eg for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 17:36:37 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MbyZP-0006DT-S5 for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 15:19:56 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 15:19:55 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 15:19:55 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 14 Aug 2009 17:19:42 +0200
Message-ID: <h63vae$ktr$1@ger.gmane.org>
References: <4A84650F.1080902@linuxbj.com>	<200908140406.00714.holger+oe@freyther.de>	<4A850430.6060809@linuxbj.com>
	<4A857D57.4040705@linuxbj.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090730 Shredder/3.0b4pre
In-Reply-To: <4A857D57.4040705@linuxbj.com>
Sender: news <news@ger.gmane.org>
Subject: Re: patch for compcache recipe
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
X-List-Received-Date: Fri, 14 Aug 2009 15:36:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14-08-09 17:05, Ming Chow 周明 wrote:
> Signed-off-by: Zhou Ming <chow.ming@linuxbj.com>
>
> I have renewed the patch looks like:
>
> - added the checksum entry
> - use kernel-module-compcache as the package name which results throwing
> out packages like "kernel-module-compcache_0.6pre3-r41.3_beagleboard.ipk"
> - use compcache-utils as the tool package name which looks like
> "compcache-utils_0.6pre3-r41.3_beagleboard.ipk"

NAK, 0.6pre3 violated the OE versioning policy, you want something like 
0.5+0.6pre3

regards,

Koen



