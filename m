Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LRXkD-0001gs-JD
	for openembedded-devel@openembedded.org; Mon, 26 Jan 2009 21:07:41 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LRXd0-0004XR-6J
	for openembedded-devel@openembedded.org; Mon, 26 Jan 2009 20:00:14 +0000
Received: from 77-253-116-157.adsl.inetia.pl ([77.253.116.157])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 26 Jan 2009 20:00:14 +0000
Received: from uzytkownik2 by 77-253-116-157.adsl.inetia.pl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 26 Jan 2009 20:00:14 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Maciej Piechotka <uzytkownik2@gmail.com>
Date: Mon, 26 Jan 2009 20:50:44 +0100
Message-ID: <878woxc0dn.fsf@news.piechotka.com.pl>
References: <8763k3czl7.fsf@news.piechotka.com.pl>
	<200901251759.43567.mickey@vanille-media.de>
	<871vuqcqz9.fsf@news.piechotka.com.pl>
	<200901261916.58938.mickey@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 77-253-116-157.adsl.inetia.pl
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.3 (gnu/linux)
Cancel-Lock: sha1:hGXg+nA5jgSya5vN+RzLHeUPJhY=
Sender: news <news@ger.gmane.org>
Subject: Re: Problem with building connman
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
X-List-Received-Date: Mon, 26 Jan 2009 20:07:41 -0000
Content-Type: text/plain; charset=us-ascii

"Michael 'Mickey' Lauer" <mickey@vanille-media.de> writes:

> Am Monday 26 January 2009 11:16:10 schrieb Maciej Piechotka:
>> "Michael 'Mickey' Lauer" <mickey@vanille-media.de> writes:
>> > Which libtool version?
>>
>> libtool-cross-1.5.10-r10
>> libtool-native-1.5.10-r10
>
> Can you retry with libtool2 and automake 1.10?

I'll try but I cannot manage to force this #### bitbake to install
libtool2. I cannot find anything in bb files wich would prohibit
installing it but it install libtool in the older version.

Regards
-- 
I've probably left my head... somewhere. Please wait untill I find it.
Homepage (pl_PL): http://uzytkownik.jogger.pl/
(GNU/)Linux User: #425935 (see http://counter.li.org/)



