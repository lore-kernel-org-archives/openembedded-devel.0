Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OgE5q-0005Wx-T9
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 11:48:00 +0200
Received: from [192.168.1.9] (business-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 1B023584139
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Aug 2010 11:49:48 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1081)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <1280780382-11697-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Tue, 3 Aug 2010 11:47:27 +0200
Message-Id: <C7EBDF2D-7BDC-41DB-B43A-29CAC171A242@vanille-media.de>
References: <1280780382-11697-1-git-send-email-fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] 500+ recipes: remove do_stage
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
X-List-Received-Date: Tue, 03 Aug 2010 09:48:06 -0000
X-List-Received-Date: Tue, 03 Aug 2010 09:48:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Acked-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>

Am 02.08.2010 um 22:19 schrieb Frans Meulenbroeks:

> This patch removes all occurrences of
> do_stage() {
>        autotools_stage_all
> }
> including all kind of variants w.r.t whitespace
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
[...]




