Return-Path: <piyush.mohabansi@gmail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id CC2A560107
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 21:38:52 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id c2so128830908vkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 14:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=zg3/IdlT36SGT4bNGeG2UPJ3OSHWY8objAJ2K63fYlg=;
	b=mKUDQn7O70/dw9dO7Xlwbb1wJwgKCYEWihcjNRCQekFar5Bt4s9ATExrkvjudQz3uO
	2I8VAWn3ZraGZAfRwWr9H5irWv00Rv+Y2oOMJnx+1zPcL4kwCjQCJdQhbP65V1AfU+1t
	yDL/Hl5RmOS30eOVgqits1yGJzpcSaVXX9Fc9wA3E1tQLlXB0zmcFF+TTzPwmkvMQXMk
	vHxVNqBzvuOcE60OCEO/JJJaeruHDKEMa6APCTMWbrpawZQwOTfiO8O5LDqsxhb8WKJi
	gLAVZJIDiW5IoFRx/NNJcEYin814zgGlrBd6jZXZuQr5IoHvW3InY+qh9ES/ex7vNHl3
	1Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=zg3/IdlT36SGT4bNGeG2UPJ3OSHWY8objAJ2K63fYlg=;
	b=cx66mvs8uvPTBriCahbVWz8XTes5u9tAAGg1EPiOCUNGdh1Rzv7QLTznbeJdnEGXF7
	jabPzWQyY6weefWIKZhOG1QagPGuREDu64MPe53FEJ08lA21Ow5OOHDTgP8iHdMmERNa
	q0fsuFituRrfKe/ejUdHH7S3R+b1Zx3aetDhvukL+O/imNriiSjc5qwjxHcob9TMJvrR
	aDyHeSoqhyAKyN458cVL3Gqo9Wjmb7AoEdfvvWt8j/61LddZt5I4OFi5XvLkU1i9R4Xz
	i1mmFACEFN86e0ezpfg6kMeAal8rtcrHurNx0Igj7oC8YbgLubjFDNQuE9xrcwuP7DWy
	XWcw==
X-Gm-Message-State: ALyK8tKv/oCqBnXf2BgoVnYW/tKaVqNDQWEK1L/SDrqJsBj1aGQUhQ0DpJlU4fXZSfT3FjSRSSZIL3CQL5xPTA==
MIME-Version: 1.0
X-Received: by 10.31.83.197 with SMTP id h188mr7863450vkb.23.1467322733467;
	Thu, 30 Jun 2016 14:38:53 -0700 (PDT)
Received: by 10.103.71.1 with HTTP; Thu, 30 Jun 2016 14:38:53 -0700 (PDT)
Date: Thu, 30 Jun 2016 17:38:53 -0400
Message-ID: <CA+1cOABFhC+k0YBVxpCSyMTTv2Kmy3qOK-W6EQzi2hxgo5+D5g@mail.gmail.com>
From: Piyush Mohabansi <piyush.mohabansi@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] how enable WebGL or Canvas3D
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
X-List-Received-Date: Thu, 30 Jun 2016 21:38:55 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm new to yocto project and I'm trying to demonstrate webgl or canvas3D qt
capability. I'm able to build the project. But when I try to run the
application it says the webgl or canvas3D is not enabled or no support is
available.

Need your kind help in this regards or if you know who can help me with my
query then please pass on the contact info.

Thank you for your help & support here.

Kind regards,
Piyush

