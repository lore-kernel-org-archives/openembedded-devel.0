Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1QMRf3-0005IE-Dj
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 23:18:37 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 793D9110038D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 23:15:45 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BCCE0110038C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 23:15:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225006186.adsl.alicedsl.de
	[92.225.6.186]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 23:15:44 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 6CAE03C0D7; Tue, 17 May 2011 23:14:51 +0200 (CEST)
Date: Tue, 17 May 2011 23:14:51 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110517211450.GB29244@mail.familie-heinold.de>
References: <1305664937-20683-1-git-send-email-christian.charreyre@cioinfoindus.fr>
MIME-Version: 1.0
In-Reply-To: <1305664937-20683-1-git-send-email-christian.charreyre@cioinfoindus.fr>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH] libsdl-pango: new recipe for version 0.1.2
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
X-List-Received-Date: Tue, 17 May 2011 21:18:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 17, 2011 at 10:42:17PM +0200, Christian Charreyre wrote:
> This patches creates a new recipe for libsdl-pango.
> It uses debian patches, unless rebootstrap.patch which is very big and doesn't 
> seem necessary for the recipe.
> 
> +do_stage() {
> +	autotools_stage_all
> +}

No do_stage please.

Bye Henning


