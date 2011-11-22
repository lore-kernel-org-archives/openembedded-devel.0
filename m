Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RSv0R-0006zv-9H
	for Openembedded-devel@lists.openembedded.org;
	Tue, 22 Nov 2011 19:23:43 +0100
Received: by yenm2 with SMTP id m2so522576yen.6
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2011 10:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=Xj71GAvDpToZoQISZGBCMtF52w+Tdw+SGnheMetNVz4=;
	b=OQhB9mZX7sr0S/BnSB6ys7lmanu1hZ6+rjBp9uup+b8CaQ1fBz3F5+BtbftlgComWh
	eyZ2t+dAtz6v25OrddOAhZzxdJtVTVwwYDYjqJdB1oYILAX889ldnGN/aMG6N/mhoOcc
	BEnKO4ReIFRwOvtShVUy2kXKs1N/zTxUC9RCc=
Received: by 10.152.105.226 with SMTP id gp2mr12476217lab.28.1321985830070;
	Tue, 22 Nov 2011 10:17:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Tue, 22 Nov 2011 10:16:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Nov 2011 10:16:38 -0800
Message-ID: <CAMKF1squRxNrL4q__e7p-Vi4eK-TD1kv9DDAviCCEowEFogMAw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: gcc-4.6 linaro updates
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
X-List-Received-Date: Tue, 22 Nov 2011 18:23:43 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I have pushed a contrib branch with latest linaro updates for gcc 4.6
the tree is here please try it out, I have built
systemd-gnome-image/angstrom for all qemu arches
successfully but I am looking for more testing help

http://git.openembedded.org/meta-openembedded-contrib/log/?h=kraj/gcc-linaro-update

Thanks
-Khem


