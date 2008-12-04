Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L8Jym-0004PI-1S
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 20:35:16 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L8JvE-00021U-Q0
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 19:31:36 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 19:31:36 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 19:31:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 04 Dec 2008 20:31:27 +0100
Message-ID: <gh9b6f$jbk$1@ger.gmane.org>
References: <49382D2D.1030504@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081130 Shredder/3.0b1pre
In-Reply-To: <49382D2D.1030504@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: remove boost-jam-native 3.1.11
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
X-List-Received-Date: Thu, 04 Dec 2008 19:35:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-12-08 20:19, Robert Schuster wrote:
> Hi,
> I would like to remove the boost-jam-native recipe for version 3.1.11
> and instead rely on version 3.1.16 which we also have.

Can't we but those recipes (and associated patches) in obsolete/boost/? 
That way it will be outside of the default BBPATH and within reach for 
people needing/wanting it.
I'm not a big fan deletionist behaviour since we can't tell if people 
are relying on it since not everyone keeps their stuff in OE[1].

Also: what happened to removal.txt?

regards,

Koen

[1] OTOH, keeping their stuff out of OE is their own choice, with the 
associated troubles, much like external kernel modules and mainline



