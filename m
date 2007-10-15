Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IhNio-0001jN-Ob
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Oct 2007 13:02:56 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 4D4A228C015; Mon, 15 Oct 2007 12:51:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ****
X-Spam-Status: No, score=4.3 required=5.0 tests=AWL,BAYES_00,RCVD_IN_DSBL,
	RCVD_IN_PBL, RCVD_IN_SORBS_DUL, REPTO_OVERQUOTE_THEBAT,
	SUBJ_HAS_UNIQ_ID autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180142195.adsl.alicedsl.de [85.180.142.195])
	by srv043.dedi23.de (Postfix) with ESMTP id 8663728C014
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2007 12:51:34 +0200 (CEST)
Date: Mon, 15 Oct 2007 12:56:27 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.24) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1146926050.20071015125627@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <009f01c80f03$00d29b60$0277d220$@dk>
References: <E1Ih50c-0005Xz-Bs@linuxtogo.org> <471263F8.30501@xora.org.uk>
	<009f01c80f03$00d29b60$0277d220$@dk>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev libid3tag: update to 0.15.1b, fix SRC_URI - close #3147
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
X-List-Received-Date: Mon, 15 Oct 2007 11:03:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Esben Haabendal wrote:
> I guess that many (all?) of these should be fixed to use
> ${SOURCEFORGE_MIRROR} as well.

It's just the ones with <fixedMirror>.dl.sf.net and
[pr]downloads.sf.net that needs fixing.

Anything else foo.sf.net can point to a per-project custom directory
structure and doesn't need to be changed.


Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



