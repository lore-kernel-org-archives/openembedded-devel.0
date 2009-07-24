Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MUER9-0006hD-Sg
	for openembedded-devel@openembedded.org; Fri, 24 Jul 2009 08:39:24 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MUEDG-00079e-AL
	for openembedded-devel@openembedded.org; Fri, 24 Jul 2009 06:25:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 24 Jul 2009 06:25:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Jul 2009 06:25:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 24 Jul 2009 08:19:59 +0200
Message-ID: <h4bjqf$6va$2@ger.gmane.org>
References: <d405a6580907230951t3bdccfd5h9f6c5b862c65831f@mail.gmail.com>
	<20090723192301.GA7115@rhein.zuhause.netz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090712 Shredder/3.0b3pre
In-Reply-To: <20090723192301.GA7115@rhein.zuhause.netz>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] [Stable/2009] ti-dmai omapfb.h include path fix
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
X-List-Received-Date: Fri, 24 Jul 2009 06:39:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-07-09 21:23, Henning Heinold wrote:
> Hi,
>
> are these patches already into dev? If not please make a patch for dev and after they are checked in a proposal for
> integrate them into stable.

.dev has a more recent version that doesn't suffer from this problem, so 
in this case the patch can go in.

regards,

Koen



