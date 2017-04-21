Return-Path: <osborn.steven@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8FE7312D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 22:25:55 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id w12so1721689oiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 15:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=uWeTO0f8Nb7Ng2WSY74oOnigi4MLC7V5GCm/v+ghkl0=;
	b=Yis/mLkqDn1YPONwXGitic114hSwy6j5hM4naJ4WTpY+fnS2f36PSyze3YvWP3TgGP
	+yDvF/v+IKTyTbomMN6NbwIF71CxoPRB47oTNPLONU0B9xaBix95IGzMeEPqCIyJDmqt
	j5WmzSNUSfq1xllpzf5D9G0AYJlTsTlivBYfZj0PePYoA2zQF5QH6qiqGFPpFnaOo16J
	VvtpsznccKcpRLqerWgym2BCKiRx0nmuDVAE6EEC78Pd1XaeA7dvbMPZC2pNEogItMW1
	E1izCTtScYCyPzdHgkYNIXwpJrSlqkXMdh/prTkA5FGMy7/xZTDO3SffPAP/g8EbGVIi
	32/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=uWeTO0f8Nb7Ng2WSY74oOnigi4MLC7V5GCm/v+ghkl0=;
	b=dLFlcSvs+f77h203Eemx9+9w4q6WPvxJAOqmGlk8SQXkdhpSsE+abg9lTK5pbBBVfB
	009b0Cj6vrbI1AK0lW11gsw7GIBiKMJtTnj63p8Z7qq1T8NhyKNHhuaFCCiFWOcGFh/R
	HHNxPrwlhF/s2mvLmzH+DnD3+KpGjQW2HBh++yHf/qtgM8cfDOLs+pV0AEXnbfXlNVgP
	3l0qucaOgQUHvW3h4+7jT9kfBd0XZdruIDOGNvY4W+/fCV+8GpA7byyiH2CI94Ks/e5c
	pIi/Fd/cFBAYimE+58S8YeDkCWVMLqzAgQdH3mOIVm9kJmbHFl7lVLSvi/5967iFFUaA
	WbkA==
X-Gm-Message-State: AN3rC/7unkkyRPc5EWHZDcNTXKWmgXHj6oEScnQtvEXZNBK5sl4/7Nbe
	jL/EjIzLrPg9ugBJ04RJzzuMF8sS11J7
X-Received: by 10.202.232.212 with SMTP id f203mr8975202oih.33.1492813556234; 
	Fri, 21 Apr 2017 15:25:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.149.38 with HTTP; Fri, 21 Apr 2017 15:25:55 -0700 (PDT)
From: Steven Osborn <osborn.steven@gmail.com>
Date: Fri, 21 Apr 2017 15:25:55 -0700
Message-ID: <CAA0Zw-x0XYPf4WS+KHj_90xkCuNaNZYysmaBZNryEq8genRUCA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: State of Java on OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Apr 2017 22:25:56 -0000
Content-Type: text/plain; charset=UTF-8

Is anyone using Java on OE devices right now?

meta-java - no release branches.  Seems to only be focused on master.
I've had trouble even finding a revision that will compile on Morty.

meta-oracle-java has a Morty branch, but the URI for the binaries is
bad so it fails to install.

Overall it seems like Java is not a very favored or platform at the moment.

--
Steven Osborn
http://lolsborn.com

