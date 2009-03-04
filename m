Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Leuja-0001HM-MB
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 18:18:18 +0100
Received: from [192.168.1.105] (e180183108.adsl.alicedsl.de [85.180.183.108])
	by drlauer-research.com (Postfix) with ESMTP id 51994584167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2009 18:38:48 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1236182004-4523-14-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-14-git-send-email-openembedded@haerwu.biz>
Organization: Vanille-Media
Date: Wed, 04 Mar 2009 18:14:07 +0100
Message-Id: <1236186847.10602.123.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Re: [PATCH 13/70] Add python-urlgrabber, python-iniparser, yum-metadata-parser and native varients (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 17:18:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Better use distutils_stage_headers or distutils_stage_all here, if they
do the job.

-- 
:M:



