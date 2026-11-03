Received: from mail-244117.protonmail.ch (mail-244117.protonmail.ch [109.224.244.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9799.1793707851220996019
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 04:10:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=mfbLfrzE;
 spf=pass (domain: geanix.com, ip: 109.224.244.117, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1793707848; x=1793967048;
	bh=Gr6s7L9nlmJDtA1tuhKwtceBX7Mfl+EAW6kCO3z0HdE=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mfbLfrzEJPKBppu1N0+gSPqg1Xv/JBsNTiZIDbn9zRRWGPxkqLF+SyoMFuVlubhkI
	 KcYz2Cz8dvf/ZMfnc/xhnql7IYSvWScYO0/aQc38wTW4egVcXfxg77Z1pbXEGtslXN
	 lpKRcglHNN3rsvehBs3+gtQhv8DB3xde5TY52wcmmytg2WKNSON4J/USGjQ3g/hUwI
	 methgfcJexnHvTMlTE8ximXn17ENFNMBgv+jRsdQ7pV7etgDmFIIrz2QlOtHKESkfc
	 lsFKqL8OgTj7J0NVQBrN0jzlBVUP4kbg/m6I3n4LxQ+dWEpPrUFwS85p8n7oNVQKGJ
	 yJi9cDZ8Qo6qQ==
Date: Tue, 03 Nov 2026 12:10:44 +0000
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
From: Sean Nyekjaer <sean@geanix.com>
Subject: [meta-oe] uutils-{findutils,diffutils,grep}
Message-ID: <64AB777D-1126-44BA-8715-7DB116CE4CF3@geanix.com>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: 7723bbac9e3c04c6639b5d8a137f718169557875
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 12:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131786

Hi Khem,

Would it be okay to send patches for adding uutils-{findutils,diffutils,gre=
p}, they are all in =E2=80=9Cbeta=E2=80=9D?

Guess it would be okay to wait with the rest as they are in =E2=80=9Calpha"=
 and =E2=80=9Cin progress=E2=80=9D...

/Sean
