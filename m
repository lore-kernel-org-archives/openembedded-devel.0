Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjaquez@igalia.com>) id 1P5Em1-0007cP-Vb
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 11:34:44 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArUEAHl2skxbdWOb/2dsb2JhbACUD4c/hy6+RIVIBI9A
X-IronPort-AV: E=Sophos;i="4.57,312,1283724000"; d="scan'208";a="686063522"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 11 Oct 2010 11:33:57 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1P5ElZ-0001uy-TT
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 11:33:57 +0200
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1P5ElZ-0007YJ-OO
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 11:33:57 +0200
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1P5ElZ-0001Fl-LC
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 11:33:57 +0200
Date: Mon, 11 Oct 2010 11:33:57 +0200
From: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101011093357.GA4715@lit.local.igalia.com>
References: <1286561232-31048-1-git-send-email-vjaquez@igalia.com>
MIME-Version: 1.0
In-Reply-To: <1286561232-31048-1-git-send-email-vjaquez@igalia.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 212.51.32.151
X-SA-Exim-Mail-From: vjaquez@igalia.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom.inc: set TARGET_VENDOR ?= "-angstrom"
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
X-List-Received-Date: Mon, 11 Oct 2010 09:34:48 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 08, 2010 at 08:07:11PM +0200, Víctor Manuel Jáquez Leal wrote:
> By doing this we could use external toolchains for build angstrom
> based images.
> 

Ping. Any comment about this patch?

vmjl


