Return-Path: <JK.Behnke@web.de>
Received: from mout.web.de (mout.web.de [212.227.15.4])
	by mail.openembedded.org (Postfix) with ESMTP id C13807CF54
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 14:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1552055246;
	bh=bqYkro4lwHhqm+WYQARTw3HrYDU35VqS/2QP4tqpWk0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NfPAFagga1NykoOujy0Xau5gdinb50ZtvYl9daNbtGqv9WY0OIwPss6mtMlmaimY7
	6Wtw7xDAwtqcXOnzdkbP9uev1zbCU6Rjbxqxer0GaqB8a1+TZc2p+YAdk4Fu+5RsTv
	gh782nvypK47n3bFpV4N+A0YkK3r11OQM7nTKB5w=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [212.185.41.2] ([212.185.41.2]) by web-mail.web.de
	(3c-app-webde-bs44.server.lan [172.19.170.44]) (via HTTP);
	Fri, 8 Mar 2019 15:27:26 +0100
Message-ID: <trinity-4571896f-c682-4775-a201-8fcb128244b2-1552055246508@3c-app-webde-bs44>
From: JK.Behnke@web.de
To: "Martin Jansa" <martin.jansa@gmail.com>
Date: Fri, 8 Mar 2019 15:27:26 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <CA+chaQePK29qJaYxfkkaYTs4S5z+i=bdFQSe8npP0f6HY=3Y-Q@mail.gmail.com>
References: <trinity-c0b64e17-7878-4cf2-b46c-881a1b38055e-1552051786391@3c-app-webde-bs44>
	<CA+chaQePK29qJaYxfkkaYTs4S5z+i=bdFQSe8npP0f6HY=3Y-Q@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:GNIJNOffh+nt61fdfuGQLpM7tmq6+KVc+0TgS5m8c8ykHpeDPXYeboe8Nq0g+5mxQ797K
	G4CXsme7h0S/BVn/ETyRF+KGyJL3vCCKfAFSoNXJMcd0FWuwnVi3BX6kCIB/llrdDhyeeY0+ckW3
	ItsqhLgZth8QGxjfWN5K7/ktuIXgm08VNuIu9+mVB++iXf1BQhxjXI1Rhsr6EAO6XBuhgbXI0QZj
	grKDKihJqTphm/nzZ77zANsBZAdSIXQC5pm1/jlqDY7sc4IHPnUdLAkqjaF+rZ9dX8UD03L/4CVZ
	eg=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NsM7Iiy/AU8=:u5Fs3HALTV6LH66iqs0ssg
	Ewk3pANpGqHdb0S4/H2V6JGinhwE/QrIIfEII3+tDMZHQGY4voBMKkZnD/0Ozb6Jk9JvK6jyn
	no+at6SdOOwUuEx2RW9ScmxiEknF7imxuaM3ODhd4NLgUjYMeHxbSU+ep5K6VYI3XsZ/pFVbb
	+73bXi7RfCgCwXpNVJmH6LxOO7R1AuURKLD4COJXDCpoKTVJYpnAp6wYeSYeF6QWZ7x3LjaMT
	v88r5H9MvIhi29v8HKeEPTVpUHW/CJ8sPWEXzj9DMZR8V3q0k4QVxuvLi3jMQMLFJJLrZST2R
	NTzbGno61dw0Md9u+aqBvWFFKkSGVqSVU4etOmRV32dioHBTfG4+nnnYCoJBf7/51t+Y9hl9o
	P5tY9EFUG+JI6SaJX/9h2blGX+eynu7gepVNrEFc8HOuY9lVdBFOmDc57fxgV9CKa/T2fKH0b
	oT9MyJN8Ibsai9BNo1d/9kB3ITPRZWpUBWOoh4Io7xYXwpUnqvhePnMxnO/No4DzE/wANwqEX
	w1sFjibD8a7WBKgGLz/32MGzUcg6UphSOan91o2eJnrgD8c8qgu8/Vwi15tunos02NV5zGO/t
	+WLwybF8PwhiY=
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-qt5 - support for QT 5.12.1?
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
X-List-Received-Date: Fri, 08 Mar 2019 14:27:27 -0000
Content-Type: text/plain; charset="UTF-8"


