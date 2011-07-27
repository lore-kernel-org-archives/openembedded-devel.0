Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1Qm560-0007Rq-CE
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 16:28:24 +0200
Received: by ewy5 with SMTP id 5so1425163ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2011 07:24:10 -0700 (PDT)
Received: by 10.204.79.16 with SMTP id n16mr541190bkk.218.1311776649691;
	Wed, 27 Jul 2011 07:24:09 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id l22sm406017bku.24.2011.07.27.07.24.08
	(version=SSLv3 cipher=OTHER); Wed, 27 Jul 2011 07:24:08 -0700 (PDT)
Message-ID: <4E301F87.8040609@dresearch-fe.de>
Date: Wed, 27 Jul 2011 16:24:07 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.2
Subject: understanding overlays
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
X-List-Received-Date: Wed, 27 Jul 2011 14:28:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I'm not really familiar with the oe/bitbake overlay details. So please forgive me if this is a faq. ;-)

Is the overlay package or file based?

Or in other words is the following scenario possible?

base layer:

  recipes/
    foo/
      foo.inc
      foo_x.y.z.bb

overlay:

  recipes/
    foo/
      foo.inc

And than build foo-x.y.z with the foo.inc from the overlay.

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


