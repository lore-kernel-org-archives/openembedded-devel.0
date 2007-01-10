Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1H4iZj-000594-KH
	for openembedded-devel@openembedded.org; Wed, 10 Jan 2007 19:53:27 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1H4iXu-0008JS-4Z
	for openembedded-devel@openembedded.org; Wed, 10 Jan 2007 19:51:34 +0100
Received: from dialin107200.justdsl.de ([85.25.107.200])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 10 Jan 2007 19:51:34 +0100
Received: from no2spam by dialin107200.justdsl.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 10 Jan 2007 19:51:34 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Wed, 10 Jan 2007 19:51:21 +0100
Message-ID: <eo3cje$v28$1@sea.gmane.org>
References: <200701081618.46665.openembedded@hrw.one.pl>	<200701092322.34825.openembedded@hrw.one.pl>	<eo2o1a$9v4$1@sea.gmane.org>
	<200701101432.06542.openembedded@hrw.one.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: dialin107200.justdsl.de
User-Agent: Thunderbird 1.5.0.9 (X11/20070103)
In-Reply-To: <200701101432.06542.openembedded@hrw.one.pl>
Sender: news <news@sea.gmane.org>
Subject: Re: Status of ARM machines in OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jan 2007 18:53:27 -0000
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:

>> but still no SD, right?
> 
> What does rule 'Machine must have working 2.6 kernel' has to do with SD? 

That rule (which I understand and support fully, BTW) will break SD on 
the collie.

>> What is not usable for users in collie angstrom? 
> 
> There is no MMC/SD support, few other things are not finished in 2.6 port 
> too. Before those get fixed collie is unusable for users.

Well SD is certainly a major drawback.  If that is the most important 
thing, I would not call that "unusable", though.  Just certain parts are 
unusable.

Any machine maintainers for collie, yet, or nobody at all?



