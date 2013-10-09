Return-Path: <jicheu@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 34E57610F5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 08:51:17 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id k11so233225eaj.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Oct 2013 01:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type; bh=YOeIplV3BsUQM3M3OR92vjZU4VsfytKTiBAdzqJjqHc=;
	b=rHxivFoYsmUFpJsaar7uG+1ThrwGYbhr2+vUGJVc97OdM2JDIaRU4Dv1UukgSoVUHs
	L9rLfgg2T5M8af0B/wnlrDiymX80ZQQl7VXb5TYlhGeJ0OgqWqXjD4vz+9vqgZJlA8Pk
	p29CsxuN2nxG5meAftcewnqbvIFQippBtWwv4ziClTow8MotSJe10gyIxBmlEdn14iCc
	MyXRAQ0e7OKTHk18TmW0BjXy4RRFidZCLPnxTFBx1E/bUZ3TuVCG/DAp6eZfmHNDJu6x
	oHc28t94kt72y897U2JD512a+adxeXyVk1hn6haef/t3CtdQmp2C1f7rGgeQfV/Z8Atd
	BKrA==
X-Received: by 10.14.212.72 with SMTP id x48mr4432560eeo.0.1381308678089;
	Wed, 09 Oct 2013 01:51:18 -0700 (PDT)
Received: from [192.168.0.50] (aig34-1-88-167-231-94.fbx.proxad.net.
	[88.167.231.94])
	by mx.google.com with ESMTPSA id d8sm86138799eeh.8.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 01:51:17 -0700 (PDT)
Message-ID: <52551903.7020606@gmail.com>
Date: Wed, 09 Oct 2013 10:51:15 +0200
From: Jean-Charles <jicheu@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-webos] openwebos pointer question on virtualbox / qemu?
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
X-List-Received-Date: Wed, 09 Oct 2013 08:51:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This is a newbie question, sorry about it. I built webos from the 
meta-webos recipe from within yocto by manually adding the meta layer 
(but I get the exact same result using 
https://github.com/openwebos/build-webos).

When running the generated vmdk from virtualbox, I get a full webos 
running, the keyboard is functionning but I have no pointer device: the 
mouse is not integrated, and I couldn't find any keyboard-hack to point 
& touch anywhere on the screen.

Apologies if this is not the right place. Otherwise thanks for your help :)

Cheers,
Jay

