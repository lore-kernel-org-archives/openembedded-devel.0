Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LoDS9-0000Nc-HG
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 11:06:45 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LoDQ7-0006gx-Ul
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 09:04:39 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 30 Mar 2009 09:04:39 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 30 Mar 2009 09:04:39 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 30 Mar 2009 11:04:27 +0200
Message-ID: <gqq1us$1hk$1@ger.gmane.org>
References: <20090328211530.7700adb1@mail.villafam.com>
	<200903301053.34937.hs4233@mail.mn-solutions.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090322 Shredder/3.0b3pre
In-Reply-To: <200903301053.34937.hs4233@mail.mn-solutions.de>
Sender: news <news@ger.gmane.org>
Subject: Re: TinyLogin
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
X-List-Received-Date: Mon, 30 Mar 2009 09:06:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30-03-09 10:53, Holger Schurig wrote:
>> recipes/tinylogin/tinylogin_1.4.bb  needs to be updated.
>
> And maybe it should be deprecated as well. With Busybox 1.13.3
> you won't need TinyLogin at all.

You do if you don't want busybox to run setuid root.

regards,

Koen



