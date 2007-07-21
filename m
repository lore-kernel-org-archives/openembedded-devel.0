Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1ICG6x-0000Et-QW
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2007 16:39:11 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id A052428C013; Sat, 21 Jul 2007 16:36:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180135002.adsl.alicedsl.de [85.180.135.2])
	by srv043.dedi23.de (Postfix) with ESMTP id E718F28C012;
	Sat, 21 Jul 2007 16:36:38 +0200 (CEST)
Date: Sat, 21 Jul 2007 16:38:19 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <136381535.20070721163819@vanille-media.de>
To: Mark Gross <markgross@thegnar.org>
In-Reply-To: <20070721125036.GA31700@thegnar.org>
References: <20070721125036.GA31700@thegnar.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: pdb for oe-python?
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
X-List-Received-Date: Sat, 21 Jul 2007 14:39:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi Mark,
> I'm building a slugos-image deriviative that includes python, and I
> would like to use the python debugger PDB. 

> I'm having a trouble figuring out how to enable the pdb module within
> the python OE bb file's.

I have just modified the python manifest to build a subpackage
python-debugger containing pdb and bdb. Please rebuild your python
recipe and try the resulting package (may contain missing
dependencies). Please report.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



