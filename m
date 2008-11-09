Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kz6Nl-00072h-Km
	for openembedded-devel@openembedded.org; Sun, 09 Nov 2008 10:14:57 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kz6M5-0004tV-GR
	for openembedded-devel@openembedded.org; Sun, 09 Nov 2008 09:13:13 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 09 Nov 2008 09:13:13 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 09 Nov 2008 09:13:13 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 09 Nov 2008 10:13:04 +0100
Message-ID: <gf69j0$623$1@ger.gmane.org>
References: <20081105202153.GB5836@dodger.lab.datenfreihafen.org>
	<20081108210138.GA7205@dodger.lab.datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081025 Shredder/3.0b1pre
In-Reply-To: <20081108210138.GA7205@dodger.lab.datenfreihafen.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Broken update-mime-database due to recent changes
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
X-List-Received-Date: Sun, 09 Nov 2008 09:14:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-11-2008 22:01, Stefan Schmidt wrote:
>For this one shared-mime-info-native_0.51.bb is needed. Sadly this one 
fails for
> me on one machine:
>
> | /usr/bin/ld: cannot find -lgio-2.0
>
> http://134.169.172.106/~sschmidt/log.do_compile.28587.txt

http://gitweb.openembedded.net/?p=openembedded.git;a=commit;h=bfa489ee37aa8c752bb5a7981caae1972fbb4329



