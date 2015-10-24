Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id B4A0C65D00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 04:08:15 +0000 (UTC)
Received: by wikq8 with SMTP id q8so100027755wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 21:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=KhqN5oakElEtXFgAxpj0J6tcdxAP1CODbazt0twKO+Y=;
	b=ZCDlEkres1czx6EAIn208DXNq3pWCRVpMimXiVBPRgqQbVIpI4da4ODliwmWnca315
	CHhxkBjMqbAxPeHSa3EL7ORXjdncDw9Z7QRbX4oiA4pOEoyh7AN+uWgCFAoHw8OiQim/
	As05BTGf+Zht2cDUU3TNVPLOI9KBCJBpl8hpRhiKGrapvFwL4eVU0gGl6zCITNWrURRP
	/rRJcKYuz2cV5Pemg0MO4TgHpfKSd1/71qZ4w73NQjzibsiJdZWSQ/YW638NFAmR4NIj
	rjaFFXThQ7lbg/rE0cG0jR1JXZ6sge4Ijc9DloK7zKtL3XTj7s7DPIiP/zaUzF3I2cZO
	3Trg==
MIME-Version: 1.0
X-Received: by 10.194.90.169 with SMTP id bx9mr30681015wjb.1.1445659695928;
	Fri, 23 Oct 2015 21:08:15 -0700 (PDT)
Received: by 10.194.140.38 with HTTP; Fri, 23 Oct 2015 21:08:15 -0700 (PDT)
Date: Fri, 23 Oct 2015 21:08:15 -0700
Message-ID: <CAJ86T=UQNMedMzCVO8kYqGAc3uJRrCW4a_w7UhMT=4_D1_XvwQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC] move ninja-native to meta-oe
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
X-List-Received-Date: Sat, 24 Oct 2015 04:08:18 -0000
Content-Type: text/plain; charset=UTF-8

The are currently ninja-native recipes in meta-qt5 (v1.5.3) and
meta-browser (v1.4.0).

Any objections to me submitting patches to add a ninja-native v1.6.0
recipe to meta-oe and remove the older recipes from meta-qt5 and
meta-browser?

