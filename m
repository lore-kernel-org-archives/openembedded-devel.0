Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MDvbR-0004WD-Ou
	for openembedded-devel@openembedded.org; Tue, 09 Jun 2009 09:18:37 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MDvSC-0006AV-Lf
	for openembedded-devel@openembedded.org; Tue, 09 Jun 2009 07:09:04 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 09 Jun 2009 07:09:04 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 09 Jun 2009 07:09:04 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 09 Jun 2009 09:08:53 +0200
Message-ID: <h0l1q5$gld$1@ger.gmane.org>
References: <1244522737-19251-1-git-send-email-no2spam@nospam.arcornews.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090531 Shredder/3.0b3pre
In-Reply-To: <1244522737-19251-1-git-send-email-no2spam@nospam.arcornews.de>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] rootfs_ipk.bbclass: use force-defaults (Bug 5133)
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
X-List-Received-Date: Tue, 09 Jun 2009 07:18:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09-06-09 06:45, Rolf Leggewie wrote:
> From: Rolf Leggewie<oe-devel@rolf.leggewie.biz>
>
> Without -force-defaults, I currently cannot build any image because opkg hangs, waiting for
> user input that of course never comes.

If opkg expects input during offline installation, the packages are 
buggy and we should fix the offending recipes.

regards,

Koen



