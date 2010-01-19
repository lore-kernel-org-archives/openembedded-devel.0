Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NXEDj-0004dM-66 for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 14:34:14 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NXEBT-0002ul-Sq
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 14:31:51 +0100
Received: from p5b3b3140.dip.t-dialin.net ([91.59.49.64])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 14:31:51 +0100
Received: from no2spam by p5b3b3140.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 14:31:51 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 19 Jan 2010 14:31:30 +0100
Message-ID: <hj4c7h$umh$1@ger.gmane.org>
References: <1263904767-23489-1-git-send-email-sgh@sgh.dk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b3140.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <1263904767-23489-1-git-send-email-sgh@sgh.dk>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Make perl-native_* depend on make-native.
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
X-List-Received-Date: Tue, 19 Jan 2010 13:34:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

sgh@sgh.dk wrote:
>  recipes/perl/perl-native_5.8.4.bb |    2 +-
>  recipes/perl/perl-native_5.8.7.bb |    2 +-
>  recipes/perl/perl-native_5.8.8.bb |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

I suggest to change this in perl.inc instead.



