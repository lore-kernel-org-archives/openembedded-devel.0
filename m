Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MTkBB-0003eM-Ki
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jul 2009 00:20:53 +0200
Received: by qw-out-1920.google.com with SMTP id 4so285027qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2009 15:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=zkB2XGMvABtJDp3JFVwI9n6B2Uzd98JqYYwLaPcI3rU=;
	b=J90y50LbRuC2P3hQdpE6ZhySh5eFLfVWL9iZ+GTPUPpXnLueEQDz7E7n+EU1kr8kgg
	crZFAcgbweOAGtWqusO49TQzsA1eCGGYou95Ath4pVg6p1aZTv24/uvboP4D+CGH3zkJ
	pnEYeY04u3VPMvOyJ4RD4g4pLT8KWNtMpvoT4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type:content-transfer-encoding;
	b=OE3npxn1HWT2e3pqayORGT3QMvo22lg5KKZlPnqF6uGJrnO4kALd8ZMAZJ1ucvTn9r
	h5NC0ck4JwqwyBYCow8aHBXcIoHohRCEIftowJU8Cfinlqu+XFKIbdrxiPSHIP7ECTwe
	pla+aOPIaen64vBbf8ZDJ77QfRrUL4T0nzzZY=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.220.91.147 with SMTP id n19mr1262219vcm.81.1248300402043; Wed, 
	22 Jul 2009 15:06:42 -0700 (PDT)
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 22 Jul 2009 15:06:22 -0700
X-Google-Sender-Auth: eac253f965c38bd5
Message-ID: <b6ebd0a50907221506k6b4bfd66gd79ff202232576b1@mail.gmail.com>
To: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel@lists.openembedded.org
Subject: BitBake is now in git [cross-posted]
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
X-List-Received-Date: Wed, 22 Jul 2009 22:20:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Just an fyi that a (imo) fairly sane bitbake git repo is up on
git.openembedded.org now.  The cgit is acting up, but cbrake will take
care of that eventually :)
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


