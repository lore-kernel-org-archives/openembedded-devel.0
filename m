Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KqZHg-0006Eo-J5
	for openembedded-devel@openembedded.org; Thu, 16 Oct 2008 22:17:24 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KqZHd-0004Jc-Qg
	for openembedded-devel@openembedded.org; Thu, 16 Oct 2008 20:17:21 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 16 Oct 2008 20:17:21 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Oct 2008 20:17:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 16 Oct 2008 22:17:14 +0200
Message-ID: <gd87ga$b9n$1@ger.gmane.org>
References: <1224184795.4235.133.camel@lenovo.internal.reciva.com>	<gd8630$66f$1@ger.gmane.org>
	<87fxmwqpe5.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20081006 Shredder/3.0b1pre
In-Reply-To: <87fxmwqpe5.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: xserver-xorg rdepends
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
X-List-Received-Date: Thu, 16 Oct 2008 20:17:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-10-2008 22:02, Otavio Salvador wrote:
> Koen Kooi<k.kooi@student.utwente.nl>  writes:
>
>>> Any objections?
>> Yes. Recent xservers need hal for various input systems to work
>> correctly. So instead of crippling the xserver you can keep a crippled
>> version in your personal tree or overlay.
>
> Fully support to keep hal as rdepends.

Thinking about it some more, we should turn back the libhal split, so 
every hal apps works, instead of adding rdepends when we encounter 
broken apps.

regards,

Koen

PS: how can I merge your xfce work into .dev? The git phrasebook isn't 
really clear on that.




