Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MUEao-0007Cr-1P
	for openembedded-devel@openembedded.org; Fri, 24 Jul 2009 08:49:22 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MUEMw-0007Yr-Lq
	for openembedded-devel@openembedded.org; Fri, 24 Jul 2009 06:35:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 24 Jul 2009 06:35:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Jul 2009 06:35:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 24 Jul 2009 08:20:47 +0200
Message-ID: <h4bjs0$6va$3@ger.gmane.org>
References: <d405a6580907230950r63577d33u3175579e170ab105@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090712 Shredder/3.0b3pre
In-Reply-To: <d405a6580907230950r63577d33u3175579e170ab105@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] [stable/2009] fix for gstreamer-ti looking at current directory for codec combos
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
X-List-Received-Date: Fri, 24 Jul 2009 06:49:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-07-09 18:50, Vishnudas P wrote:
> Hi
>
> This patch runs againt Stable/2009 and fixes gstreamer-ti so that
> applications can run anywhere instead of being restricted to
> /usr/share/ti-codec-combos.
>
> The changes are
>    - Added patch to gstreamer-ti_svn.bb for configuring combo server path.
>    - Reverted patch http://patchwork.openembedded.org/patch/263/

Acked-by: Koen Kooi <koen@openembedded.org>




