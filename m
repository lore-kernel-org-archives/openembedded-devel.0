Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 73A9477EFE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 22:10:51 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id b6so8399726pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 15:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=p0IWI2kv6THrygegcTKB+MqPMGaBArin0vYWFYpTBc4=;
	b=BxRVhT2NqGCo4Zk4m3fHFC+SKQUk0oL5TN6t0ugSyJ+/N1GsGLSrcGn9U1oq0+HNX7
	qMWJvid0arSfs0UbGjcoXeG5y+2qloNuxiF6x7RBOvh0WU/Sf2TP9bayfKg8P/qy9xvH
	E9FclH5hBUmQldwf999E/l7gG8e/g6W+7t+SrQY2DdG1ei+S/DVm8ZhlHESdx1n1Ylqb
	haIkjpDIMZZM0EKuLA9K0U5wwxqvQUYO1vgO4Msvt3N1mhl1W4TawmSXQunbhQiEVP7I
	MDMT0FwqomN9CATBKXAJJ9zDqVvdEe9nZC654xK2JHpovD0VWxNaWvK0G2rXNPrL6pgg
	A+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=p0IWI2kv6THrygegcTKB+MqPMGaBArin0vYWFYpTBc4=;
	b=tYNqhVYmRxTE8oTGNcqSJsmBjuG2aEc5OlhU3FWlJN4QDhFz1NFwfrNlyKO8je5EJn
	EFdxzzsKugQMqlzuuTJLSqOxIrqfP1xNVRgg7OMOx0U9irGy8GsgwtXpcs9sS9601BXu
	T9kLVlMaf4o19xdjRZVjeA819neuvqDImgk4zsbyeHc7UwOa27iNbTeFyPAyqVKhgz0p
	uxtEz1EM8kIeUdRaTZkA93+aeQGrHa4lAaU0ln48oZuD9mIPuWPZn4ptL6OAUMnwRrJ2
	CzorHNqetgDCz2618aGAqmO+XXLdi3uxJq7QCQqNd22U6E1HCvEzdkbeqrDtMRweO8Wk
	B06w==
X-Gm-Message-State: AMCzsaW3VztW28nx+uawo75vIRUD95al1EpHldLi6m7n+GU0W7SEjW7x
	SJ0hIBuzih2V6ii57Itf0AE=
X-Google-Smtp-Source: AOwi7QBQUGW811Se3LwNndm1zO5KpVKo/dMwVyQ3q4AuHXU2SgMWSgCS+NZAeK378iBMumzFycrd5A==
X-Received: by 10.159.194.196 with SMTP id u4mr10202852plz.49.1508191852628;
	Mon, 16 Oct 2017 15:10:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:8194:6b43:14e2:94fc])
	by smtp.gmail.com with ESMTPSA id
	d89sm12657269pfb.121.2017.10.16.15.10.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Oct 2017 15:10:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Mon, 16 Oct 2017 15:10:47 -0700
Message-Id: <cover.1508191555.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] Pyro-next pull request
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
X-List-Received-Date: Mon, 16 Oct 2017 22:10:51 -0000

cover leter only:
Please merge Pyro-next to Pyro and apply these changes too.


The following changes since commit 3552877d24845689e7d4e7919ff7b372da70dd40:

  wireshark: update to 2.2.9 (2017-09-18 12:06:38 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib akuster/pyro-next
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=akuster/pyro-next

Mark Hatle (1):
  hostapd: fix WPA2 key replay security bug

Philip Balister (1):
  sip: update recipe to 4.19.2.

 .../hostapd/hostapd/key-replay-cve-multiple.patch  | 984 +++++++++++++++++++++
 .../recipes-connectivity/hostapd/hostapd_2.6.bb    |   1 +
 .../sip/{sip_4.19.bb => sip_4.19.2.bb}             |   4 +-
 3 files changed, 987 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/key-replay-cve-multiple.patch
 rename meta-oe/recipes-devtools/sip/{sip_4.19.bb => sip_4.19.2.bb} (92%)

-- 
2.7.4


