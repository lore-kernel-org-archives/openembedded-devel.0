Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KnZqJ-0002M8-6L
	for openembedded-devel@openembedded.org; Wed, 08 Oct 2008 16:16:47 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KnZlk-0005kT-Jj
	for openembedded-devel@openembedded.org; Wed, 08 Oct 2008 14:12:04 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 08 Oct 2008 14:12:04 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 08 Oct 2008 14:12:04 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 08 Oct 2008 16:11:52 +0200
Message-ID: <gcif39$u79$1@ger.gmane.org>
References: <c384c5ea0810080646j6156c19ag284702150c5abe9f@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <c384c5ea0810080646j6156c19ag284702150c5abe9f@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: branch off the last stable branch under monotone?
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
X-List-Received-Date: Wed, 08 Oct 2008 14:16:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-10-2008 15:46, Leon Woestenberg wrote:
> Hello all,
>
> should we, or should we not, branch off a stable branch under
> monotone, i.e. the last stable using monotone?
>
> The argument would be to offer the existing use base (which typically
> lags behind much) a (last) monotone based branch.
>
> I can imagine the answer should be "no", as the number of maintainers
> is low (and I am to blame as well).

A read-only stable branch is pretty much useless, since you can't apply 
fixes to keep it stable.

regards,

Koen



