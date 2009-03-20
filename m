Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LkaL5-0000Qf-Sy
	for openembedded-devel@openembedded.org; Fri, 20 Mar 2009 09:44:27 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LkaK3-00030O-En
	for openembedded-devel@openembedded.org; Fri, 20 Mar 2009 08:43:23 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 20 Mar 2009 08:43:23 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Mar 2009 08:43:23 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 20 Mar 2009 09:43:09 +0100
Message-ID: <gpvkut$bf7$1@ger.gmane.org>
References: <49C2BAEA.8050205@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
In-Reply-To: <49C2BAEA.8050205@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: extension of policy on removing recipes
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
X-List-Received-Date: Fri, 20 Mar 2009 08:44:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-03-09 22:36, Robert Schuster wrote:
> Hi,
> the latest removal of the automake-native version just hit me today (I
> am not building chinook-compat regularly and I am basically the only
> person building it at all).
>
> What I found surprising is, that automake 1.10 was deleted although it
> was explicitly stated as PREFERRED_VERSION in the chinook-compat.conf.

It also was in the angstrom config as PREFERRED_VERSION.

regards,

Koen



