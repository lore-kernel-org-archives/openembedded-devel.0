Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Junxi-0005ae-TH
	for openembedded-devel@openembedded.org; Sat, 10 May 2008 14:14:02 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Junwn-0004D7-CO
	for openembedded-devel@openembedded.org; Sat, 10 May 2008 12:13:05 +0000
Received: from ip-62-143-23-251.hsi.ish.de ([62.143.23.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 10 May 2008 12:13:05 +0000
Received: from no2spam by ip-62-143-23-251.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 10 May 2008 12:13:05 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 10 May 2008 14:12:52 +0200
Message-ID: <g043g8$imb$1@ger.gmane.org>
References: <fvpr9t$4vh$1@ger.gmane.org>	<fvq5c7$alo$1@ger.gmane.org>	<fvrtn6$93p$1@ger.gmane.org>	<fvs0bo$h8r$1@ger.gmane.org>	<fvs8g9$de9$1@ger.gmane.org>	<fvsb7t$nk1$1@ger.gmane.org>	<fvseh7$53i$1@ger.gmane.org>	<fvsj9q$nk0$1@ger.gmane.org>	<fvsm39$2r2$1@ger.gmane.org>
	<fvumf4$2te$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-23-251.hsi.ish.de
User-Agent: Thunderbird 2.0.0.12 (X11/20080227)
In-Reply-To: <fvumf4$2te$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: bp flag added to bug tracker (org.openembedded.stable)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Sat, 10 May 2008 12:14:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:
> Rolf Leggewie wrote:
>> Koen Kooi wrote:
>>> mail folder. I'm sure I can configure bugzilla to mail me and all that,
>>> but I honestly have no time or inclination to look into that right now.
>> Done ;-)
>>
>> For now, I added both oe-stablebranch and you to the list to cc whenever
>> the bp flag is requested.
> 
> It doesn't look like the mails make it to the list.  Can you please
> white-list bugzilla-daemon@amethyst.openembedded.net?
> 
> Koen, do you receive the notification mails?  We have quite a list of
> backport request by now.  Most of them easily applicable.
> 
> http://bugs.openembedded.net/request.cgi?action=queue&requester=&product=&type=all&requestee=&component=&group=type

Are "the stable guys" gonna let them rot in the BTS despite the efforts
I made to accomodate the requests you made?  If you are continuing to
ignore the patches (some of which I prepared just so you would not have
to inspect the changes between .stable and .dev yourselves), I might as
well close them all out as wontfix with a comment that .stable is
unsupported and the people "supporting" it don't care unless you jump
through whatever hoops-of-the-day they present you with.

So much for "same day review".

Last warning to take at least a little care about your .stable bugs and
patches in the tracker or have them all auto-closed.  If .stable chooses
to ignore the BTS we might as well make that transparent and inform the
poor fellows making the reports and hoping for support that they are out
of luck.



