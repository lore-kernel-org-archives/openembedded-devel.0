Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id EE81C715B5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2014 07:09:37 +0000 (UTC)
Received: from ad.chargestorm.se (83.252.255.124) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Fri, 3 Oct 2014 09:09:34 +0200
Date: Fri, 3 Oct 2014 09:09:09 +0200
From: Anders Darander <anders@chargestorm.se>
To: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20141003070908.GA4658@ad.chargestorm.se>
Mail-Followup-To: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <cover.1411996185.git.anders@chargestorm.se>
	<c3982a9e7a7182cfb3f0147477202f0c7b15858a.1411996185.git.anders@chargestorm.se>
	<20141001151952.GD25706@jama>
	<20141002094731.GA4821@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20141002094731.GA4821@ad.chargestorm.se>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Subject: Re: [meta-oe] [PATCH 1/1] breakpad: install static library
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Oct 2014 07:09:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

* Anders Darander <anders@chargestorm.se> [141002 11:49]:
> Thanks, I'll re-test and send a v2 once I've made a clean build.

I've marked this patched as "Not applicable" in pathchwork. This time I
should've done my homework a lot better. The patch originates from a
customers project, however, they were running an older meta-oe release.
With the current recipe in meta-oe, this patch is not needed.

> I guess I mixed up all my own branches, as most of the work has been
> done on a daisy-based branch. :(

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

