Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NXLZG-0004u8-Dm for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 22:24:57 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NXLWv-00021C-0B
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 22:22:29 +0100
Received: from p5b3b3140.dip.t-dialin.net ([91.59.49.64])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 22:22:28 +0100
Received: from no2spam by p5b3b3140.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 22:22:28 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 19 Jan 2010 22:21:42 +0100
Message-ID: <hj57p6$8p9$1@ger.gmane.org>
References: <hj5604g6@ger.gmane.org>
	<1263935073-12359-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b3140.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <1263935073-12359-1-git-send-email-ynezz@true.cz>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH v2] xinput_calibrator: switch to autotools
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
X-List-Received-Date: Tue, 19 Jan 2010 21:24:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Petr Štetiar wrote:
> Signed-off-by: Petr Štetiar <ynezz@true.cz>
> ---
>  ...01-switch-to-autotools-based-build-system.patch |  162 ++++++++++++++++++++
>  .../use-proper-compiler.patch                      |   20 ---
>  .../xinput-calibrator/xinput-calibrator_0.5.0.bb   |    7 +-
>  3 files changed, 166 insertions(+), 23 deletions(-)
>  create mode 100644 recipes/xinput-calibrator/xinput-calibrator-0.5.0/0001-switch-to-autotools-based-build-system.patch
>  delete mode 100644 recipes/xinput-calibrator/xinput-calibrator-0.5.0/use-proper-compiler.patch

please actually test your patches next time



