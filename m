Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 5101078330
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 18:16:11 +0000 (UTC)
Received: (qmail 24163 invoked by uid 1003); 11 Sep 2017 18:16:12 -0000
Received: from unknown (HELO ?172.16.29.59?) (philip@opensdr.com@67.52.142.103)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	11 Sep 2017 18:16:12 -0000
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: Philip Balister <philip@balister.org>
Message-ID: <a7f23460-365f-925a-f5cd-6b95159749c9@balister.org>
Date: Mon, 11 Sep 2017 11:16:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [meta-oe][Pyro]Update Sip to 4.19.2 from 4.19
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
X-List-Received-Date: Mon, 11 Sep 2017 18:16:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit

Armin, can you pull commit 229f824568406df354bc857b31989a7777d778bb that
upgrade sip from 4.19 to 4.19.2 into meta-oe/pyro?

meta-qt5/pyro uses PyQt-5.8.2, but it also requires sip-4.19.2 to build.
Updating this package in pyro would solve a build problem for PyQt5 users.

Philip

