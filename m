Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R37R5-0004U0-FT
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Sep 2011 16:24:35 +0200
Received: by bke11 with SMTP id 11so2343994bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2011 07:19:27 -0700 (PDT)
Received: by 10.204.152.201 with SMTP id h9mr76482bkw.147.1315837167163;
	Mon, 12 Sep 2011 07:19:27 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id p8sm6314796bkk.3.2011.09.12.07.19.25
	(version=SSLv3 cipher=OTHER); Mon, 12 Sep 2011 07:19:26 -0700 (PDT)
Message-ID: <4E6E14EC.1000301@dresearch-fe.de>
Date: Mon, 12 Sep 2011 16:19:24 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E69E904.6050109@dresearch-fe.de>
In-Reply-To: <4E69E904.6050109@dresearch-fe.de>
X-Enigmail-Version: 1.3.1
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Michael Lauer <mickey@vanille-media.de>, andy@protium.com,
	skoroneos@digital-opsis.com, m.cavallini@koansoftware.com
Subject: Re: How to verify patches for oe-dev master?
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
X-List-Received-Date: Mon, 12 Sep 2011 14:24:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.09.2011 12:23, Steffen Sledz wrote:
> At the moment we're using the 2011.03-maintenance branch with angstrom-2008.1, and we have a problem verifying patches.
> 
> Assuming we've found a fix to a bug in 2011.03-maintenance. In my opinion the fix should go to oe-dev master first and find it's way to 2011.03-maintenance by a pull request.
> 
> The problem is that oe-master does not support angstrom-2008.1 any more, so it's hard to check if the patch compiles/runs well under oe-master.

Let me reword the question.

Which "general purpose" distros are supported by oe-dev master at the moment and can be used to check if a patch applies, compiles, and runs?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


