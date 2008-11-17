Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L23T5-0004fL-9k
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 13:44:39 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L23Qk-00048l-Lm
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 12:42:14 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 17 Nov 2008 12:42:14 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 17 Nov 2008 12:42:14 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 17 Nov 2008 13:42:07 +0100
Message-ID: <gfroqv$hd5$1@ger.gmane.org>
References: <gfnf5u$r3j$1@ger.gmane.org>	<20081116145911.GB14299@dodger.lab.datenfreihafen.org>	<gfpdr0$6vm$1@ger.gmane.org>	<20081117094617.9a4ad7a9.raster@rasterman.com>	<gfrbvd$8h9$1@ger.gmane.org>
	<20081117114057.GA11401@datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081114 Shredder/3.0b1pre
In-Reply-To: <20081117114057.GA11401@datenfreihafen.org>
Sender: news <news@ger.gmane.org>
Subject: Re: e-wm broken after yesterdays upgrade
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
X-List-Received-Date: Mon, 17 Nov 2008 12:44:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-11-08 12:40, Stefan Schmidt wrote:
> Hello.
>
> On Mon, 2008-11-17 at 10:02, Koen Kooi wrote:
>> opkg doesn't install all files from a package on upgrade. I noticed this
>> before, but haven't been able to reproduce this.
>>
>> So there was indeed a bug in upgrading, but not in e :)
>
> Nice work guys. I already opened the mail, downloaded the logs and was ready to
> dive into it. Good that I checked mails once a gain before. :)
>
> We should file a bug about this for opkg I guess. Koen, will you do this?

Where does opkg bugzilla live nowadays?

regards,

Koen



