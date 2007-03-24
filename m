Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>)
	id 1HUvde-0001DH-3L; Sat, 24 Mar 2007 03:05:50 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 6867A28C014; Sat, 24 Mar 2007 02:59:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL, RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180174150.adsl.alicedsl.de [85.180.174.150])
	by srv043.dedi23.de (Postfix) with ESMTP id F07D928C013;
	Sat, 24 Mar 2007 02:59:05 +0100 (CET)
Date: Sat, 24 Mar 2007 03:05:52 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.98.4) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <561924290.20070324030552@vanille-media.de>
To: "justinp commit" <openembedded-commits@lists.openembedded.org>
In-Reply-To: <E1HUlcy-0005nJ-Bu@linuxtogo.org>
References: <E1HUlcy-0005nJ-Bu@linuxtogo.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev linux-rp-2.6.20: add CONFIG_SHARPSL_RC=n for non-spitz machines
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
X-List-Received-Date: Sat, 24 Mar 2007 02:05:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

justinp commit wrote:
> linux-rp-2.6.20: add CONFIG_SHARPSL_RC=n for non-spitz machines

Just for the records... the canonical way to say that is
# CONFIG_FOO_BAR is not set

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



