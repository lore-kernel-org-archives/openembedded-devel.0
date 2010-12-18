Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1PTs5x-0003rW-Jw
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 09:24:49 +0100
Received: by vws6 with SMTP id 6so550413vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 00:24:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.180.8 with SMTP id bs8mr609252vcb.128.1292660684493; Sat,
	18 Dec 2010 00:24:44 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.29.2 with HTTP; Sat, 18 Dec 2010 00:24:44 -0800 (PST)
X-Originating-IP: [95.29.187.197]
In-Reply-To: <AANLkTin7AtzCpMmNq_SSHcbDjZqaFXcdgd6T5fHrfb0r@mail.gmail.com>
References: <AANLkTin7AtzCpMmNq_SSHcbDjZqaFXcdgd6T5fHrfb0r@mail.gmail.com>
Date: Sat, 18 Dec 2010 11:24:44 +0300
X-Google-Sender-Auth: hgh3RicncwZ51RjtQ1txzbTlyRs
Message-ID: <AANLkTi=x5k0t859n2m7ehEvUQuL+Ew4LJfCnW6ghZwDD@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: do_rootfs and mkfs.jffs2
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
X-List-Received-Date: Sat, 18 Dec 2010 08:24:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/18 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> I just tried to make a jffs2 image, but got an error that mkfs.jffs2
> was not found.
> Apparently somewhere a dependency to mtd-utils-native should be added,
> but I have no idea where.

Builds for ben-nanonote was affected by this for me:
http://tinderbox.openembedded.net/packages/1355261/
http://tinderbox.openembedded.net/packages/1364452/

-- 
Yury Bushmelev


