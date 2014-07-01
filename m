Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id CEC9B609B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 19:13:09 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id i50so3723313qgf.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2014 12:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=rCmsdHbfLq3wXUEsJHtqfwwJAQQZq2lojVwYakZthLI=;
	b=hRxKxGjUTGSf3FE6JayISxGYZ/GEjUZwZhMQhi4n8/ej0dc4F8NLwD1YaFidDJSXLZ
	EcDu6AKik5x3Shrc33dkFn946dMhRunlX7CHj0G96CpUJLulx/potxJY8W5pMRJ+z/GG
	Q27opakN4zbyPMU296BvGlo+gnHvZGYUDAf/v3xIi4nUhekaNHlvTvnutB0DPl2TMbXB
	p0rLvPouTWueM+Qi+warA2/oynSM3uwjUnMc6TUt/afcBEAnyMSlojwr5Eib/oDgaBI4
	7ZvUUgRjdI+JSCF0Rbmkfs/KzWwnDpQzQPxlHTrCCY7RlqKjyixp+nKZpZfohiXfyHSt
	L37A==
MIME-Version: 1.0
X-Received: by 10.229.127.9 with SMTP id e9mr73116716qcs.5.1404241990317; Tue,
	01 Jul 2014 12:13:10 -0700 (PDT)
Received: by 10.140.17.44 with HTTP; Tue, 1 Jul 2014 12:13:10 -0700 (PDT)
Date: Tue, 1 Jul 2014 15:13:10 -0400
Message-ID: <CAOd_LFx-3ko_BrD_9VpPj-oairm8XQrfoWzq8JEWmcsFQuK_GQ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][meta-networking][daisy] pull request rng-tools, ptpd
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
X-List-Received-Date: Tue, 01 Jul 2014 19:13:13 -0000
Content-Type: text/plain; charset=UTF-8

The following changes since commit a6dcf6265822ca1484d991d10a3042e04a960cdb:

  live555: fix fetch problem (2014-06-23 12:58:31 +0200)

are available in the git repository at:

  https://github.com/cbrake/meta-openembedded.git

for you to fetch changes up to ee24939c4c70b63a9fb7e93a58889a3231d3d367:

  rng-tools: Update rng-tools version to 4 (2014-07-01 15:08:41 -0400)

----------------------------------------------------------------
Balasubramanian, Aparna (1):
      rng-tools: Update rng-tools version to 4

Franklin Cooper Jr (1):
      ptpd: update to 2.3.0

 meta-networking/recipes-daemons/ptpd/ptpd-2.2.0/ld-as-needed.patch
| 37 -------------------------------------
 meta-networking/recipes-daemons/ptpd/{ptpd_2.2.0.bb => ptpd_2.3.0.bb}
| 21 +++++++++++----------
 meta-oe/recipes-support/rng-tools/{rng-tools_2.bb => rng-tools_4.bb}  |  4 ++--
 3 files changed, 13 insertions(+), 49 deletions(-)

