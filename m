Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1J4Eis-00083J-AD
	for openembedded-devel@openembedded.org; Mon, 17 Dec 2007 13:05:26 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1J4Ee1-0001f7-Mt
	for openembedded-devel@openembedded.org; Mon, 17 Dec 2007 12:00:25 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 17 Dec 2007 12:00:25 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 17 Dec 2007 12:00:25 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 17 Dec 2007 13:00:00 +0100
Message-ID: <fk5ocb$cn$1@ger.gmane.org>
References: <fju2o1$9l2$1@ger.gmane.org>
	<200712150508.51430.lpotter@trolltech.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <200712150508.51430.lpotter@trolltech.com>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: drop timezones from OE
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
X-List-Received-Date: Mon, 17 Dec 2007 12:05:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Lorn Potter schrieb:
> The timezones from opie are at least 4 years old and out of date. You can 
> safely discard this package/dependency.

OK, thanks for everybody's comments.  I have made and committed the
changes in 6430e9e1a0f6e1fc737ee4762668105d78aebda2.



