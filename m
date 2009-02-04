Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LUiVv-0007fY-Ap
	for openembedded-devel@openembedded.org; Wed, 04 Feb 2009 15:14:03 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LUiVn-0003ha-KR
	for openembedded-devel@openembedded.org; Wed, 04 Feb 2009 14:13:55 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 04 Feb 2009 14:13:55 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 04 Feb 2009 14:13:55 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 04 Feb 2009 15:13:45 +0100
Message-ID: <gmc7qq$gim$1@ger.gmane.org>
References: <49899FCE.3020900@free.fr>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090123 Shredder/3.0b2pre
In-Reply-To: <49899FCE.3020900@free.fr>
Sender: news <news@ger.gmane.org>
Subject: Re: gnutls-2.4.2 & automake 1.10
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
X-List-Received-Date: Wed, 04 Feb 2009 14:14:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-02-09 15:01, Eric BENARD wrote:
> Hi,
>
> I'm building a "minimal" distro for arm926 and got a problem with
> gnutls-2.4.2 (see message below).
> Running "bitbake automake-native-1.10" solved the problem by forcing the
> installation of a native automake 1.10.
>
> How can we tell gnutls-2.4.2 to automatically require automake 1.10
> during it's build process ?

use DISTRO=angstrom-2008.1 and define your own minimal image.

regards,

Koen



