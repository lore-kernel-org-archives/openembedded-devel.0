Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LUcgu-00023x-Ax
	for openembedded-devel@openembedded.org; Wed, 04 Feb 2009 09:01:05 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LUcgp-0006va-Go
	for openembedded-devel@openembedded.org; Wed, 04 Feb 2009 08:00:55 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 04 Feb 2009 08:00:55 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 04 Feb 2009 08:00:55 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 04 Feb 2009 09:00:45 +0100
Message-ID: <gmbhvd$8sm$1@ger.gmane.org>
References: <a7f8874a0902032245v333a379dq179c5bd7369f5dde@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090123 Shredder/3.0b2pre
In-Reply-To: <a7f8874a0902032245v333a379dq179c5bd7369f5dde@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] sg3-utils: get 1.24 to cross compile
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
X-List-Received-Date: Wed, 04 Feb 2009 08:02:00 -0000
X-List-Received-Date: Wed, 04 Feb 2009 08:02:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-02-09 07:45, Hans Henry von Tresckow wrote:
> Please review this patch and push if OK
>

> -<<<<<<<  HEAD:packages/sg3-utils/sg3-utils_1.24.bb
>
> -=======
> ->>>>>>>  c92bef17d2a35e06ec6edc2439918c88a7b4808b:packages/sg3-utils/sg3-utils_1.24.bb

This highlights one of the braindead things of git: it leave inline 
conflict markers in your code without telling you, breaking things left 
and right.

Anyway... those conflict markers aren't in OE, so please generate your 
patch against a clean tree.

regards,

Koen



