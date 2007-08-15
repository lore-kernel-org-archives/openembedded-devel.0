Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1ILN2B-0007Xs-JS
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Aug 2007 19:52:02 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 808A728C013; Wed, 15 Aug 2007 19:48:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180191029.adsl.alicedsl.de [85.180.191.29])
	by srv043.dedi23.de (Postfix) with ESMTP id 4E80728C012
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2007 19:48:49 +0200 (CEST)
Date: Wed, 15 Aug 2007 19:51:26 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <977083614.20070815195126@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Python 2.5.1 coming / End-of-life for PyQt-Embedded
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
X-List-Received-Date: Wed, 15 Aug 2007 17:52:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi guys,

I'm going to push a major Python upgrade in the next couple of days.
The migration to 2.5.1 should be fairly painless with the exception of
a couple of end-of-life-packages for which no 2.5.x support exists.

The main problem is PyQt for Qt/Embedded 2.x. I would like to
completely drop support for all this or hand it over to someone else.
Is anyone actually running pyqt applications on Opie these days
anyways?

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



