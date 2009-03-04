Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LeumU-0002kS-3D
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 18:21:18 +0100
Received: from [192.168.1.105] (e180183108.adsl.alicedsl.de [85.180.183.108])
	by drlauer-research.com (Postfix) with ESMTP id 23702584167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2009 18:41:48 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1236182004-4523-30-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-30-git-send-email-openembedded@haerwu.biz>
Organization: Vanille-Media
Date: Wed, 04 Mar 2009 18:17:06 +0100
Message-Id: <1236187026.10602.124.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Re: [PATCH 29/70] yum: fixed packaging (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 17:21:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 04.03.2009, 16:52 +0100 schrieb Marcin Juszkiewicz:
> ++PYSYSDIR = /usr

Might not want to hardcode that. Compute ${prefix} instead.

-- 
:M:



