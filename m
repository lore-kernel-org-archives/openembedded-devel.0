Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LmXlV-0003s6-8M
	for openembedded-devel@openembedded.org; Wed, 25 Mar 2009 19:23:49 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LmXjw-0002Zv-IA
	for openembedded-devel@openembedded.org; Wed, 25 Mar 2009 18:22:12 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 25 Mar 2009 18:22:12 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Mar 2009 18:22:12 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 25 Mar 2009 19:22:01 +0100
Message-ID: <gqdso9$7bi$1@ger.gmane.org>
References: <49C9FEFF.2010802@bolloretelecom.eu> <1237985345.8711.6.camel@opal>
	<49CA6B02.9070600@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090316 Shredder/3.0b3pre
In-Reply-To: <49CA6B02.9070600@bolloretelecom.eu>
Sender: news <news@ger.gmane.org>
Subject: Re: Dropping qt4-x11-free versions 4.1.2 and 4.3.3?
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
X-List-Received-Date: Wed, 25 Mar 2009 18:23:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25-03-09 18:33, Jeremy Lainé wrote:

> * what are qmake2-sdk and uicmoc4-sdk? The package using this is "meta-toolchain-neuros".

It's for people wanting to develop the neuros stuff below with an 'sdk'.

> * who is the maintainer for the neuros-* packages? They are in a really sad state (staging
> rules are only half-writtent so they mostly don't build), and they keep coming up when I
> grep for Qt-related stuff. I am wondering whether they don't belong in "nonworking"..

I guess I'm the closest thing to a maintainer for those. They built for 
me when I tried last (last year)

regards,

Koen



