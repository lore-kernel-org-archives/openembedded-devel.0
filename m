Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NqAdr-0000yx-8g
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 20:35:27 +0100
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 12 Mar 2010 20:32:28 +0100
Received: from FBCMCL01B09.fbc.local ([192.168.171.26]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 12 Mar 2010 20:32:23 +0100
Received: from localhost.localdomain ([79.45.140.235]) by
	FBCMCL01B09.fbc.local with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 12 Mar 2010 20:32:23 +0100
Date: Fri, 12 Mar 2010 19:32:16 +0000
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100312193216.4e074959@no-log.org>
In-Reply-To: <1F44AB42-C908-4F2C-B4DB-689EC72B79BC@mac.com>
References: <1F44AB42-C908-4F2C-B4DB-689EC72B79BC@mac.com>
X-Mailer: Claws Mail 3.6.1 (GTK+ 2.18.6; i686-angstrom-linux-gnu)
Mime-Version: 1.0
X-OriginalArrivalTime: 12 Mar 2010 19:32:23.0401 (UTC)
	FILETIME=[BD47AD90:01CAC21A]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenGL v1.3 recipe for TI OMAP 3503 gumstix Overo
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
X-List-Received-Date: Fri, 12 Mar 2010 19:35:28 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Feb 2010 23:27:03 +0400
Elvis Dowson <elvis.dowson@mac.com> wrote:

>         Would anyone happen to know which OE recipe would allow me to
> include the classic OpenGL v1.3 library? I just want a software only
> OpenGL rendering context. 
maybe I'm making a huge mistake but there is swrast and mesa.

Denis.


