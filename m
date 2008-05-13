Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JvryP-0000vB-8l
	for openembedded-devel@openembedded.org; Tue, 13 May 2008 12:43:09 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jvrx3-0008K2-0v
	for openembedded-devel@openembedded.org; Tue, 13 May 2008 10:41:45 +0000
Received: from ip-62-143-23-251.hsi.ish.de ([62.143.23.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 13 May 2008 10:41:45 +0000
Received: from no2spam by ip-62-143-23-251.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 13 May 2008 10:41:45 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 13 May 2008 12:41:34 +0200
Message-ID: <g0br8u$3g1$1@ger.gmane.org>
References: <48246A67.4030800@balister.org> <g01vo9$fb9$1@ger.gmane.org>
	<200805122258.40698.openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-23-251.hsi.ish.de
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
In-Reply-To: <200805122258.40698.openembedded@haerwu.biz>
Sender: news <news@ger.gmane.org>
Subject: Re: Change ANGSTROM_EXTRA_INSTALL to IMAGE_EXTRA_INSTALL
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
X-List-Received-Date: Tue, 13 May 2008 10:43:09 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> I vote against IMAGE_EXTRA_INSTALL. Let it live as ugly Angstrom hack for 
> breaking sane images into unsupportable ones.

How would the correct way to do this look like?

I regularly want to include package X for testing it out.  I don't want
to create a new image definition every time.



