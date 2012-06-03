Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mikew@criticallink.com>) id 1SbGH0-0004QI-Fk
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jun 2012 21:15:34 +0200
Received: by obhx4 with SMTP id x4so7139825obh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2012 12:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type
	:x-gm-message-state;
	bh=M+nK7/zE32jUrnKIVJzjwW/KhGudBXr/C3O/LdV4k1Y=;
	b=AwMMT79k3sHGpD/m0uXGCkOP26W7otnIwSc/A8acziCpjrFl+gfOQ9b+Ze8q3i2g1i
	ZmxNNh4nk/xkJJKF46SVCvvFjUFy9MX5tppScJRifv6TGA50HP0Yp54jt7e1BZb49U5M
	SLklV3gITaa870MNAomCTtuJ5rYF4Lu5lhRoYdQ8JiyFb1jwaO4Oj39f5pZckY/oRzuj
	8LvZAeXD+lNeZb+6tfePL0Ns+R7lPk9oF2xcMnMZ98HncxHvieOaqcL3O8j2bxPLmVEg
	Qd0rBC0TtCw1Xg62fNimL5g7dlp06J3qCqR13/mPSdKkvUQLxqARYG19k5aL40rc1P7u
	IFSQ==
Received: by 10.182.151.113 with SMTP id up17mr9479744obb.40.1338750310031;
	Sun, 03 Jun 2012 12:05:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.81.101 with HTTP; Sun, 3 Jun 2012 12:04:49 -0700 (PDT)
From: Mike Williamson <michael.williamson@criticallink.com>
Date: Sun, 3 Jun 2012 15:04:49 -0400
Message-ID: <CAHEoWwu4p2huW-bm21TF3HgJiwrq4V8y+OzSXTcrHx=9=qLUXg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQknULKePlBoFLAnFSsKZxRXoCMBz0vqt6RdrK5wF5zHPiJwDkQDBAOY201kYU68vU6G/eCl
Subject: canadian cross -- howto?
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
X-List-Received-Date: Sun, 03 Jun 2012 19:15:34 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I was wondering if there is any posted documentation (or
example somewhere) for building a Canadian cross?

I would like to migrate from a 32-bit linux build machine to
a 64-bit linux server (ubuntu) and would like to continue
to build SDK packages for 32-bit linux machines as well as
64-bit linux machines.  Is this possible?

It's not completely obvious to me googling around, but I
may not be using the right search criteria...  Most of the
hits are fairly old (pre core vs. classic, etc.).

-Mike


