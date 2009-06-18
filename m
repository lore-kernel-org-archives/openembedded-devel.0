Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MHLx5-0005Xw-Gs
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 20:03:08 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MHLms-0008Ct-A7
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 17:52:34 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 17:52:34 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 17:52:34 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 18 Jun 2009 19:52:21 +0200
Message-ID: <h1dusl$4lp$1@ger.gmane.org>
References: <C960916A-B754-4AD4-9751-67D7025AC8C1@mac.com>	<h19s8q$jd7$1@ger.gmane.org>	<4593EC5C-D89E-4947-AA92-3AD423A196B5@mac.com>	<h1dr55$nue$1@ger.gmane.org>
	<be7a9f3d0906180952v1bbb0611kd7079d5d947f83b8@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090604 Shredder/3.0b3pre
In-Reply-To: <be7a9f3d0906180952v1bbb0611kd7079d5d947f83b8@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Patch for libfann-2.0.0 recipe
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
X-List-Received-Date: Thu, 18 Jun 2009 18:03:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-06-09 18:52, Otavio Salvador wrote:
> Hello Koen,
>
> On Thu, Jun 18, 2009 at 1:48 PM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>>> PR = "r01"
>>
>> Don't set PR to that.
>
> I believe that most people prefer to always have PR field included;
> obviously it ought to be PR = "r1" or PR = "r0" but it is harder to
> forget to update it when it shows in the recipe.

That's nonsense. Not setting PR = "r0" in recipes makes maintenance a 
lot easier, e.g. forcing rebuild or all xorg libs. If every recipe was 
already using INC_PR, I might agree with you, but since that isn't the 
case adding PR = "r0" is creating more work.

regards,

Koen





