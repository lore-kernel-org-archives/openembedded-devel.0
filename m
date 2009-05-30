Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MATbU-00084S-Mh
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 20:48:24 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MATTC-0004aL-5c
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 18:39:50 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 18:39:50 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 18:39:50 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 30 May 2009 20:39:38 +0200
Message-ID: <gvruha$aj3$1@ger.gmane.org>
References: <4A213D52.8050802@gmail.com> <gvrh09$88g$1@ger.gmane.org>
	<loom.20090530T180147-530@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
In-Reply-To: <loom.20090530T180147-530@post.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Trying to build cmake in OE for BeagleBoard (errors)
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
X-List-Received-Date: Sat, 30 May 2009 18:48:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30-05-09 20:04, Dan wrote:

> On a side note, can OE autotools work with cmake files instead of ./configure?
> Then I could just avoid this mess entirely!

It should, try 'inherit cmake'. I haven't written any recipes that are 
using cmake, so it might not work.

regards,

Koen



