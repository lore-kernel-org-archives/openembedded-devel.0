Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K5QUK-00074a-7p
	for openembedded-devel@openembedded.org; Sun, 08 Jun 2008 21:23:36 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K5QPL-000144-KM
	for openembedded-devel@openembedded.org; Sun, 08 Jun 2008 19:18:27 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 08 Jun 2008 19:18:27 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 08 Jun 2008 19:18:27 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 08 Jun 2008 21:18:20 +0200
Message-ID: <g2hb9s$eg3$1@ger.gmane.org>
References: <g2h415$pk1$1@ger.gmane.org>
	<20080608185242.GA3463@cimmeria.hyboria>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008052703)
In-Reply-To: <20080608185242.GA3463@cimmeria.hyboria>
Sender: news <news@ger.gmane.org>
Subject: Re: pkg_postinst_* not working anymore -> broken packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 08 Jun 2008 19:23:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> On Sun, Jun 08, 2008 at 07:14:13PM +0200, Koen Kooi wrote:
>> Hi,
>>
>> Lately I have been wondering why things like avahi and umount don't work
>> properly any more in angstrom 2008, and I found out why:
>>
> This is http://bugs.openembedded.net/show_bug.cgi?id=4316 ??

That is exactly the problem I'm seeing. It also narrows down which 
packages need a PR bump after it gets fixed.

regards,

Koen



