Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TJNJf-0006BC-Cu
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 13:40:39 +0200
Received: by eeit10 with SMTP id t10so3343650eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 04:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:x-mailer:from:subject:date
	:to:x-gm-message-state;
	bh=MVoj3zCMk4Q8DtUfd/A+f29306yypvPpghq1L2dD16I=;
	b=WlN0pznIb+6tSiyZMCeLlDPlwlLnRqBpDM1+cZxK9lbQM1mZgMFbkl21Y3VHnHP9Fx
	+15fI/99ohmUzqMS3yZEml/xILYGHn9j0uKQgZF1KXE6oOH4vzVorHmREwHFx7jA3LfV
	/bTIzT6AeIG5a2IdOxykejAbq9P7UC/v/Y7iaBQi4OgC8Tbo9LSRuRDCc4Ll1MdgPfG+
	7LGFCdYK10KMHODgjG6YA4ByvaYa1M5A5raLwzd8WWuO/QVcrTfT9u8z0aP+VfFck9DT
	HsCNMaiJwUjyMdQnf9CXMdAQtFjhwALAuSMP0zsMEkaFMhxYc9uQAdVoPXYEsp20b/Qt
	+Ceg==
Received: by 10.14.4.198 with SMTP id 46mr2241209eej.11.1349263659835;
	Wed, 03 Oct 2012 04:27:39 -0700 (PDT)
Received: from [172.20.0.5] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id z3sm9309459eel.15.2012.10.03.04.27.37
	(version=SSLv3 cipher=OTHER); Wed, 03 Oct 2012 04:27:38 -0700 (PDT)
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<k4h3oh$n4q$4@ger.gmane.org> <1403689.8imU91Pjgi@helios>
Mime-Version: 1.0 (1.0)
In-Reply-To: <1403689.8imU91Pjgi@helios>
Message-Id: <8B480455-60FE-418C-9A98-DB281B347CE2@dominion.thruhere.net>
X-Mailer: iPad Mail (10A403)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 3 Oct 2012 13:27:41 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQl2ATh9NxP59fGRqo8DmNZY3ljMcUNpWT6xLvPNh877KyCXz3vn3L+DbvR0CVepw3qdOpqQ
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH 0/6] Add meta-webserver
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
X-List-Received-Date: Wed, 03 Oct 2012 11:40:39 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



Op 3 okt. 2012 om 12:43 heeft Paul Eggleton <paul.eggleton@linux.intel.com> h=
et volgende geschreven:

> On Wednesday 03 October 2012 12:24:19 Koen Kooi wrote:
>> Squash those "import" with the "fix" commits, no sense in having a broken=

>> recipe in there.
>=20
> I'd rather not - there is sense in being clear about the changes, because=20=

> there are a large number of them in this case.

The broken recipes are still available in OE classic if people want to compa=
re them. I still don't get why you want to have broken recipes in the tree a=
t multiple points in your series.


>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


