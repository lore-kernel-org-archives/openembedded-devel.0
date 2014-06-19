Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 609F06FD77
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 11:52:50 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id q108so1975194qgd.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 04:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=xIA70FHy7QIyuR46e8MjXbohTASPTpgxV8d4SXNpxoE=;
	b=OPqfpH9+BD7WDnohDFyTP11XyyAxfNrzW6H0UuFldVVLDOiroDX4a8jaOL4jy5wBFj
	BlxCkkbTDw4TkOb5T+Jcjpvs3BXrZdqOuQTrs4CLot97PEddjA9GIBaNX8/vdr4u2CTm
	DhM9gJKq7fhcQ+2aiKdh/DT+KdEKqUFW052RjZMt/SMTSW+1e6+PWJ1t0A5FkdZMMsGW
	Ljk4HsOUOUGZmZt5NltZARz1U9dLh/XTu4qlEo3UymGxTXHTEZnHxdNwHxMZeeXphthL
	ylcjuWHjsZ/UAYIOa/QG2xIkv8hDoSot93i17l89c0okAIWmW+e3jYjmt359+xoaPc4q
	pySw==
MIME-Version: 1.0
X-Received: by 10.140.102.163 with SMTP id w32mr5606116qge.97.1403178771548;
	Thu, 19 Jun 2014 04:52:51 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.140.17.44 with HTTP; Thu, 19 Jun 2014 04:52:51 -0700 (PDT)
Date: Thu, 19 Jun 2014 07:52:51 -0400
X-Google-Sender-Auth: K5mxL4IKWcTQB6cjD_gdT6sThA0
Message-ID: <CAOd_LFwu0hwLcU1+oAvK9TVtsbbawDhRqd=1wafXfOKOWw5T+g@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][daisy] pull request, update README's, live555 fix
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
X-List-Received-Date: Thu, 19 Jun 2014 11:52:52 -0000
Content-Type: text/plain; charset=UTF-8

The following changes since commit dca466c074c9a35bc0133e7e0d65cca0731e2acf:

  python-efl: add dependency on python-dbus and lua to always build
edje and elementary bindings (2014-05-12 10:08:28 +0200)

are available in the git repository at:

  https://github.com/cbrake/meta-openembedded.git daisy-to-merge

for you to fetch changes up to f3f1d14a6587d72388f50725b0a49c84cf417eb9:

  live555: fix fetch problem (2014-06-18 13:42:35 -0400)

----------------------------------------------------------------
Cliff Brake (1):
      update maintainer info in README's for daisy

Steffen Sledz (1):
      live555: fix fetch problem

 meta-efl/README                                | 16 ++++++++++++----
 meta-filesystems/README                        | 15 +++++++++++----
 meta-gnome/README                              | 16 ++++++++++++----
 meta-gpe/README                                | 16 ++++++++++++----
 meta-initramfs/README                          | 12 +++++++++---
 meta-multimedia/README                         | 15 +++++++++++----
 meta-networking/MAINTAINERS                    | 11 +++++++++--
 meta-networking/README                         |  2 +-
 meta-oe/README                                 | 14 +++++++++++---
 meta-oe/recipes-multimedia/live555/live555.inc |  4 ++--
 meta-perl/README                               | 13 ++++++++++---
 meta-ruby/README                               | 17 +++++++++++++----
 meta-systemd/README                            | 16 ++++++++++++----
 meta-webserver/README                          | 13 ++++++++++---
 meta-xfce/README                               | 16 ++++++++++++----
 toolchain-layer/README                         | 14 +++++++++++---
 16 files changed, 158 insertions(+), 52 deletions(-)

