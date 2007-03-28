Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1HWUl7-0000MZ-Dh
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2007 11:48:01 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id E9D8128C013; Wed, 28 Mar 2007 11:41:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL, RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180136146.adsl.alicedsl.de [85.180.136.146])
	by srv043.dedi23.de (Postfix) with ESMTP id 95D7628C011;
	Wed, 28 Mar 2007 11:41:07 +0200 (CEST)
Date: Wed, 28 Mar 2007 11:48:02 +0200
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.98.4) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <13210466406.20070328114802@vanille-media.de>
To: Lorn Potter <lpotter@trolltech.com>
In-Reply-To: <4609B171.9040000@trolltech.com>
References: <46097B18.3050901@trolltech.com>
	<200703272231.55842.openembedded@hrw.one.pl>
	<4609B171.9040000@trolltech.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: org.openembedded.dev fixes
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
X-List-Received-Date: Wed, 28 Mar 2007 09:48:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Lorn Potter wrote:
>> For future: please update first to check does work was done and send 
>> updates as 'diff -up' patches (or "mtn diff").

> ummm,.. I did update. Don't always assume something you do not know.

> Not sure why it isn't updating locally.

Well, Marcin has a point here, newcomers to Monotone often forget that
Monotone needs two steps to update, which are:

mtn pull && mtn update

as opposed to just one command for svn and cvs.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



