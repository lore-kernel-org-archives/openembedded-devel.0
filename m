Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QtNRh-00057u-Iy
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 19:28:57 +0200
Received: by bkbzu17 with SMTP id zu17so113387bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 10:24:17 -0700 (PDT)
Received: by 10.204.185.65 with SMTP id cn1mr1488188bkb.109.1313515456827;
	Tue, 16 Aug 2011 10:24:16 -0700 (PDT)
Received: from [217.197.84.226] (recycler.in-berlin.de [217.197.84.226])
	by mx.google.com with ESMTPS id u14sm85525bkt.62.2011.08.16.10.24.14
	(version=SSLv3 cipher=OTHER); Tue, 16 Aug 2011 10:24:15 -0700 (PDT)
Message-ID: <4E4AA7B7.7020006@dresearch-fe.de>
Date: Tue, 16 Aug 2011 19:24:07 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Tom Rini <tom_rini@mentor.com>
Subject: [2011.03-maintenance] live555 update
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
X-List-Received-Date: Tue, 16 Aug 2011 17:28:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Is there a chance to update live555 to a newer version by cherry-picking this patch from oe-dev master?

commit b13c2ab570637b176e1411ea3db0ddf412a9f2f3
Author: Andrea Adami <andrea.adami@gmail.com>
Date:   Sat Apr 23 23:57:36 2011 +0200

    live555: catch up with upstream habits of upgrading and removing tarballs

    Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


