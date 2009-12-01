Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NFOwt-0007sX-AM for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 10:23:10 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NFOvO-0004EY-8q
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 10:21:34 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2009 10:21:34 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2009 10:21:34 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 01 Dec 2009 10:21:09 +0100
Message-ID: <hf2n65$t39$1@ger.gmane.org>
References: <4B14BAD9.2060402@fqingenieria.es>	<20091201072521.GA11505@denix.org>
	<4B14D2E1.6050506@SSpaeth.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <4B14D2E1.6050506@SSpaeth.de>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Recipes relation tree
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
X-List-Received-Date: Tue, 01 Dec 2009 09:23:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-12-09 09:25, Sebastian Spaeth wrote:
> Denys Dmytriyenko wrote:
>> Have you looked at -g option of bitbake?
>>
>>    -g, --graphviz        emit the dependency trees of the specified packages in
>>                          the dot syntax
>
> A related question. This generates depends.dot just fine, but I found a
> reference to rdepends.dot in some manual. I would be very much
> interested in an RDEPENDS tree, is there a way to get this?

If you use testlab.bbclass you get one for each image.

regards,

Koen



