Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MM4uR-0002lo-Km
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 20:51:55 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MM4it-0003fV-QV
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 18:39:59 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 18:39:59 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 18:39:59 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 01 Jul 2009 20:39:46 +0200
Message-ID: <h2gahi$564$1@ger.gmane.org>
References: <fce2a370907011121k3d082889xc6910fda9c21aee4@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090622 Shredder/3.0b3pre
In-Reply-To: <fce2a370907011121k3d082889xc6910fda9c21aee4@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Qt4 recipes and sql drivers
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
X-List-Received-Date: Wed, 01 Jul 2009 18:51:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-07-09 20:21, Ihar Hrachyshka wrote:
> Hello guys!
> For my work project, I need to use Qt with Postgres and possibly
> Sqlite. For this I modified current qt4.inc configure options and
> DEPENDS. Seems to work fine.
> The question is: should I enable functional sql drivers (as plugins of
> course) in-tree? The only problem I see here is that compile time for
> qt4 recipes will be a little longer (to build postgres and sqlite),
> but runtime dependencies are not bloated with postgres/sqlite things
> unless you really install the affected sqldrivers packages. If you
> will approve this change then I'll send a patch to ML.
> Thanks.

Building qt4 already takes eons on my core2quad, so an extra few minutes 
won't hurt.

regards,

Koen



