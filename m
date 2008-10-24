Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KtMQF-0001YH-Cb
	for openembedded-devel@openembedded.org; Fri, 24 Oct 2008 15:09:48 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KtMPd-0008Rg-Nb
	for openembedded-devel@openembedded.org; Fri, 24 Oct 2008 13:09:09 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 24 Oct 2008 13:09:09 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Oct 2008 13:09:09 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 24 Oct 2008 15:08:57 +0200
Message-ID: <gdshd9$90u$1@ger.gmane.org>
References: <20081022141057.GA8564@dodger.lab.datenfreihafen.org>	<gdnj3q$ei6$2@ger.gmane.org>	<20081023173830.GA14304@dodger.lab.datenfreihafen.org>	<gdqdt1$3c2$1@ger.gmane.org>
	<20081023221850.GA7780@dodger.lab.datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081023 Shredder/3.0b1pre
In-Reply-To: <20081023221850.GA7780@dodger.lab.datenfreihafen.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Some review for the stefan/xo-support branch
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
X-List-Received-Date: Fri, 24 Oct 2008 13:09:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-10-2008 00:18, Stefan Schmidt wrote:
> Hello.
>
> On Thu, 2008-10-23 at 19:56, Koen Kooi wrote:
>> On 23-10-2008 19:38, Stefan Schmidt wrote:
>>> Good point. The newest mainline tag I could find inside the repo was .22
>> The easiest way is to look at the top-level kernel makefile, that has
>> the exact version.
>
> That would indeed have been easier. :)
>
>>> http://git.openembedded.net/?p=openembedded.git;a=commitdiff;h=973295dbb4ab499c2c61972d0410ed8385d93447
>> Looks good!
>
> So you are through with your review? Anybody else objections about me pushing
> this in org.oe.dev?

The PV was my only comment, the rest looks good enough to go in.

regards,

Koen



