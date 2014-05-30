Return-Path: <chmorgan@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 91EC96FDEE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 17:14:53 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id x19so2055076ier.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 10:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=WAQNJ5UH9VBisDvY2/qUW8CPRop/l1dXsQFb+Suf6l0=;
	b=iRzsTubHTevnRVFoZsTO1eua4wQ7CsV9sn8TcZArHbtt9gwP3G2Tiw+BsH2F4HSU9u
	mpYMx+aOUxakgHqKFEh+9foOJq9VWSnh01mibVvGcfCLdaxHT4tIkBSxF2+hWy/dhEvB
	75jtN/CEKmqdk8c9+zqMLrqfsbYbBS8k0/eAtUQ46EPHEOVK2/quXYqj+vEUB/bbKy95
	yCLppmXDzk0uBGuw+fbSmKYecpOfaPJ+cRulst1d2+9zvxPEWyd0UnNcImrdfxWmpOlz
	eGqcq1o6LDcv8zDb2+BiYpbUv2BBuqIZPAvyPRQc6GgbSs9dYgIJ6hrsCsJUzl25jH/b
	rpOg==
X-Received: by 10.50.120.3 with SMTP id ky3mr7500095igb.24.1401470094240; Fri,
	30 May 2014 10:14:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.228.141 with HTTP; Fri, 30 May 2014 10:14:34 -0700 (PDT)
From: Chris Morgan <chmorgan@gmail.com>
Date: Fri, 30 May 2014 13:14:34 -0400
Message-ID: <CAAPegz1HGg34=2kp7DUj8hOR3dmc1QtVe+hFvQPVoNhz5ptTeg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 0/2] dfu-util cleanup
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
X-List-Received-Date: Fri, 30 May 2014 17:14:55 -0000
Content-Type: text/plain; charset=UTF-8

Add a recipe for building 0.7, remove old 0.1 recipe.

Chris Morgan (2):
  dfu-util 0.7 recipe
  Remove old dfu-util 0.1 recipe

 meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb | 10 ----------
 meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb |  6 ++++++
 2 files changed, 6 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb
 create mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb

-- 
1.9.3

