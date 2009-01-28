Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LS5vW-00088T-Eh
	for openembedded-devel@openembedded.org; Wed, 28 Jan 2009 09:37:38 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LS5oA-0007iq-Qc
	for openembedded-devel@openembedded.org; Wed, 28 Jan 2009 08:30:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 28 Jan 2009 08:30:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 28 Jan 2009 08:30:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 28 Jan 2009 09:28:21 +0100
Message-ID: <glp4v5$3aq$2@ger.gmane.org>
References: <a7f8874a0901280021u2d3bcbd9w2e6f47bfca00bb81@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090118 Shredder/3.0b2pre
In-Reply-To: <a7f8874a0901280021u2d3bcbd9w2e6f47bfca00bb81@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] Added rsnapshot
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
X-List-Received-Date: Wed, 28 Jan 2009 08:37:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28-01-09 09:21, Hans Henry von Tresckow wrote:
>  From 6d8f2311c513392996aef7bf61114977c859412b Mon Sep 17 00:00:00 2001
> From: Henry von Tresckow<hvontres@gmail.com>
> Date: Wed, 28 Jan 2009 00:19:45 -0800
> Subject: [PATCH] Added rsnapshot
>

> +RDEPENDS += " perl rsync logrotate"

Does it need any additional perl-modules to work?

> +RRECOMENTS += " ssh"

Typo

> +#SRC_URI= "http://www.rsnapshot.org/downloads/rsnapshot-${PV}.tar.gz"

Remove that.

regards,

Koen



